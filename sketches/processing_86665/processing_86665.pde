
/* @pjs preload="Will.JPG"; */
float x = 400;
float y = 300;
float r = 0;
float speed = 50;
PImage img;
int gridSpacing =50;
int diagonal = 100;

void setup(){
  size(800, 800);
  img = loadImage("Will.JPG");
 }
   
void draw(){
  move();
  display();
  strokeWeight(2);//neck
  stroke(250,210,101);
  beginShape(); 
    fill(250,218,129,230);
    vertex(360, 500);
    vertex(360, 580);
    vertex(440, 580);
    vertex(440, 500);
  endShape();
  
  strokeWeight(2);//face from neck to cranium
  stroke(250,210,101,180);
  beginShape(); 
    fill(250,218,129,240);
    arc(400,300,300,400, 0, PI);
  endShape();
  
  strokeWeight(2);//ears
  stroke(250,210,101,180);
  fill(250,218,129,240);
  bezier(550, 300, 580, 320, 590, 330, 540, 375);
  bezier(250, 300, 220, 320, 230, 330, 260, 375);
  
  stroke(93,25,15,180);//nose
  strokeWeight(5);
  line(400, 360, 380, 400); 
  line(380, 400, 400, 400);
  
  strokeWeight(2);//mouth
  stroke(0,0,0,180);
  beginShape();
    fill(250,101,136,230);
    arc(400, 440, 90, 100, 0, PI);
  endShape();
  
  strokeWeight(10); //facial hair
  stroke(242,85,61,200);
  line(300, 440, 500, 440);
  beginShape();
    noFill();
    arc(400, 440, 200, 120, 0, PI);
  
  strokeWeight(5);//left eye  
  stroke(0,0,0,180);
  fill(255,3,7,100);
  ellipse(360, 360, 40, 60);
  fill(16,198,4 ,100);//right eye
  ellipse(440, 360, 40, 60);
  strokeWeight(10);
  point(360, 360);
  point(440, 360);
  
  strokeWeight(5); //shirt
  stroke(54, 160, 38, 180);
  fill(52, 157, 37, 230);
  rectMode(CENTER);
  rect(400, 800, 400, 440, 100);
  
  r += 1;//rotating square
  pushMatrix();
  translate(60, 60);
  fill(140,240,234,200);
  stroke(180,250,230,180);
  rotate(r);
  rect(20,20,100,100);
  popMatrix();
  
  pushMatrix();//rotating quadratic
  translate(100, 500);
  rotate(r);
  strokeWeight(3);
  stroke(120,180, 180, 200);
  fill(140, 23, 40, 200);
  quad(10, 50, 40, 150, 90, 150, 90, 100);  
  popMatrix();
  
  pushMatrix();//rotating ellipses
  translate(700, 500);
  rotate(r);
  stroke(16,5,178,180);
  fill(80,69,252,180);
  ellipse(50, 50, 120, 80);
  fill(247,152,35,100);
  stroke(211,81,34,180);
  ellipse(50, 50, 80, 150);
  popMatrix();
       
 }
 
void move(){
   x = x + speed;
   if (x > width){
     x = 0;
   }
 }
 
void display(){
  background(118,24,242,10);

  blend(img, 0, 0, 800, 800, 0, 0, 800, 800, DARKEST);
  strokeWeight(5);
  for (int i = 0; i < width; i += gridSpacing) {
    for (int j = 0; j < height; j += gridSpacing) {
      stroke(74, 245, 175, 100);
      line(i, j, i, height);
      stroke(245, 74, 217, 100);
      line(i, j, width, j);
    }
    for (int m = 0; m < width; m += diagonal) {
      for (int n = 0; n < height; n += diagonal){
        strokeWeight(2);
        stroke(252, 85, 106, 40);
        line(m, n, width+m, height+n);
      }
    }
   }
   beginShape();//cranium
    strokeWeight(5);
    stroke(250,210,101,180);
    fill(250,218,129,240);
    arc(x,y,300,300, -PI, 0);
  line(x-150,y,x+150,y);
  endShape();
  
  stroke(252, 172, 10);//hair
  fill(252, 172, 10,255);
  ellipse(x, 200, 226, 140);
  triangle(x+30, 140, x+180, 240, x, 200);
  triangle(x-40, 160, x+160, 260, x+20, 240);
  triangle(x-60, 200, x+160, 300, x, 270);
}



