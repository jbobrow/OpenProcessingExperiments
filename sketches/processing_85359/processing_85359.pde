
// position of character 1
float X=-100;
float Y=250;
float a=150;

//position of character 2
float c=1100;
float d=250;

//position of UFO
float e=500;
float f=-100;

//tractor beam
float g=500;
float h=250;
 
 //position of human
 float i=-100;
 float j=200;


void setup() {
  size(1000,500);
}

 void draw() {
  background(0,0,150);
    
     //ground
     fill(113,47,6);
     stroke(113,47,6);
     rectMode(CORNERS);
     rect(0,350,1000,500);
 
  //body
   strokeWeight(1);
  noStroke();
   fill(200,0,200);
   rectMode(CENTER);
   rect(c,d,50,50);
 
  //head
   arc(c,d-45,50,40,0,PI);
   arc(c,d-50,50,60,PI,PI+PI);
  
   //eyes
   fill(255);
   ellipse(c-20,d-70,20,20);
   ellipse(c+20,d-70,15,15);
   fill(0,200,0);
   ellipse(c-20,d-70,10,10);
   ellipse(c+20,d-70,7.5,7.5);
  
   //arms
   stroke(200,0,200);
   strokeWeight(10);
   line(c-20,d-15,c-50,d-70);
   line(c+20,d-15,c+50,d+30);
  
  //legs
   fill(200,0,200);
   strokeWeight(1);
   noStroke();
   arc(c,d+25,50,50,0,PI);
   stroke(200,0,200);
   strokeWeight(10);
    line(c-10,d+30,c-10,d+100);
   line(c+10,d+30,c+10,d+100);
  
   //body 
   fill(0,200,0);
   noStroke();
   ellipse(X,Y,50,100);
   
   //head
   triangle(X,Y-25,X-25,Y-75,X+25,Y-75);
   stroke(0,200,0);
   strokeWeight(10);
  
   //arms
   line(X+20,Y-25,X+50,Y-75);
   line(X-20,Y-25,X-40,Y+30);
  
   //legs
   line(X-10,Y+40,X-20,Y+100);
   line(X+10,Y+40,X+25,Y+100);
 
  //eyes
   fill(255);
   
   ellipse(X-25,Y-75,20,20);
   ellipse(X+25,Y-75,20,20);
noStroke();

     fill(200,0,0);
     ellipse(e,f,1000,100);
     fill(0,255,0);
     arc(e,f,800,300,PI,PI+PI);



 X=X+2;
   a=a+.5;
   c=c-2;
   if(X>450) {
X=450;
 }
   if(c<550)  {
     c=550;
     f=f+5;
   
     }
     if(f>90) {
    Y=Y-1;
    d=d-1;
       f=90;
       fill(255,255,0,100);
      rect(g,h,300,300);
      fill(200,0,0);
     ellipse(e,f,1000,100);
     fill(0,255,0);
     arc(e,f,800,300,PI,PI+PI);
  
 }
   
   if(Y< 10) {
    h=h-50;
   }
   if(Y<-50) {
     e=e+2;
     stroke(0);
     strokeWeight(10);
     line(i,j,i,j+100);
     line(i,j+100,i-20,j+150);
     line(i,j+100,i+20,j+150);
     line(i,j-10,i-20,j+50);
     line(i,j+10,i+50,j-25);
     strokeWeight(1);
     fill(0);
     ellipse(i,j,50,50);
     fill(255);
     ellipse(i,j-10,10,10);
     ellipse(i+10,j+5,20,20);
     ellipse(i+20,j-10,10,10);
     
     i=i+1;
      }
  if(e>1200) {
    i=250;
  }
  
   }
    
    
  


