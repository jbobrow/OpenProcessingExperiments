
int num=1;
int num2=6;
boolean isColdOutside=false;

void setup() {
}

void draw() {

  if (num2 == 6) {
    ellipse(width/2, height/2, 10, 10);
  }
  else {
    ellipse(width/2, height/2, 70, 60);
  }


  if (num>5) {
    rect(10, 10, 20, 20);
  }
  else if (num>3) {
    rect(10, 50, 20, 20);
  }
  else {
    rect(60, 10, 20, 20);
  }


  if (num>3 && num>5) {
    println("always true if over 5");
  }

  if (num<3 && num>5) {
    println("never true");
  }

  if (num<3 || num >5) {
    println("everything but 3-5!");
  }

  if (num != 4 && num>2) {
    println("3, or 5 and above");
  }
  else if (num !=4) {
  }



  if (num !=4) {
    if (num >2) {
      println("3, or 5 and above");
    }
    else {
      println("well its less than or equal to 2, at least it's not 4");
    }
  }






  if (isColdOutside) {
    print("BRRRR");
  }

  if (!isColdOutside) {
    println("yay sun");
  }

  if (true) {
    println("true");
  }

  println(random(5));
  println(random(8, 20));

  exit();
}


