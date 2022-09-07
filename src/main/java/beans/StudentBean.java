package beans;

import java.io.Serializable;

public class StudentBean implements Serializable{

	public static final long serialVersionUID = 32984723478979834L;
	
	private String name;
	private int age;
	private int kor;
	private int eng;
	private int math;
	
	public StudentBean() {
	}
	
	public StudentBean(int kor, int eng, int math) {
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}
	
	public StudentBean(String name, int age, int kor, int eng, int math) {
		this.name = name;
		this.age = age;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}
	
	@Override
	public boolean equals(Object obj) {
		return super.equals(obj);
	}

	@Override
	public String toString() {
		return String.format("StudentBean [name=%s, age=%s, kor=%s, eng=%s, math=%s]", name, age, kor, eng, math);
	}
	
}	// class
