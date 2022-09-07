<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.StudentBean" %>
<%@ page import="beans.ScoreProc" %>

<!-- EL 람다식 -->
${factorial = (n)->n==1 ? 1 : n*factorial(n-1); ''}
${factorial(5)}<br />


<!--
	EL Stream
-->
<!-- stream() -->
${list = [1,2,3]; sum = list.stream().sum(); ''}<br />
${list = [1,2,3]; sum = list.stream().sum(); sum}<br />

<!-- map() -->
${list2 = [1,2,3]; sum = list2.stream().map(x->x*x).toList(); sum}<br />

<!-- filter() -->
${list3 = [1,2,3,4,5]; result = list3.stream().filter(x->x>2).map(x->x*x).toList(); result}<br />

<!-- sorted() -->
${list4 = [4,3,5,2,1]; result = list4.stream().sorted().toList(); result}<br />
${list5 = [4,3,5,2,1]; result = list5.stream().sorted((x,y)->x<y ? 1 : -1).toList(); result}<br />

<!-- limit() -->
${list6 = [4,3,5,2,1]; result = list6.stream().limit(3).toList(); result}<br />

<!-- count() -->
${list7 = [4,3,5,2,1]; result = list7.stream().count(); result}<br />
${list8 = [4,3,5,2,1]; result = list8.stream().filter(x->x>2).count(); result}<br />
${list9 = ['hello','java','hungry']; result = list9.stream().filter(x->x.length()>4).count(); result}<br />

<!--
Optional Type: get(), orElse(other), orElseGet( (()->T) other), ifPresent( ((x)->void) consumer)
값이 존재하는지 여부에 따라 다른 결과를 발생시킨다.
-->

<!-- get(): 결과가 있으면 결과 반환, 없으면 Exception -->
${[1,2,3].stream().max().get()}<br />
\${[].stream().max().get()}<br />	<!-- Exception -->

<!-- orElse(other): 결과가 있으면 결과를 반환, 없으면 other를 반환 -->
${[1,2,3].stream().max().orElse('최대값이 없습니다!')}<br />
${[].stream().max().orElse('최대값이 없습니다!')}<br />

<!-- orElseGet(람다식): 결과가 있으면 결과를 반환, 없으면 람다식을 수행 -->
${[1,2,3].stream().max().orElseGet( ()->-1 )}<br />
${[].stream().max().orElseGet( ()->-1 )}<br />

<!-- ifPresent(람다식): 결과가 존재한다면 람다식을 수행 -->
${minValue; ''}<br />
${[1,2,3].stream().max().ifPresent( x->(minValue=x) )}<br />
최소값은 ${minValue}입니다.<br />

<!-- sum(), average(), min(), max() -->
${[1,2,3,4,5].stream().sum()}<br />
${[1,2,3,4,5].stream().average().get()}<br />
${[1,2,3,4,5].stream().min().get()}<br />
${[1,2,3,4,5].stream().max().get()}<br />

<!--
anyMatch(): 매칭되는 것이 하나라도 있으면 true
allMatch(): 모두가 매칭되면 true
noneMatch(): 모두가 매칭이 안되면 true
-->
${list10 = [1,3,2,4,7,6,8,9,5,0]; ''}
${list10.stream().anyMatch(x->x>5).get()}<br />
${list10.stream().allMatch(x->x>5).get()}<br />
${list10.stream().noneMatch(x->x>5).get()}<br />

<br /><br /><br />
<%
	StudentBean s1 = new StudentBean(100,90,80);
	StudentBean s2 = new StudentBean(70,60,50);
	StudentBean s3 = new StudentBean(40,30,20);
	pageContext.setAttribute("s1", s1);
	pageContext.setAttribute("s2", s2);
	pageContext.setAttribute("s3", s3);
	
	ScoreProc sp = new ScoreProc();
	pageContext.setAttribute("sp", sp);
%>
${list = [s1, s2, s3]; ''}
국어점수 합계: ${sp.getTotal("kor", list)}<br />
영어점수 합계: ${sp.getTotal("eng", list)}<br />
수학점수 합계: ${sp.getTotal("math", list)}<br />
국어점수 평균: ${sp.getAverage("kor", list)}<br />
영어점수 평균: ${sp.getAverage("eng", list)}<br />
수학점수 평균: ${sp.getAverage("math", list)}<br />

<!-- 실습 1: 학생별 총점, 평균을 출력해보세요! -->
학생1 합계: ${s1.kor + s1.eng + s1.math}<br />
학생2 합계: ${s2.kor + s2.eng + s2.math}<br />
학생3 합계: ${s3.kor + s3.eng + s3.math}<br />
학생1 평균: ${(s1.kor + s1.eng + s1.math)/3}<br />
학생2 평균: ${(s2.kor + s2.eng + s2.math)/3}<br />
학생3 평균: ${(s3.kor + s3.eng + s3.math)/3}<br />

<!-- 실습 2: 과목별 점수가 가장 높은 학생의 이름을 출력해보세요! -->
<%
	StudentBean s11 = new StudentBean("홍길동",26,100,90,80);
	StudentBean s22 = new StudentBean("강감찬",30,70,60,50);
	StudentBean s33 = new StudentBean("이순신",50,40,30,20);
	pageContext.setAttribute("s11", s11);
	pageContext.setAttribute("s22", s22);
	pageContext.setAttribute("s33", s33);
%>

${studentList = [s11, s22, s33]; ''}
${engAvg = sp.getAverage("eng", studentList); ''}

국어 점수가 가장 높은 학생의 이름: ${studentList.stream().max((m1,m2)->m1.kor.compareTo(m2.kor)).get().name}<br />
수학 점수가 가장 낮은 학생의 이름: ${studentList.stream().min((m1,m2)->m1.math.compareTo(m2.math)).get().name}<br />
영어 점수가 과목 평균보다 높은 학생의 이름: ${studentList.stream().filter( x -> (x.eng>engAvg) ).map(x -> x.name).toList()}<br />