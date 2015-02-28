
float x = 150.0;
float y = 150.0;
float a = 150.0;
float b = 150.0;
float c = 150.0;
float d = 115.0;
float e = 85.0;
float f = 210.0;
float g = 325.0;


void setup(){
  size(500, 500);
  smooth();
}
void draw(){
  background(122, 186, 221);
  
  if (key == 'c') 
   { 
     noStroke();
     background(122, 186, 221);
     fill(255);
     float r = random(-30, 30); 
     ellipse(mouseX, mouseY, r, r); 
   } 

  
  
    //buildings
  noStroke();
  fill(20);
  rect(0, 260, 50, 275);
  fill(0);
  rect(50, 240, 60, 275);
  fill(30);
  rect(100, 270, 50, 275);
  fill(0);
  rect(150, 340, 50, 200);
  stroke(2);
  strokeWeight(4);
  fill(0);
  line(80, 240, 80, 190);
  
  //bridge
  line(160, 450, 600, 450);
  
  //cars
  frameRate(30);
  strokeWeight(5);
  point(x, 445);
  x = x + 0.6;
  if(x >width){
    x = 150;
  }
  strokeWeight(5);
  point(y, 445);
  y = y + 1;
  if(y>width){
    y=150;}
  strokeWeight(5);
  point(a, 445);
  a = a + 2;
  if (a>width){
    a = 150;}
  strokeWeight(5);
  point(b, 445);
  b = b + 3;
  if (b>width){
    b = 150;}
  
  
  //head
  noStroke();
  fill(250, 236, 129);
  ellipse(250, 250, 210, 270);
  
  //eyes
  stroke(0);
  strokeWeight(3);
  fill(255);
  ellipse(210, 210, 50, 50);
  ellipse(290, 210, 50, 50);
  noStroke();
  fill(60, 152, 31);
  ellipse(210, 210, 30, 30);
  ellipse(290, 210, 30, 30);
  fill(0);
  ellipse(210, f, 12, 12);
  ellipse(290, f, 12, 12);
  f = f - 0.1;
  if (f<201){
    f = 201;}
  
//winking mechanism
 if(mousePressed){
   fill(250, 236, 129);
   noStroke();
   ellipse(210, 210, 55, 55);
   ellipse(290, 210, 55, 55);
   stroke(2);
   line(190, 210, 230, 210);
   line(270, 210, 310, 210);
   f = 210;
   g = 325;
 }
   
  
  //nose
  stroke(0);
  noFill();
  bezier(240, 250, 240, 240, 
         260, 240, 260, 250);
  
  //mouth
 // line(220,310,280,310);
  bezier(220, g, 220, 325,
         280, 325, 280, g);
         g = g + 0.1;
         if (g > 334){
           g=334;
         }
        

  //hat
  strokeWeight(3);
  line(220, d, 280, d);
  d = d - 0.3;
  if (d < 30){
    d=115;
  }
  fill(0);
  rect(240, e, 20, 30);
  e = e - 0.3;
  if (e<0){
    e=85;
  }
  
  
}

