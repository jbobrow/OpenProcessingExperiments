
/*
Jacqueline Christine
HW #3
ART 3001
What's Behind Door Number 2
*/
 
int i,m,n;
int state=0;
float radius=5;
float a =26;// height and width of rectangular spiral
float fact;// allows the second spiral to reverse
int angle = 5;



 
void setup(){
  size (300,300);
  background (0);
}
 
void draw(){
 
if (mousePressed==false){//true or false state to activate door
if (state==0){
 
background(i=0);stroke(40);m=millis();while(i<300){strokeWeight(((i/23.1+m/717.1)%30));point((i*i*m)%300,i++);}// vibrating background
 
float x=sin(a)*radius;//vibrating door variables
float y=cos(a)*radius;
float x1 = 100 + 20 * cos(angle);
float y1 = 100 + 10 * sin(angle);
float width = 100 + 20 * sin(angle);
float height = 120 + 20 * cos(angle);
 
 fill (random(10));
//fill (150, 0, random(50,200));//vibrating door
strokeWeight(1);
rect(x+x1, y+y1, width, height);
a+=2;
radius+=0.2;
radius=constrain (radius,0,3);//keeps door from spiraling
 
fill (40);//door handle
ellipse (120,160,10,10);
fill (60);
ellipse (120,160,7,7);
fill (80);
ellipse (120,160,3,3);
}
else if (state ==1){
   noStroke();
  fill (0,1);
  rectMode(CENTER);
 rect (300,300,10000,100000); 
  translate(width/2, height/2);
  fill(242,243, 243);
  //fill(0,random(10),random(10),80);
 // fill(random(255),random(255),random(255),50);
  ellipse(cos(radians(a))*fact, sin(radians(a))*fact, 5,5);
a+=70;//spiraled dots
//a+=1;
//a+=900;// changes return and send rates plus shape
fact+=0.2;       // reverses the spiral 
  }
 
 }else if (mousePressed==true){//to open door
 if (state == 0){
frameRate(350);
float w=90;
 
while (w>20){//creates inner depth to make door look open
fill(w-20);
rectMode (CENTER);
rect (146,153,w,w+42);
w=w-15;
 
fill(240,0,59);//open door in perspective
rect (190,153,6,153);
fill(150);
ellipse (198,160,10,10);//door handle in perspective
state=1;
}
 }
else if (state ==1){

    noStroke();
  fill (0,1);
  rectMode(CENTER);
 rect (300,300,1000,1000); 
  translate(width/2, height/2);
fill(random(230,242),random(240,243),random(201,210),20);
  rect(cos(radians(a))*fact, sin(radians(a))*fact, 20, 20);
   a-=10;
    fact-=0.2;// sends the spiral 
    
} else if (mouseX>width||mouseX<0){
      background (0,1);
    }
}
}




