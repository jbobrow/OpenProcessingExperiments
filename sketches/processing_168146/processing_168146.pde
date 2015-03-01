
void setup(){
size(1000,800); 
}
void draw(){
background(100);
 noStroke();
fill(139,174,255,100); 
int k=mouseX/5;
int u=103;
arc(750,450,266,266,radians(90-k),radians(90+k));
arc(450,450,266,266,radians(90-k),radians(90+k)); 
 float pX = 133*sin(k/57.3);
  float pY = 133*cos(k/57.3);
 float pXb = 133*sin(-k/57.3);
 float pYb = 133*cos(-k/57.3);
 if (k<90){ 
fill(100); 
 } 
   triangle(750,450    , 750+pX   , 450+pY    ,750+pXb    ,450+pYb);
stroke(0);
 triangle(150,450    , 150+pX   , 450+pY    ,150+pXb    ,450+pYb);
}
