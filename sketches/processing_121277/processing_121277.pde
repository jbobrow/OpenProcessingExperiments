
PFont font; 
void setup() {
  size(300, 300);

  font = loadFont("ArialMT-48.vlw"); 
  textFont(font);
}

void draw() {
  background(0);
  fill(0);
  stroke(160);
  strokeWeight(5);
  rect(15,100,277,100);
  pushMatrix();
int a = minute();
int b = minute();
int c = hour();
int d = hour ();

  if (a%10 == 1) {
    textSize(90);
    fill (255, 0, 0);
    text(1, 240, 180);
  }
  else if (a%10 == 2) {
    textSize(90);
    fill(255, 0, 0); 
    text(2, 240, 180);
  }
  else if (a%10 == 3) {
    textSize(90);
    fill(255, 0, 0); 
    text(3, 240, 180);
  }
  else if (a%10 == 4) {
    textSize(90);
    fill(255, 0, 0); 
    text(4, 240, 180);
  }
  else if (a%10 == 5) {
    textSize(90);
    fill(255, 0, 0); 
    text(5, 240, 180);
  }
  else if (a%10 == 6) {
    textSize(90);
    fill(255, 0, 0); 
    text(6, 240, 180);
  }
  else if (a%10 == 7) {
    textSize(90);
    fill(255, 0, 0); 
    text(7, 240, 180);
  }
  else if (a%10 == 8) {
    textSize(90);
    fill(255, 0, 0); 
    text(8, 240, 180);
  }
  else if (a%10 == 9) {
    textSize(90);
    fill(255, 0, 0); 
    text(9, 240, 180);
  }
  else if (a%10 == 0) {
    textSize(90);
    fill(255, 0, 0); 
    text(0, 240, 180);
  }
  popMatrix();

  pushMatrix();

  if (b/10 < 2 && b/10 > 0) {
    textSize(90);
    fill (255, 0, 0);
    text(1, 180, 180);
  }
  else if (b/10 < 3 && b/10 > 1) {
    textSize(90);
    fill(255, 0, 0); 
    text(2, 180, 180);
  }
  else if (b/10 < 4 && b/10 > 2) {
    textSize(90);
    fill(255, 0, 0); 
    text(3, 180, 180);
  }
  else if (b/10 < 5 && b/10 > 3) {
    textSize(90);
    fill(255, 0, 0); 
    text(4, 180, 180);
  }
  else if (b/10 < 6 && b/10 > 4) {
    textSize(90);
    fill(255, 0, 0); 
    text(5, 180, 180);
  }
  
  else if (b/10 < 1 && b/10 > -1) {
    textSize(90);
    fill(255, 0, 0); 
    text(0, 180, 180);
  }
println(b/10);
  popMatrix();

  pushMatrix();

  if (hour()/10 < 2 && b/10 > 0) {
    textSize(90);
    fill (255, 0, 0);
    text(1, 20, 180);
  }
  else if (hour()/10 < 3 && b/10 > 1) {
    textSize(90);
    fill(255, 0, 0); 
    text(2, 20, 180);
  }
  else if (hour()/10 < 1 && b/10 > -1) {
    textSize(90);
    fill(255, 0, 0); 
    text(0, 20, 180);
  }

  popMatrix();

  pushMatrix();

  if (hour() % 10==1) {
    textSize(90);
    fill (255, 0, 0);
    text(1, 80, 180);
  }
  else if (hour()%10==2) {
    textSize(90);
    fill(255, 0, 0); 
    text(2, 80, 180);
  }
  else if (hour()%10==3) {
    textSize(90);
    fill(255, 0, 0); 
    text(3, 80, 180);
  }

  else if (hour()%10==4) {
    textSize(90);
    fill(255, 0, 0); 
    text(4, 80, 180);
  }

  else if (hour()%10==5) {
    textSize(90);
    fill(255, 0, 0); 
    text(5, 80, 180);
  }

  else if (hour()%10==6) {
    textSize(90);
    fill(255, 0, 0); 
    text(6, 80, 180);
  }

  else if (hour()%10==7) {
    textSize(90);
    fill(255, 0, 0); 
    text(7, 80, 180);
  }


  else if (hour()%10==8) {
    textSize(90);
    fill(255, 0, 0); 
    text(8, 80, 180);
  }

  else if (hour()%10==9) {
    textSize(90);
    fill(255, 0, 0); 
    text(9, 80, 180);
  }

  else if (hour()%10==0) {
    textSize(90);
    fill(255, 0, 0); 
    text(0, 80, 180);
  }
  popMatrix();



  boolean e = false;
  for (int i = 1; i<=second(); i++) {
    if (i % 2 ==0|| i == 0) {
      e=true;
    }
    else 
    {
      e = false;
    }
  //  println(b);

    if (e==true) {
      noStroke();
      fill (255, 0, 0);
      rect(152, 130, 10, 10);
      rect(152, 150, 10, 10);
    }
    else
    {
      noStroke();
      fill (0, 0, 0);
      rect(152, 130, 10, 10);
      rect(152, 150, 10, 10);
    }
  }
}



