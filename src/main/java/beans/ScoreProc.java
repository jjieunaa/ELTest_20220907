package beans;

import java.util.List;

public class ScoreProc {
	
	// 과목별 총점
	public int getTotal(String subject, List<StudentBean> list) {
		int total = 0;
		for (StudentBean studentBean : list) {
			if (subject.equals("kor"))
				total += studentBean.getKor();
			else if (subject.equals("eng"))
				total += studentBean.getEng();
			else if (subject.equals("math"))
				total += studentBean.getMath();
		}
		return total;
	}
	
	// 과목별 평균
	public float getAverage(String subject, List<StudentBean> list) {
		return getTotal(subject, list) / 3;
	}
	
}	// class
