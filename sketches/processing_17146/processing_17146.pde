
Foot1 fo1;
Foot2 fo2;
Foot3 fo3;


 
void setup() {
  colorMode(HSB, 100);
  background(99);
  size(510,680);
  smooth();
  frameRate(1);
  fo1 = new Foot1(210, 0);
  fo2 = new Foot2(210, 0);
//  fo3 = new Foot3(190, 0);
}
 
void draw() {
  int s = second();
  int m = minute();
  int h = hour();
 
  noStroke();
  fill(99, 30);
  rect(0,0,width,height);
 
 
  pushMatrix();
  fo1.time();
  fo1.display();
  popMatrix();
 
  pushMatrix();  
  fo2.time();
  fo2.display();
  popMatrix();
  
//  pushMatrix();  
//  fo3.time();
//  fo3.display();
//  popMatrix();
   
}
 
/*
void keyPressed() {
  save("0812021.png");
}
*/
 
 class Foot1 {
  float x, y;
  Foot1(float _x, float _y) {
    x = _x;
    y = _y;
  }



  void time() {
    int s = second();
    int m = minute();
    int h = hour();
  }


  void display() {
    int s = second();
    if(s % 2 == 0) {

      translate(width/2, height/2);
      rotate(s * TWO_PI/60 - PI/2);
      ////////// あしあと
      pushMatrix();
      noStroke();
      fill(35);
      beginShape();
      vertex(x + 0, y + 5);
      vertex(x + 0, y + 3);
      vertex(x + 1, y + 1);
      vertex(x + 2, y + 0);
      vertex(x + 3, y + 1);
      vertex(x + 4, y + 3);
      vertex(x + 3, y + 4);
      vertex(x + 5, y + 9);
      vertex(x + 3, y + 12);
      vertex(x + 2, y + 11);
      vertex(x + 1, y + 10);
      vertex(x + 0, y + 8);
      endShape(CLOSE);
      popMatrix();
    }
    else {

      translate(width/2, height/2);
      rotate(s * TWO_PI/60 - PI/2);
      ////////// あしあと
      pushMatrix();
      noStroke();
      fill(35);
      beginShape();
      vertex(x +11, y + 5);
      vertex(x +11, y + 3);
      vertex(x +10, y + 1);
      vertex(x +9, y + 0);
      vertex(x +8, y + 1);
      vertex(x +7, y + 3);
      vertex(x +8, y + 4);
      vertex(x +6, y + 9);
      vertex(x +8, y + 12);
      vertex(x +9, y + 11);
      vertex(x +10, y + 10);
      vertex(x +11, y + 8);
      endShape(CLOSE);
      popMatrix();
    }

  }
}
 
