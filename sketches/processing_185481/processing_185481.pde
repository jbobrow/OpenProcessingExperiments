
/*--
Assignment 2 
To calculate something.
Calculate pace from running minutes and miles run.
--*/

void setup () {
  println("I ran 5 miles in 40 minutes at a pace of " + pace(40.0,5.0) + " minutes per mile");
  println("I ran 7 miles in 47 minutes at a pace of " + pace(47.0,7.0) + " minutes per mile");
  println("I ran 13.1 miles in 99 minutes at a pace of " + pace(99.0,13.1) + " minutes per mile");
}

float pace (float time, float miles) {
  return time/miles;

}



