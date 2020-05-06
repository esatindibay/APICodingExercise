package examples.person;

import com.intuit.karate.junit5.Karate;

class PersonRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("person").relativeTo(getClass());
    }    

}
