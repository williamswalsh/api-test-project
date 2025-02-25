package app;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class TestRunner {

    @Test
    void testApiFeatures() {
        Results results = Runner.path("classpath:app/features")
                .parallel(1);

        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }


//    @Test
//    void testSingleFeature() {
//        Runner.path("classpath:app/features/PassingDataBetweenRequests.feature").parallel(1);
//    }

//    @Test
//    void testWithReport() {
//        Results results = Runner.path("classpath:app/features")
//                .outputCucumberJson(true)  // Enables Cucumber JSON report
//                .parallel(1);
//        assertEquals(0, results.getFailCount(), results.getErrorMessages());
//    }
}
