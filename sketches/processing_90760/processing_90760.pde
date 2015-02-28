
import processing.opengl.*;

PVector v1, v2, v3, v4, v5, v6, v7, v8, v9;
int dim = 200;
float r_y = 0;
float r_x = 0;
int c1 = #DE782B;
int c2 = #289897;
int c3 = #3382C1;
int c4 = #EAC22D;
int c5 = #F71B2E;
int c6 = #C13378;
int c7 = #F73D1B;
int c8 = #87A212;
int c9 = #C6BAD6;
int tx = 40;
int ty = 470;
int px = 30;
int py = 465;
int w = width;
int h = height;


void setup() {
  size(900, 500, OPENGL);
  smooth();
  
  v1 = new PVector(0.5*6, 0.6*2, 3*50); //japan
  v2 = new PVector(1.4*6, 30.3*2, 3*50); //germany
  v3 = new PVector(1.6*6, 31.2*2, 2*50); //france
  v4 = new PVector(1.7*6, 23.8*2, 2*50); //canada
  v5 = new PVector(1.7*6, 31.3*2, 3*50); //norway
  v6 = new PVector(1.9*6, 6.7*2, 2*50); //uk
  v7 = new PVector(2.0*6, 45.7*2, 2*50); //finland
  v8 = new PVector(31.2*6, 88.8*2, 1*50); //us-dc
  v9 = new PVector(6.0*6, 88.8*2, 1*50); //us-nyc
}

void draw() {
  background(#404040);
  //title
  textSize(24);
  text("Gun Death Rates of the World", 20, 50);
  textSize(12);
  text("Averaged total gun death rates between 2008 and 2010 (x-axis)", 20, 70); 
  text("compared against the gun ownership rate (y-axis)", 20, 85);
  text("and the strictness of gun laws in 3 levels* (z-axis)", 20, 100);
  text("*1=lenient, 2=moderate, 3=strict", 20, 115);
  textSize(12);
  text("press anywhere to show grid", 20, 250);
  
  //x, y, z coordinate explanation
  /*strokeWeight(1);
  noFill();
  line(width-150, 120, width-150, 200);//x axis
  line(width-150, 200, width-50, 200);//y axis
  line(width-150, 200, width-75, 150);//z axis
  textSize(10);
  text("Gun Death Rate", width-135, 215);
  text("Y", width-152, 110);
  text("Z", width-70, 145);*/
  
    
  //legend
  textSize(12);
  text("Tokyo", tx, ty);
  //fill(c1, 150);
  stroke(c1, 150);
  strokeWeight(10);
  point(px, py);

  text("Berlin", tx+100, ty);
  //fill(c2, 150);
  stroke(c2, 150);
  point(px+100, py);
  
  text("Paris", tx+200, ty);
  stroke(c3, 150);
  point(px+200, py);
  
  text("Toronto", tx+300, ty);
  stroke(c4, 150);
  point(px+300, py);
  
  text("Oslo", tx+400, ty);
  stroke(c5, 150);
  point(px+400, py);
  
  text("London", tx+500, ty);
  stroke(c6, 150);
  point(px+500, py);
  
  text("Helsinki", tx+600, ty);
  stroke(c7, 150);
  point(px+600, py);
  
  text("Wash. DC", tx+700, ty);
  stroke(c8, 150);
  point(px+700, py);
  
  text("NYC", tx+800, ty);
  stroke(c9, 150);
  point(px+800, py);
  
  //draw 3D box
  translate(width/2, height/2);//box location-middle of the screen
  scale(1,-1,1);//set Y to top of the box
  //rotate box 
  rotateY(r_y);//rotate box at y-axis
  r_y+=0.01;
  //rotateX(r_x);//rotate box at x-axis
  //r_x+=0.01;
  
  //box 
  noFill();
  noStroke();
  if (mousePressed == true){
    stroke(225);
  }
  strokeWeight(1);
  box(dim);
  translate(-dim/2, -dim/2, -dim/2);
  
  //points
  strokeWeight(15);
  stroke(c1, 150);
  point(v1.x, v1.y, v1.z);
    
  stroke(c2, 150);
  point(v2.x, v2.y, v2.z);
  
  stroke(c3, 150);
  point(v3.x, v3.y, v3.z);
  
  stroke(c4, 150);
  point(v4.x, v4.y, v4.z);
  
  stroke(c5, 150);
  point(v5.x, v5.y, v5.z);
  
  stroke(c6, 150);
  point(v6.x, v6.y, v6.z);
  
  stroke(c7, 150);
  point(v7.x, v7.y, v7.z);
  
  stroke(c8, 150);
  point(v8.x, v8.y, v8.z);
  
  stroke(c9, 150);
  point(v9.x, v9.y, v9.z);
  
}


