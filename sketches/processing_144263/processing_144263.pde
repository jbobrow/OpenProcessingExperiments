

float x,y; 


void setup(){ 


size(600,600); 


smooth(); 


strokeWeight(2); 


textSize(25);   //sige pont size 


x=width/2; 


y=height/2; 


} 


void draw(){ 
 


println(mouseX + " : " + mouseY); 


background(255, 167, 167); 


drawclock(); 


} 


void drawclock(){ 


  fill(250);          //sige col.or   rgbx2.3 



beginShape(); 


vertex (312,22);
vertex (375,97); 
vertex (447,57); 
vertex (458,137);
vertex (528,169);
vertex (500,234); 
vertex (549,288);
vertex (512,337);//3.5
vertex (525,410);
vertex (470,448);
vertex (435,517); 
vertex (369,499);
vertex (303,538);
vertex (247,495);
vertex (187,504);
vertex (163,435);
vertex (90,419);
vertex (112,346);
vertex (56,291);
vertex (116,241);
vertex (99,153);
vertex (180,148);
vertex (184,71);
vertex (258,85);


endShape(CLOSE); 


strokeWeight(4); 


noFill (); 


beginShape(); 


  


endShape(CLOSE); 



  drawNumbers(); 


float s_angle=map(second(),0,60,0,TWO_PI); 


pushMatrix(); 


translate(x,y); 


rotate(s_angle); 


stroke(0); //banel col.or 


line(0,0,0,-200); 


popMatrix(); 


float M_angle=map(minute(),0,60,0,TWO_PI); 


pushMatrix(); 


translate(x,y); 


rotate(M_angle); 


stroke(204,61,61); //banel col.or 


line(0,0,0,-100); 


popMatrix(); 


float h_angle=map(hour(),0,60,0,TWO_PI); 


pushMatrix(); 


translate(x,y); 


rotate(h_angle); 


stroke(204,61,61); // banel col.or (back) 


line(0,0,0,-150); 


popMatrix(); 


} 


void drawNumbers(){ 


  float r=190; 


  float inc=TWO_PI/12; 


  for (int i=1; i<=12; i++){ 


    float xn=x+cos (i*inc-HALF_PI)*r; 


    float yn= y+sin(i*inc-HALF_PI)*r; 


    fill(50); 


    text(i,xn,yn); 


  }} 

