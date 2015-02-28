
float angle = 95.0;

void setup(){
  size(250,250);
  background(225);
  smooth();

}

void draw(){
stroke(255,221,82);
  fill(255,205,0,2);
  angle=angle+0.15;
  translate(220,220);
  rotate(angle+0.09);
  ellipse(-130,-130,90,90);
//orange circles


 stroke(255,168,5);
fill(255,232,188,3);
angle=angle+0.85;
translate(20,20);
rotate(angle);
ellipse(130,130,50,50);
 



stroke(254,255,13);
fill(255,255,185,10);
angle=angle+0.85;
translate(90,90);
rotate(angle+0.09);
ellipse(-20,20,70,70);
 
 
 
  
    
 }



 
  

