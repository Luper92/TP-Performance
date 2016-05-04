package unq.tpi.persistencia.performanceEj.model

import java.util.Date
import java.util.List
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import javax.persistence.PostLoad

@Accessors
public class Employee {
	Integer id
	Date birthDate
	Date hireDate
	String firstName
	String lastName
	Gender gender
	Set<Department> departments
	List<Department> historicDepartments
	Set<String> titles
	List<String> historicTitles
	List<Salary> salaries

	@PostLoad
	def Department getDepartment() {
		if(departments.isEmpty)
			return null
		departments.iterator.next
	}

	@PostLoad
	def Double getSalary(){
		salaries.last.getAmount()
	}

	@PostLoad
	def String getFullName() {
		lastName + ", " + firstName
	}

	@PostLoad
	def getTitle(){
		if(titles.isEmpty())
			return null
		this.titles.iterator().next()
	}
	
}
