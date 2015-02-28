
  int s = second();
  int m = minute();
  int h = hour();


void setup() {
  size(600, 600);
}


void mouseDragged() {

 if (mousePressed&&(mouseButton==LEFT)) {
    s=s+1; 
    if (s==59) {
      m=m+1;
      s=0;
    }
    if (m==59) {
      m=0;
      h=h+1;
    }
    h=constrain(h, 0, 23);
    m=constrain(m, 0, 59);
    s=constrain(s, 0, 59);
  }
  else {
    s = second();
    m = minute();
    h = hour();
  }
}
  
 
void draw() {


  //background color
  noStroke();
  fill(220, 222, 121);
  rect(0, 0, 600, 200);
  fill(255, 232, 183);
  rect(0, 200, 600, 200);
  fill(129, 174, 186);
  rect(0, 400, 600, 200);

  //old man : hour
  //head
  fill(36, 35, 34);
  ellipse(25*h+100-100, 45, 60, 60);
  //body
  quad(25*h+100-100, 70, 25*h+65-100, 135, 25*h+25-100, 125, 25*h+75-100, 60);
  //leg1
  quad(25*h+25-100, 125, 25*h+55-100, 115, 25*h+35-100, 200, 25*h+5-100, 200);
  //leg2
  quad(25*h+35-100, 115, 25*h+65-100, 115, 25*h+95-100, 200, 25*h+65-100, 200);
  //arm
  quad(25*h+75-100, 70, 25*h+140-100, 115, 25*h+130-100, 125, 25*h+65-100, 95);
  //stick
  fill(149, 78, 39);
  quad(25*h+145-100, 100, 25*h+150-100, 200, 25*h+140-100, 200, 25*h+135-100, 100);

  //young man : minute
  //head
  fill(36, 35, 34);
  ellipse(10*m, 245, 60, 60);
  //body + leg1
  quad(10*m-20, 260, 10*m-40, 400, 10*m-5, 400, 10*m+15, 260);
  //leg2
  quad(10*m-30, 330, 10*m+10, 400, 10*m+40, 400, 10*m+5, 330);
  //arm1
  quad(10*m, 260, 10*m+40, 320, 10*m+20, 330, 10*m-5, 295);
  //arm2
  quad(10*m, 250, 10*m-70, 300, 10*m-60, 320, 10*m-5, 295);
  //bowtie
  fill(217, 41, 41);
  quad(10*m-10, 260, 10*m+10, 280, 10*m+10, 260, 10*m-10, 280);

  //baby : second
  //head
  fill(36, 35, 34);
  ellipse(10*s, 500+15, 60, 60);
  //body
  rect(10*s-110, 505+15, 115, 50, 50);
  //leg1
  quad(10*s-100, 530, 10*s-120, 600, 10*s-90, 600, 10*s-70, 530);
  //leg2
  quad(10*s-100, 530, 10*s-70, 600, 10*s-40, 600, 10*s-70, 530);
  //arm1
  quad(10*s+5, 530, 10*s+35, 600, 10*s+5, 600, 10*s-30, 530);
  //diaper
  fill(255);
  beginShape();
  vertex(10*s-90, 515);
  vertex(10*s-110, 530);
  vertex(10*s-120, 560);
  vertex(10*s-100, 575);
  vertex(10*s-50, 570);
  endShape(CLOSE);



  if (mousePressed && (mouseButton == RIGHT)) { 
    if (5<=h&&h<=10) {
      morning();
      morning();
      morning();
      textAlign(CENTER);
      textSize(50);
      text("Good morning!*_*", 300, 300);
    }
    else if (11<=h&&h<=16) {
      afternoon();
      afternoon();
      afternoon();
      textAlign(CENTER);
      textSize(50);
      text("Good Afternoon!>.<", 300, 300);
    }
    else if (17<=h&&h<=7) {
      sunset();
      sunset();
      sunset();
      textAlign(CENTER);
      textSize(50);
      text("The day is passing fast! ㅜㅜ", 300, 300);
    }
    else {
      if (mousePressed) {
        night();
        night();
        night();
        textAlign(CENTER);
        textSize(50);
        text("Have a nice dream!^0^", 300, 300);
      }
    }
  }



  //NUMBER
  translate(0, 0);

  textSize(200);
  textAlign(RIGHT);  
  fill(56, 102, 60);
  text(h, 600, 200);
  fill(75, 57, 41);
  text(m, 600, 400);
  fill(9, 25, 38);
  text(s, 600, 600);

}
void keyPressed(){
  h = hour();
  m = minute();
  s = second();
}

void morning() {
  fill(random(214, 255), random(211, 229), random(208, 255), 100);
  pushMatrix();
  translate(random(-5, 5), random(-5, 5));
  ellipse(300, 300, 150, 150);
  morning2();
  morning2();
  morning2();
  popMatrix();
}

void morning2() {
  fill(random(214, 255), random(211, 229), random(208, 255), 100);
  pushMatrix();
  translate(random(-5, 5), random(-5, 5));
  ellipse(300, 300, 100, 100);
  popMatrix();
}

void afternoon() {
  fill(random(214, 255), random(30, 233), random(0, 194), 100);
  pushMatrix();
  translate(random(-5, 5), random(-5, 5));
  ellipse(300, 300, 150, 150);
  afternoon2();
  afternoon2();
  afternoon2();
  popMatrix();
}

void afternoon2() {
  fill(random(214, 255), random(30, 233), random(0, 194), 100);
  pushMatrix();
  translate(random(-5, 5), random(-5, 5));
  ellipse(300, 300, 100, 100);
  popMatrix();
}

void sunset() {
  fill(random(38, 191), random(3, 155), random(3, 122), 100);
  pushMatrix();
  translate(random(-5, 5), random(-5, 5));
  ellipse(300, 300, 150, 150);
  sunset2();
  sunset2();
  sunset2();
  popMatrix();
}

void sunset2() {
  fill(random(38, 191), random(3, 155), random(3, 122), 100);
  pushMatrix();
  translate(random(-5, 5), random(-5, 5));
  ellipse(300, 300, 100, 100);
  popMatrix();
}

void night() {
  fill(random(22, 191), random(0, 162), random(0, 107), 100);
  pushMatrix();
  translate(random(-5, 5), random(-5, 5));
  ellipse(300, 300, 150, 150);
  night2();
  night2();
  night2();
  popMatrix();
}

void night2() {
  fill(random(22, 191), random(0, 162), random(0, 107), 100);
  pushMatrix();
  translate(random(-5, 5), random(-5, 5));
  ellipse(300, 300, 100, 100);
  popMatrix();
}

