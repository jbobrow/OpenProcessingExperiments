

 
float x, y;
float angle;
float r = 300;
float diff =2;
void setup() {
  size(600, 600);
  background(255,156,0);
   
}
 
void draw() {
 
  x= r*cos(angle);
  y= r*sin(angle);
 
stroke(0.1,20);
 
translate(300,300);
 
noFill();
stroke(223, 255, 90,40);
  ellipse(0, 0, x, y);
   
 stroke(0, 255, 120,50);
  ellipse(x/4,y/4, 50,50);
   
 stroke(255, 0, 198,8);
  line(-300,-300,x,y);
  line(-300,300,y,x);
  line(300,-300,x,y);
 line(300,300,y,x);
  
  
  angle = angle+0.1;
  r = r -diff;
  if(r==0||r==400){
    diff =diff *-1;
  }
  println(r);
}



