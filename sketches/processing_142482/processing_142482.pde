
float x=0, y=0;
float angle = 0;
float d;
color c1 = 227;
color c2= 196;
float weight=0;
int radius = 30;

void setup(){
  size(640,640);
  background(255);
}

void draw(){
  rectMode(CORNERS);
  fill(255);
  rect(0,0,640,640);
  
 noStroke();
 //ellipseMode(CENTER);
 fill(54,255,190);
 rect(0,0,160,40);
fill(252,54,173);
rect(160,0,320,40);
 fill(255,141,0);
 rect(320,0,480,40);
 fill(0,227,255);
 rect(480,0,6400,40);

 //ellipseMode(CENTER);
 //ellipse(127,40,radius,radius);
 
     if (mouseY < 40 && mousePressed) {
       
       angle+=0.1;
       y+=1;
     } 
     
 
  pushMatrix();
  translate(180,180+y);
  translate(168,60);
  rotate(angle);
  strokeWeight(25);
  stroke(c2);
  line(0,0,10,75);
  translate(10,75);
  rotate(angle*1.5);
  strokeWeight(20);
  line(0,0,-10,60);
  angle+=weight;
  popMatrix();
  
  pushMatrix();
  translate(180,180+y);
  translate(12,90);
  rotate(angle);
  strokeWeight(25);
  stroke(c2);
  line(0,0,10,75);
  translate(10,75);
  rotate(angle*1.5);
  strokeWeight(20);
  line(0,0,-10,60);
  angle+=weight;
  popMatrix();
  
  pushMatrix();
  translate(180,180+y);
  translate(258,118);
  rotate(angle);
  strokeWeight(25);
  stroke(c2);
  line(0,0,10,75);
  translate(10,75);
  rotate(angle*1.5);
  strokeWeight(20);
  line(0,0,-10,60);
  angle+=weight;
  popMatrix();
  
  pushMatrix();
  translate(180,180+y);
  translate(96,148);
  rotate(angle);
  strokeWeight(25);
  stroke(c2);
  line(0,0,10,75);
  translate(10,75);
  rotate(angle*1.5);
  strokeWeight(20);
  line(0,0,-10,60);
  angle+=weight;
  popMatrix();
  
  pushMatrix();
  translate(180,180+y);
  strokeWeight(2);
  fill(250,250,200);
  quad(0,90,180,60,270,120,90,150);
  fill(c1);
  strokeWeight(2);
  stroke(155);
  quad(0,30,180,0,180,60,0,90);
  quad(180,0,270,60,270,120,180,60);
  quad(90,90,270,60,270,120,90,150);
  quad(0,30,90,90,90,150,0,90);
  
  stroke(255);
  fill(116,153,1);
  ellipse(150,110,20,20);
  ellipse(210,100,20,20);
   if (mouseY < 70 && mousePressed){
     if(mouseX<160){
     noStroke();
     fill(54,255,190);
       ellipse(140,60,35,35);
   }
   else if(mouseX<320){
     noStroke();
     fill(252,54,173);
       ellipse(140,60,35,35);
   }
   else if(mouseX<480){
     noStroke();
     fill(255,141,0);
       ellipse(140,60,35,35);
   }
   else {
     noStroke();
     fill(0,227,255);
       ellipse(140,60,35,35);
   }
  popMatrix();
}
}


