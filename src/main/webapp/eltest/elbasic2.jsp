<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="functions.MyFunction" %>
<%@ taglib uri="/WEB-INF/tlds/myFunction.tld" prefix="myFunction" %>

<!-- EL Collection -->
1. List: ${list=['a', 'b', 'c']}<br />
	list[1]: ${list[1]}<br />
2. Map: ${map={'name':'홍길동', 'age':'20'}}<br />
	map.name: ${map.name}<br />
	map.age: ${map.age}<br />
3. Set: ${set={1, 2, 3}}<br />	<!-- 객체가 아니면 wrapping이 됨 (boxing), Set은 인덱스 접근 불가 -->
<br /><br />

<!-- Semicolon 연산자 -->
${1+1; 2+2}<br />
${sum1=1+1; sum2=sum1+2}<br />
${list=[1,2,3]}<br />
${list=[1,2,3];""}<br />

<!-- 사용자 정의 태그 라이브러리 -->
${myFunction:sum(100,200)}<br />

<!-- EL 3.0에서는 import해서 바로 클래스의 정적메소드를 사용할 수 있다. -->
${MyFunction.sum(200,300)}