
import processing.pdf.*;
int x = 0;


float topToungeCurves = 0;
float tounge;
float toungeLine;
float whites = 30;
float nose;
float brows = -40;
float pupil = 5;
float head = 30;
float topNose = 4;
float toungesideright;
float toungelength;
float toungelineY;
//float back1 = random(0,255);
//float back2 = random(0,255);
//float back3 = random(0,255);
float hair1 = random(255);
float hair2 = random(0);
float hair3 = random(0);
float cheeksr = random(200,255);
float cheeksg = random(60,210);
float cheeksb = random(150,200);
float broww = random (2,15);
float headlength = 190;
float vary = random(175,190);

void setup(){
   size(3525,5325);
   beginRecord(PDF, "sketch_140410b.pdf");
   background(88,88,88);
   translate(146.875,190);
   noStroke();
   repeatShape();
   endRecord();
   
}
  
void draw(){

}
 
void makeShape(){
// back1 = random(0,255);
//back2 = random(0,255);
// back3 = random(0,255);
 whites = random(26,39);
 pupil = random(2,23);
 nose = random(1,30);
 topToungeCurves = random(1);
 tounge = random(-22,-1);
 brows = random(-65,-40);
 broww = random(2,15);
 whites = random(20,40);
 topNose = random(-10,10);
 head = random(1,250);
 toungesideright = random(20,29);
 toungelength = random(1,60);
 //back1 = random(200,255);
 //back2 = random(0,40);
 //back3 = random(200,255);
 hair1 = random(0,255);
 hair2 = random(0,255);
 hair3 = random(0,255);
 cheeksr = random(240,255);
 cheeksg = random(60,210);
 cheeksb = random(150,200);
 headlength = random(180,220);
 vary = random(175,190);
 

  
  float shapeColor[] = {random(0,255), random(0,255), random(0,255)};
fill(shapeColor[0], shapeColor[1], shapeColor[2]);
//ellipse(0,0,200,200);

 //translate(150,150);
 //fill(153,204,255);
 //ellipse(-1,-3,170,68);
  
// fill(back1,back2,back3);
 //rect(-150,-150,300,300);  
 
 fill(0,0,0);
 ellipse(80,20,7,10);

   
 fill(242,223,vary);
 rect(-75,-89,150,headlength,head);
   
   
 fill(242,223,186);

 ellipse(-75,13,13,15);
   
 fill(242,223,186);
 ellipse(75,13,13,15);
   
 //pupil
   
 fill(255,255,255);
 ellipse(20,-20,whites,whites);
   
 fill(255,255,255);
 ellipse(-20,-20,whites,whites);
   
 fill(0,0,0);
 ellipse(-20,-20,pupil, pupil);
   
 fill(0,0,0);
 ellipse(20,-20,pupil,pupil);
   
 //nose
   
 fill(255,255,255);
 triangle(0,topNose,-7,nose,7,nose);
   
 //mouth
   
 fill(255,102,153);
 rect(tounge,35,toungesideright,toungelength,topToungeCurves,topToungeCurves,30,30);
   
 fill(0,0,0);
 rect(-20,30,40,5);
   
 fill(255,255,255);
 rect(5,35,7,10);
  
 fill(0,0,0);
   
   
 //cheeks
   
 fill(cheeksr,cheeksg,cheeksb);
 ellipse(-40,10,30,30);
   
 fill(cheeksr,cheeksg,cheeksb);
 ellipse(40,10,30,30);
   
 //eyebrows
 fill(0,0,0);
 rect(-30,brows,28,broww);
   
 fill(0,0,0);
 rect(5,brows,28,broww);
   
 //hair
   
 fill(0,0,0);
 quad(-40, -130, 0, -140, 15, -93, -17, -93);
   
 fill(0,0,0);
 quad(-30, -140, 10, -150, 25, -90, -7, -93);
   
 fill(0,0,0);
 quad(-20, -110, 30, -120, 35, -86, 0, -93);
   
 fill(0,0,0);
 triangle(-18,-96,27,-92,0,-60);
   
 fill(hair1,hair2,hair3);
 triangle(-28,-110,0,-102,-19,-97);
 

}


   void repeatShape(){    
   for (int i=0; i < 216; i++){
     println("MEH" + i);
     makeShape();
     translate(293.75,0);
     //293.75
     x++;
     if (x == 12){
       x = 0;
       translate(-3525,293.75);
       //-3525,293.75
     }
  }
}


