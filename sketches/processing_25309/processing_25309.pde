
float a;
float b;
float aspeed = +3;
float bspeed = -4;
   
void setup(){
  size(500,500);
  background(155);
  a=90;
  b=45;
   noStroke();
  fill(0,0,255);
  rect(0,470,500,30);
  fill(25,25,155);
  rect(0,460,500,30);
  fill(16,16,118);
  rect(0,450,500,30);
  fill(5,5,75);
  rect(0,440,500,30);
  fill(3,3,41);
  rect(0,430,500,30);
  fill(1,1,18);
  rect(0,420,500,30);
}
   
void draw(){
     
  if(b >= 500-10){
    bspeed = bspeed * -1;
  }
     
  if (b<=0+10){
  bspeed = bspeed * -1;
}
   
if(a >= 500-10){
    aspeed = aspeed * -1;
  }
     
  if (a<=0+10){
  aspeed = aspeed * -1;
}
     
  a= a + aspeed;
  b= b + bspeed;
 
  fill(24,24,108);
  ellipse(a,b,random(15),random(15));
  fill(1,1,18);
  ellipse(a,b,random(13),random(20));
   
   
}
void mousePressed(){
    fill(1,1,18);
    ellipse(mouseX-10,mouseY-30,20,60);
    fill(16,16,118);
  ellipse(random(0+500),random(280,460),30,150);
  fill(1,1,18);
  ellipse(random(0+500),random(200,460),40,120);
  fill(1,1,18,150);
  ellipse(random(0+500),random(200,460),40,120);
  fill(5,5,75);
  ellipse(random(0+500),random(270,430),40,70);
  fill(1,1,18);
  ellipse(random(0+500),random(280,420),40,30);
  fill(118,118,224);
  ellipse(random(0+500),random(300,450),50,20);
  fill(25,25,155);
  ellipse(random(0+500),random(270,420),40,70);
   
}


