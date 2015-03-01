


float x,y;
float angle=0;
float r=200;
float d=1;

 void setup(){
size(600,600);

background(#FAFAFC);

}

void draw(){
 
  noFill();

  x=r*sin(angle);
  y= r*cos(angle); 
  
 noFill();
 translate(width/2,height/2);
 rotate(r);
 
stroke(30, 60, 55, 25);

ellipse(0,0,x,y);
ellipse(x/2,y/2,300,300);
ellipse(x/2,y/2,300,300);



 angle+=10;
  r=r-1;
  if(r==0||r==100){
  d=d*-1;
}
  
  
  println(x+":"+y);

}