class Foot2 {
  float x, y;
  Foot2(float _x, float _y) {
    x = _x;
    y = _y;
  }
 
 
  void time() {
    int s = second();
    int m = minute();
    int h = hour();
  }
 
 
  void display() {
    int s = second();
    int m = minute();
 
 
 
    if(m % 2 == 0) {
 
      translate(width/2, height/2);
      rotate(m * TWO_PI/60 - PI/2);
      ////////// おおきいあしあと
      pushMatrix();
      noStroke();
      fill(35);
      beginShape();
      vertex(x - 50 + 12, y +  5);
      vertex(x - 50 + 12, y +  3);
      vertex(x - 50 + 11, y +  1);
      vertex(x - 50 + 10, y +  0);
      vertex(x - 50 + 9, y +  1);
      vertex(x - 50 + 8, y +  3);
      vertex(x - 50 + 8, y +  5);
      endShape(CLOSE);
 
      beginShape();
      vertex(x - 50 + 12, y + 7);
      vertex(x - 50 + 12, y +  12);
      vertex(x - 50 + 11, y +  15);
      vertex(x - 50 + 9, y +  17);
      vertex(x - 50 + 6, y +  12);
      vertex(x - 50 + 8, y +  7);
      endShape(CLOSE);
       
      noStroke();
      fill(35);
      beginShape();
      vertex(x - 50 + 0, y + 14 +  5);
      vertex(x - 50 + 0, y + 14 +  3);
      vertex(x - 50 + 1, y + 14 +  1);
      vertex(x - 50 + 2, y + 14 +  0);
      vertex(x - 50 + 3, y + 14 +  1);
      vertex(x - 50 + 4, y + 14 +  3);
      vertex(x - 50 + 4, y + 14 +  5);
      endShape(CLOSE);
 
      beginShape();
      vertex(x - 50 + 0, y + 14 +  7);
      vertex(x - 50 + 0, y + 14 +  12);
      vertex(x - 50 + 1, y + 14 +  15);
      vertex(x - 50 + 3, y + 14 +  17);
      vertex(x - 50 + 6, y + 14 +  12);
      vertex(x - 50 + 4, y + 14 +  7);
 
      endShape(CLOSE);
       
      popMatrix();
    }  else {
       
      translate(width/2, height/2);
      rotate(m * TWO_PI/60 - PI/2);
      ////////// おおきいあしあと
      pushMatrix();
       noStroke();
      fill(35);
      beginShape();
      vertex(x - 50 + 12, y +  5);
      vertex(x - 50 + 12, y +  3);
      vertex(x - 50 + 11, y +  1);
      vertex(x - 50 + 10, y +  0);
      vertex(x - 50 + 9, y +  1);
      vertex(x - 50 + 8, y +  3);
      vertex(x - 50 + 8, y +  5);
      endShape(CLOSE);
 
      beginShape();
      vertex(x - 50 + 12, y + 7);
      vertex(x - 50 + 12, y +  12);
      vertex(x - 50 + 11, y +  15);
      vertex(x - 50 + 9, y +  17);
      vertex(x - 50 + 6, y +  12);
      vertex(x - 50 + 8, y +  7);
      endShape(CLOSE);
       
       
      noStroke();       
      fill(35);
      beginShape();
      vertex(x - 50 + 0, y + 14 +  5);
      vertex(x - 50 + 0, y + 14 +  3);
      vertex(x - 50 + 1, y + 14 +  1);
      vertex(x - 50 + 2, y + 14 +  0);
      vertex(x - 50 + 3, y + 14 +  1);
      vertex(x - 50 + 4, y + 14 +  3);
      vertex(x - 50 + 4, y + 14 +  5);
      endShape(CLOSE);
 
      beginShape();
      vertex(x - 50 + 0, y + 14 +  7);
      vertex(x - 50 + 0, y + 14 +  12);
      vertex(x - 50 + 1, y + 14 +  15);
      vertex(x - 50 + 3, y + 14 +  17);
      vertex(x - 50 + 6, y + 14 +  12);
      vertex(x - 50 + 4, y + 14 +  7);
 
      endShape(CLOSE);
 
      popMatrix();
    }
  }
}

  
class Foot3 {
  float x, y;
  Foot3(float _x, float _y) {
    x = _x;
    y = _y;
  }
 
 
  void time() {
    int s = second();
    int m = minute();
    int h = hour();
  }
 
 
  void display() {
    int h = hour();
 
 
 
    if(h % 2 == 0) {
 
      translate(width/2, height/2);
      rotate(h * TWO_PI/60 - PI/2);
      ////////// おおきいあしあと
      pushMatrix();
      noStroke();
      fill(35);
      beginShape();
      vertex(x - 50 + 12, y +  5);
      vertex(x - 50 + 12, y +  3);
      vertex(x - 50 + 11, y +  1);
      vertex(x - 50 + 10, y +  0);
      vertex(x - 50 + 9, y +  1);
      vertex(x - 50 + 8, y +  3);
      vertex(x - 50 + 8, y +  5);
      endShape(CLOSE);
 
      beginShape();
      vertex(x - 50 + 12, y + 7);
      vertex(x - 50 + 12, y +  12);
      vertex(x - 50 + 11, y +  15);
      vertex(x - 50 + 9, y +  17);
      vertex(x - 50 + 6, y +  12);
      vertex(x - 50 + 8, y +  7);
      endShape(CLOSE);
       
      noStroke();
      fill(35);
      beginShape();
      vertex(x - 50 + 0, y + 14 +  5);
      vertex(x - 50 + 0, y + 14 +  3);
      vertex(x - 50 + 1, y + 14 +  1);
      vertex(x - 50 + 2, y + 14 +  0);
      vertex(x - 50 + 3, y + 14 +  1);
      vertex(x - 50 + 4, y + 14 +  3);
      vertex(x - 50 + 4, y + 14 +  5);
      endShape(CLOSE);
 
      beginShape();
      vertex(x - 50 + 0, y + 14 +  7);
      vertex(x - 50 + 0, y + 14 +  12);
      vertex(x - 50 + 1, y + 14 +  15);
      vertex(x - 50 + 3, y + 14 +  17);
      vertex(x - 50 + 6, y + 14 +  12);
      vertex(x - 50 + 4, y + 14 +  7);
 
      endShape(CLOSE);
       
      popMatrix();
    }  else {
       
      translate(width/2, height/2);
      rotate(h * TWO_PI/60 - PI/2);
      ////////// おおきいあしあと
      pushMatrix();
       noStroke();
      fill(35);
      beginShape();
      vertex(x - 50 + 12, y +  5);
      vertex(x - 50 + 12, y +  3);
      vertex(x - 50 + 11, y +  1);
      vertex(x - 50 + 10, y +  0);
      vertex(x - 50 + 9, y +  1);
      vertex(x - 50 + 8, y +  3);
      vertex(x - 50 + 8, y +  5);
      endShape(CLOSE);
 
      beginShape();
      vertex(x - 50 + 12, y + 7);
      vertex(x - 50 + 12, y +  12);
      vertex(x - 50 + 11, y +  15);
      vertex(x - 50 + 9, y +  17);
      vertex(x - 50 + 6, y +  12);
      vertex(x - 50 + 8, y +  7);
      endShape(CLOSE);
       
       
      noStroke();       
      fill(35);
      beginShape();
      vertex(x - 50 + 0, y + 14 +  5);
      vertex(x - 50 + 0, y + 14 +  3);
      vertex(x - 50 + 1, y + 14 +  1);
      vertex(x - 50 + 2, y + 14 +  0);
      vertex(x - 50 + 3, y + 14 +  1);
      vertex(x - 50 + 4, y + 14 +  3);
      vertex(x - 50 + 4, y + 14 +  5);
      endShape(CLOSE);
 
      beginShape();
      vertex(x - 50 + 0, y + 14 +  7);
      vertex(x - 50 + 0, y + 14 +  12);
      vertex(x - 50 + 1, y + 14 +  15);
      vertex(x - 50 + 3, y + 14 +  17);
      vertex(x - 50 + 6, y + 14 +  12);
      vertex(x - 50 + 4, y + 14 +  7);
 
      endShape(CLOSE);
 
      popMatrix();
    }
  }
}

 

