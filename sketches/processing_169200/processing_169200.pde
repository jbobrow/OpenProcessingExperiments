
float x,y;
float angle=0;
float r=0;
float d=0;
 
 void setup(){
size(600,600);
 
background(255);
 
}
 
void draw(){
  
  noFill();
 
  x=r*sin(angle);
  y= r*cos(angle);
   
 noFill();
 translate(width/2,height/2);
 rotate(r);
  
stroke(20, 20, 20, 20);
 

ellipse(x/2,y/2,500,500);
//ellipse(x/2,y/2,600,600);

 
 angle+=360;
  r=r-1;
  if(r==0||r==10){
  d=d*-1;
}
   
   
  println(x+":"+y);
 
}
