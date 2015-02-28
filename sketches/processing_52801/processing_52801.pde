
float grade = random(0,100);

void setup() {
  size(500,500);
  
}

void draw() {
}

void keyPressed() {
  grade = random(0,100);
  if(grade>=90) {
    println(grade + "% is your score, which means you get an A. Great job!");
  }
  else if(grade>=80) {
    println(grade + "% is your score, which means you get a B. Pretty good.");
  }
  else if(grade>=70) {
    println(grade + "% is your score, which means you get a C. You passed, but you could do better.");
  }
  else if(grade>=65) {
    println(grade + "% is your score, which means you get a D. Come on, you could do better.");
  }
  else {
    println(grade + "% is your score, which means you get an F. Failing is unacceptable!");
  }
}



