
float weight=1.0;
float x,y;//MUST do this in order to use the variables below
float easing=.01;
float x1,y1;
float angle = 0.0;
float offset = 60;
float scalar = 40;
float speed = 0.05;
float speed2 = 2.5;
int diameter = 2;

void setup() {

size(600,600);
background(0);
smooth();
stroke(255,100);
frameRate(100);

}

void draw(){
 if (mousePressed ==true){
   float targetX = mouseX;
  float targetY= mouseY;
   easing= .01;
  x += (targetX-x)*easing;
  y += (targetY-y)*easing;
    noFill();
  ellipse(random(x-4,x+4),random(y-4,y+4),23,10);

 }
   
  else{
  fill(0,1);
  rect(0,0,width,height);
  }
  
   float targetX = mouseX;
  float targetY= mouseY;
 
  noStroke();
  {
   if((key == 'b' || key == 'B')){
   weight=dist(pmouseX,pmouseY,mouseX,mouseY);
   //dist calculates the difference between pmouse and mouse
 easing= .01;
  x += (targetX-x)*easing;
  y += (targetY-y)*easing;
   
   stroke(80,160,180,100);
   strokeWeight(2);
  noFill();
  bezier(x,y,random(x-25,x+25),random(y-25,y+25),random(x-25,x+25),
  random(y-25,y+25),random(x-20,x+20),random(y-20,y+20));
  noStroke();
  fill(80,220,250,30);
  ellipse(random(x-4,x+4),random(y-4,y+4),random(40,55),23);
  fill(80,220,250,100);
  ellipse(random(x-4,x+4),random(y-4,y+4),random(20,25),23);
  fill(0,80,150,150);
  ellipse(random(x-4,x+4),random(y-4,y+4),15,23);
  fill(255,150);
  ellipse(random(x-2,x+2),random(y-2,y+2),10,23);
   }
 }
 
 {
   if ((key == 'r' || key == 'R')) {
     
     weight=dist(pmouseX,pmouseY,mouseX,mouseY);
   //dist calculates the difference between pmouse and mouse
  
  x += (targetX-x)*easing;
  y += (targetY-y)*easing;
  
   stroke(230,25,0,100);
   strokeWeight(2);
  noFill();
  beginShape();
  vertex(x,y);
  vertex(random(x-25,x+25),random(y-25,y+25));
  vertex(random(x-25,x+25),random(y-50,y+50));
  endShape();
  noStroke();
  fill(230,25,0,30);
  ellipse(random(x-4,x+4),random(y-4,y+4),random(40,55),23);
  fill(230,25,0,100);
  ellipse(random(x-4,x+4),random(y-4,y+4),random(20,25),23);
  fill(250,180,100,150);
  ellipse(random(x-4,x+4),random(y-4,y+4),15,23);
  fill(255,150);
  ellipse(random(x-4,x+4),random(y-4,y+4),10,10);
   } 
  }   
 
 
{
   if ((key == 'y' || key == 'Y')) {
     
     easing=.03;
     weight=dist(pmouseX,pmouseY,mouseX,mouseY);
   //dist calculates the difference between pmouse and mouse

  x += (targetX-x)*easing;
  y += (targetY-y)*easing;
  
   stroke(230,230,25,100);
   strokeWeight(2);
  noFill();
  bezier(x,y,random(x-25,x+25),random(y-25,y+25),random(x-25,x+25),
  random(y-25,y+25),random(x-20,x+20),random(y-20,y+20));
 noStroke();
  fill(240,240,155,5);
  ellipse (random(x-4,x+4),random(y-4,y+4),(60+sin(angle +0.4)*scalar),(60+sin(angle +.4)*scalar));
  angle +=speed/2;
  fill(240,240,80,30);
  ellipse(random(x-4,x+4),random(y-4,y+4),random(60,75),43);
  fill(240,220,80,100);
  ellipse(random(x-4,x+4),random(y-4,y+4),random(30,35),33);
  fill(250,230,130,180);
  ellipse(random(x-4,x+4),random(y-4,y+4),15,23);
  fill(255,150);
  ellipse(random(x-4,x+4),random(y-4,y+4),23,10);
   } 
  }   
  
  
  
  {
   if ((key == 'v' || key == 'V')) {
     
     easing=.008;
     weight=dist(pmouseX,pmouseY,mouseX,mouseY);
   //dist calculates the difference between pmouse and mouse

  x += (targetX-x)*easing;
  y += (targetY-y)*easing;
  
   stroke(230,15,230,100);
   strokeWeight(2);
  noFill();
  bezier(x+sin(angle +0.4)*scalar,y+sin(angle +0.4)*scalar,random(x+sin(angle +0.4)*scalar-25,
  x+sin(angle +0.4)*scalar+25),random(y+sin(angle +0.4)*scalar-25,y+sin(angle +0.4)*scalar+25),random(x+sin(angle +0.4)*scalar-25,x+sin(angle +0.4)*scalar+25),
  random(y+sin(angle +0.4)*scalar-25,y+sin(angle +0.4)*scalar+25),random(x+sin(angle +0.4)*scalar-20,
  x+sin(angle +0.4)*scalar+20),random(y+sin(angle +0.4)*scalar-20,y+sin(angle +0.4)*scalar+20));
 stroke(random(200,230),15,random(220,250),30);
   noFill();
  ellipse(x+sin(angle +0.4)*scalar,y+sin(angle +0.4)*scalar,random(70,85),random(65,75));
   noStroke();
 // ellipse(x+sin(angle +0.4)*scalar,y+sin(angle +0.4)*scalar,random(60,75),random(40,50));
 // fill(220,15,240,100);
 // ellipse(x+sin(angle +0.4)*scalar,y+sin(angle +0.4)*scalar,random(30,35),random(30,40));
  fill(210,130,230,180);
  ellipse(x+sin(angle +0.4)*scalar,y+sin(angle +0.4)*scalar,random(12,17),random(20,25));
  fill(255,150);
  ellipse(x+sin(angle +0.4)*scalar,y+sin(angle +0.4)*scalar,23,10);
   } 
  }   
  
  
   {
   if ((key == 'g' || key == 'G')) {
     
     weight=dist(pmouseX,pmouseY,mouseX,mouseY);
   //dist calculates the difference between pmouse and mouse
  easing = .02;
  
  x += (targetX-x)*easing;
  y += (targetY-y)*easing;
  x1 += random(-speed2,speed2);
  y1 += random(-speed2,speed2);
  
   stroke(23,250,0,100);
   strokeWeight(2);
  noFill();
  beginShape();
  vertex(x+x1/3,y+y1/3);
 vertex(random(x+x1/3-25,x+x1/3+25),random(y+y1/3-25,y+y1/3+25));
 vertex(random(x+x1/3-25,x+x1/3+25),random(y+y1/3-50,y+y1/3+50));
 endShape();
stroke(3,80,0,100);
ellipse(x+x1/2,y+y1/2,diameter,diameter);
ellipse(x+x1/3,y+y1/2,diameter,diameter);
ellipse(x+x1/2,y+y1/3,diameter,diameter);
ellipse(x+x1,y+y1/2,diameter,diameter);
ellipse(x+x1/3,y+y1,diameter,diameter);
ellipse(x+x1/3,y+y1/3,diameter,diameter);
ellipse(x+x1,y+y1,diameter,diameter);
ellipse(x+x1,y+y1/3,diameter,diameter);
ellipse(x+x1/4,y+y1/4,diameter,diameter);
ellipse(x+x1/4,y+y1/5,diameter,diameter);
ellipse(x+x1/5,y+y1/4,diameter,diameter);
  noStroke();
  fill(23,250,0,5);
   ellipse(x+x1/3,y+y1/3,random(80,95),90);
  fill(23,250,0,100);
  ellipse(x+x1/3,y+y1/3,random(40,55),23);
  fill(23,250,0,100);
  ellipse(x+x1/3,y+y1/3,random(20,25),23);
  fill(180,250,100,150);
  ellipse(x+x1/3,y+y1/3,15,23);
  strokeWeight(10);
  stroke(0,150);
  noFill();
  ellipse(x+x1/2,y+y1/2,random(8,12),random(8,12));
   } 
  }   
 
{
   if ((key == 't' || key == 'T')) {
     
     weight=dist(pmouseX,pmouseY,mouseX,mouseY);
   //dist calculates the difference between pmouse and mouse
  
  
  
   easing= .01;
   
  x += (targetX-x)*easing;
  y += (targetY-y)*easing;
    noFill();
  ellipse(random(x-4,x+4),random(y-4,y+4),23,10);

   }
 }
 } 
 



