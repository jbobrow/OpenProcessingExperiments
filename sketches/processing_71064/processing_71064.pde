
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/71064*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

void setup() {
  background(255, 0, 0);
  size(800, 800);
}

float i = 0; // rotation 1
float d = 0; // third rotation
float e = 0; // third rotation
float f = 0;//forth rotation
float color1 = 0;// RED
float color2 = 0;// GREEN
float color3 = 0;// BLUE

void draw() {
  color1 = color1 +1;
  color2 = color2 +1;
  color3 = color3 +1;
  float R1 = random(0, 255);
  float R2 = random(0, 255);
  float R3 = random(0, 255);
  float R4 = random(0, 255);
  float R5 = random(0, 255);
  if (color1>255) {//first loop
    color1 = 0;
  }
  if (color2>650) {//second loop
    color2=0;
  }




  frameRate(30);//FRAMERATE
  background(0); //this makes the background black and draws over the last square
  d = d + .1;
  i = i + 1; 
  e = e + .2;
  f = f+.05;
  translate(400, 400); 
  smooth();
  noStroke();


  //center shapes
  rotate(i); //rotates everything below by i
  fill(0, 0, 255);//blue
  ellipse(100, 100, 5, 5);
  ellipse(100, 200, 5, 5);
  fill(0, 0, 255, 100);
  rect(0, 0, 100, 100, 300, 300);



  //tiny little stuff very center
  //blue
  ellipse(0, 5, 10, 10);
  ellipse(0, 15, 10, 10);
  ellipse(10, 20, 5, 5);
  ellipse(20, 20, 20, 4);
  rect(35, 15, 20, 5);
  rect(35, 25, 20, 5);
  fill(255, 0, 0);//red
  ellipse(2.5, 2.5, 5, 5);
  rect(0, 0, 4, 4);
  ellipse(-5, -5, 5, 5);
  ellipse(7, 7, 4, 4);
  ellipse(7, 10, 4, 7);
  ellipse(15, 15, 5, 5);
  ellipse(20, 25, 10, 5);
  fill(0, 255, 0);//green
  ellipse(10, 0, 4, 4);
  ellipse(7, 7, 5, 5);
  ellipse(20, 10, 10, 5);
  ellipse(15, 25, 5, 5);
  fill(#52FFD2);//azul
  ellipse(10, 10, 20, 3);
  ellipse(0, 16, 5, 5);
  ellipse(10, 20, 15, 3);
  ellipse(30, 20, 5, 20);
  rect(35, 30, 20, 5);//rectangle
  fill(#FF950A);//orange
  ellipse(10, 14, 5, 10);
  rect(35, 20, 20, 5);//rectangle
  fill(#FF0AD3);//purple
  rect(35, 10, 20, 5);//rectangle




  //outer rays 
  fill(0, 0, 255);//blue
  rect(0, 360, 40, 40, 60, 60);
  fill(#787DE5);
  rect(0, 300, 40, 40, 60, 60);
  fill(#17E523);
  rect(0, 250, 40, 40, 60, 60);
  fill(#C638C6);
  rect(60, 360, 40, 40, 60, 60);


  rotate(d);//everything below this rotates on variable "d"
  fill(#FAE608);//orange
  ellipse(0, 100, 20, 20);
  ellipse(0, 125, 10, 10);
  ellipse(0, 150, 20, 20);
  ellipse(0, 175, 10, 10);
  ellipse(0, 200, 20, 20);
  fill(0, 0, color1);//blue
  ellipse(50, 100, 20, 20);
  ellipse(50, 125, 10, 10);
  ellipse(50, 150, 20, 20);
  ellipse(50, 175, 10, 10);
  ellipse(50, 200, 20, 20);



  //variable "e"
  rotate(e);
  //big rectangles faded
  fill(color1, 0, 0, color1);
  rect(0, 0, 300, 300, 500, 500);
  fill(0, color1, color1, color1);
  rect(0, 30, 300, 300, 500, 500);
  fill(0, 0, color1, color1);
  rect(0, 100, 300, 300, 500, 500);

  //variable "f"
  rotate(f);
  println(color2);
  if (color2>255) {
    rect(0, 0, 300, 300);//big blue square fill in middle
    fill(R1, 0, 0);
    triangle(0, 0, 30, 30, 100, 20);
    fill(0, R3, 0);
    triangle(0, 10, 30, 30, 100, 20);
    fill(0, R2, 0);
    triangle(0, 20, 30, 50, 100, 20);
    fill(R2, R3, 0);
    ellipse(0, 200, 100, 100);
    fill(0, R1, R2);
    ellipse(0, 200, 50, 50);
    ellipse(250, 0, 50, 50);
    fill(R4, 0, R2);
    ellipse(50, 50, 30, 30);
    ellipse(100, 100, 40, 40);
    ellipse(250, 0, 30, 30);
  }
}


