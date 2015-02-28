
//Reference; Louis Edwards. 15/08/11

float Xpos=0;
float Ypos=0;

void setup() {
 size(700,400);
 background(0);
 stroke(255);
 strokeWeight(2);
 smooth();
 noFill();

}


void draw(){
 
 background(0);
 stroke(255);
 
 //-----------------
 
 beginShape();
 
   curveVertex(0,0);
   curveVertex(0,0);
   
   curveVertex(150,pmouseY);
   curveVertex(pmouseX,250);
   curveVertex(500,pmouseY);
  // curveVertex(pmouseX,300);
  // curveVertex(600,pmouseY);
   
   curveVertex(700,400);
   curveVertex(700,400);
   
 endShape();
 
 //-----------------
 
   beginShape();

   stroke(255,255,255,150);
   
   curveVertex(0,0);
   curveVertex(0,0);
   
   curveVertex(180,pmouseY);
   curveVertex(pmouseX,280);
   curveVertex(530,pmouseY);
   //curveVertex(pmouseX,80);
   //curveVertex(600,pmouseY);
   
   curveVertex(700,400);
   curveVertex(700,400);
   
 endShape();
 
 //---------------
 
  stroke(255,255,255,60); 
 
   beginShape();
   curveVertex(0,0);
   curveVertex(0,0);
   
   curveVertex(210,pmouseY);
   curveVertex(pmouseX,310);
   curveVertex(560,pmouseY);
   //curveVertex(pmouseX,110);
   //curveVertex(600,pmouseY);
   
   curveVertex(700,400);
   curveVertex(700,400);
   
 endShape();

 //---------------


  // beginShape();
   
  // curveVertex(0,100);
   //curveVertex(0,100);
   
   //curveVertex(100,pmouseY);
   //curveVertex(pmouseX,340);
   //curveVertex(300,pmouseY);
   //curveVertex(pmouseX,140);
   //curveVertex(600,pmouseY);
   
   //curveVertex(700,300);
  // curveVertex(700,300);
   
  //endShape();

//----------------- 


//above white line

beginShape();

   stroke(255,255,255,150);
   
   curveVertex(0,0);
   curveVertex(0,0);
   
   curveVertex(120,pmouseY);
   curveVertex(pmouseX,220);
   curveVertex(470,pmouseY);
   //curveVertex(pmouseX,80);
   //curveVertex(600,pmouseY);
   
   curveVertex(700,400);
   curveVertex(700,400);
   
 endShape();


//-------------------

stroke(255,255,255,60); 
 
   beginShape();
   curveVertex(0,0);
   curveVertex(0,0);
   
   curveVertex(90,pmouseY);
   curveVertex(pmouseX,190);
   curveVertex(440,pmouseY);
   //curveVertex(pmouseX,110);
   //curveVertex(600,pmouseY);
   
   curveVertex(700,400);
   curveVertex(700,400);
   
 endShape();
 
 //--------------------
 
// stroke(255,255,255,60); 
 //
  // beginShape();
  // curveVertex(0,0);
  // curveVertex(0,0);
   
  // curveVertex(30,pmouseY);
  // curveVertex(pmouseX,130);
  // curveVertex(380,pmouseY);
   //curveVertex(pmouseX,110);
   //curveVertex(600,pmouseY);
  // 
  // curveVertex(700,400);
 //  curveVertex(700,400);
   
// endShape();
 
 //--------------------
 
 // stroke(255,255,255,60); 
 
  // beginShape();
  // curveVertex(0,0);
  // curveVertex(0,0);
   
 // curveVertex(270,pmouseY);
 // curveVertex(pmouseX,370);
  // curveVertex(620,pmouseY);
   //curveVertex(pmouseX,110);
   //curveVertex(600,pmouseY);
   
  // curveVertex(700,400);
  // curveVertex(700,400);
   
// endShape();
 
 Xpos = Xpos +(mouseX- Xpos/10);
 Ypos = Ypos +(mouseY-Ypos/10);
 
}

