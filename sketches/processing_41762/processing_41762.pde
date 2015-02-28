
//Iv Shqevi  
// Lecture 7.1
Blob[] pin= new Blob[25];
Blob2[] pin2= new Blob2[25];
Blob3[] pin3= new Blob3[25];
Blob4[] pin4= new Blob4[25];

void setup() {
  background(200);
  size(300, 300);
  smooth();


  for (int i=0; i<pin.length;i++) {
    pin[i]= new Blob(random(150, 150), random(150, 150));//this sets the conditions for the first set of points within the array
  }
  for (int j=0; j<pin2.length;j++) {
    pin2[j]= new Blob2(random(150, 150), random(150, 150));//sets conditions for second set of pionts within the array
  }
  for (int k=0; k<pin3.length;k++) {
    pin3[k]= new Blob3(random(150, 150), random(150, 150));//sets conditions for third set of pionts within the array
  }
  for (int l=0; l<pin4.length;l++) {
    pin4[l]= new Blob4(random(150, 150), random(150, 150));//sets conditions for third set of pionts within the array
  }
}

void draw() {//this draws both points with respect to what was set up in the class

  for (int i=0; i<pin.length; i++) {
    pin[i].move();
    pin[i].display();
  }
  for (int j=0; j<pin2.length; j++) {
    pin2[j].move();
    pin2[j].display();
  }
  for (int k=0; k<pin3.length; k++) {
    pin3[k].move();
    pin3[k].display();
  }
  for (int l=0; l<pin4.length; l++) {
    pin4[l].move();
    pin4[l].display();
  }
}





class Blob {  //setting up the first points that move arround the screen

  float x1;
  float y1;

  Blob(float x1_, float y1_) {

    x1= x1_;
    y1= y1_;
  }

  void display() {
    stroke(150);
    point(x1, y1);
  }

  void move() {
    x1=x1+random(-1, 1);
    y1= y1+ random(-1, 1);
  }
}



class Blob2 {  // second points that move arround the screen

  float x2;
  float y2;

  Blob2(float x2_, float y2_) {
    x2= x2_;
    y2= y2_;
  }

  void display() {
    stroke(255);
    point(x2, y2);
  }

  void move() {
    x2=x2+random(-1, 1);
    y2= y2+ random(-1, 1);
  }
}

class Blob3 {  // third points that move across the screen

  float x3;
  float y3;

  Blob3(float x3_, float y3_) {
    x3= x3_;
    y3= y3_;
  }

  void display() {
    stroke(255, 0, 0);
    point(x3, y3);
  }

  void move() {
    x3=x3+random(-1, 1);
    y3= y3+ random(-1, 1);
  }
}

class Blob4 {  // forth points that move across the screen

  float x4;
  float y4;

  Blob4(float x4_, float y4_) {
    x4= x4_;
    y4= y4_;
  }

  void display() {
    stroke(80);
    point(x4, y4);
  }

  void move() {
    x4=x4+random(-1, 1);
    y4= y4+ random(-1, 1);
  }
}


