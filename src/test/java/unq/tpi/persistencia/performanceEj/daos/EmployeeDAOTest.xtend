package unq.tpi.persistencia.performanceEj.daos;

import java.text.SimpleDateFormat
import org.junit.Assert
import org.junit.Test
import unq.tpi.persistencia.performanceEj.daos.EmployeeDAO
import unq.tpi.persistencia.performanceEj.model.Gender
import unq.tpi.persistencia.util.SessionManager

class EmployeeDAOTest {

	@Test
	def void testFields() throws Exception {
		SessionManager.runInSession([
			val e = new EmployeeDAO().getByName("Parto", "Hitomi");
			val sdf = new SimpleDateFormat("yyyy-MM-dd");

			Assert.assertNotNull(e);
			Assert.assertEquals(11052, e.id);
			Assert.assertEquals(sdf.parse("1960-03-16"), e.birthDate);
			Assert.assertEquals(Gender.F, e.gender);
			Assert.assertEquals(sdf.parse("1988-11-11"), e.hireDate);
			Assert.assertEquals(0,e.departments.length);
			Assert.assertNull(e.department);
			Assert.assertEquals(2,e.historicDepartments.length);
			Assert.assertNull(e.title);
			Assert.assertEquals(1,e.historicTitles.length);
			Assert.assertEquals(51339.0, e.salary, 0);
			return null;
		]);
	}
}
