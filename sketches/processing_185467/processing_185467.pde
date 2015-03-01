
void setup(){
  println("Calculate BMI by entering weight in pounds and height in inches.");
  
  println(BMI(200, 60));
  println(BMI(110, 63));
  println(BMI(80, 50));

}


float BMI (float wt, float ht){
  float ht2 = pow(ht, 2);
  return ((wt*703)/ht2);
}




