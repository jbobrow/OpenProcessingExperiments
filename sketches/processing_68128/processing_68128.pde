
float grade;
void draw() {
  print(grade);
  if (grade<=100&&grade>=90) {
    println("Assign letter grade A.");
  }
  else if (grade<90&&grade>=70) {
    println("Assign letter grade B.");
  }
  else if (grade<70&&grade>=60) {
    println("Assign letter grade C.");
  }
  else {
    println("Assign letter grade F.");
  }
  
  grade=random(1,100);
}


