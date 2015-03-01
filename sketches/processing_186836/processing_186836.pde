
//Variables
int headsize = 100;
float xposition = 350;
float yposition = 200;
float xposition2 = 400;
float yposition2 = 250;
float xposition3 = 450;
float yposition3 = 300;
float xposition4 = 500;
float yposition4 = 350;



void setup() {
  size(500,500);
  colorMode(HSB);
  background(255);
  noStroke();
  noCursor();
  smooth();
  

 
}
void drawWings(){
//WINGS


    //Left Wing Membrane curve
      fill(32, 170, 240);
      beginShape();
      vertex(xposition2-49, yposition2-65);
      bezierVertex(xposition2-47, yposition2-105, xposition2-47, yposition2-105, xposition2-88, yposition2-123);
      endShape();
      
    //Left Wing Membrane Tri Upper
      triangle(xposition2-88, yposition2-123, xposition2-80, yposition2-80, xposition2-53, yposition2-106);
      
    //Left Wing Membrane Tri Lower
      triangle(xposition2-80, yposition2-80, xposition2-49, yposition2-65, xposition2-53, yposition2-100);  
  
    //Right Wing Membrane curve
      fill(32, 170, 240);
      beginShape();
      vertex(xposition2+49, yposition2-65);
      bezierVertex(xposition2+47, yposition2-105, xposition2+47, yposition2-105, xposition2+88, yposition2-123);
      endShape();
      
    //Right Wing Membrane Tri Upper
      triangle(xposition2+88, yposition2-123, xposition2+80, yposition2-80, xposition2+53, yposition2-106);
      
    //Right Wing Membrane Tri Lower
      triangle(xposition2+80, yposition2-80, xposition2+49, yposition2-65, xposition2+53, yposition2-100);  
  
    //Left Wing Base
      fill(120, 200, 130);
      beginShape();
      vertex(xposition2-49, yposition2-65);
      bezierVertex(xposition2-55, yposition2-120, xposition2-55, yposition2-120, xposition2-40, yposition2-60);
      endShape();
  
    //Left Wing Top
      beginShape();
      vertex(xposition2-53, yposition2-106);
      bezierVertex(xposition2-100, yposition2-130, xposition2-100, yposition2-130, xposition2-50, yposition2-98);
      endShape();
  
    //Left Wing Middle
      beginShape();
      vertex(xposition2-53, yposition2-106);
      bezierVertex(xposition2-90, yposition2-70, xposition2-90, yposition2-70, xposition2-50, yposition2-98);
      endShape();
  
    //Right Wing base
      beginShape();
      vertex(xposition2+49, yposition2-65);
      bezierVertex(xposition2+55, yposition2-120, xposition2+55, yposition2-120, xposition2+40, yposition2-60);
      endShape();

    //Right Wing Top
      beginShape();
      vertex(xposition2+53, yposition2-106);
      bezierVertex(xposition2+100, yposition2-130, xposition2+100, yposition2-130, xposition2+50, yposition2-98);
      endShape();
  
    //Right Wing Middle
      beginShape();
      vertex(xposition2+53, yposition2-106);
      bezierVertex(xposition2+90, yposition2-70, xposition2+90, yposition2-70, xposition2+50, yposition2-98);
      endShape();

   
}
  
void moveWings() {
/*pushMatrix();
//if(yposition2 > 5){
  translate(0, -10);
  if(yposition2 == -10);
  translate(0, 10);
  drawWings();
  
//  }
popMatrix();*/

    if(mousePressed){
      pushMatrix();
      translate(0, -10);
      drawWings();
      popMatrix();
    }else{
     drawWings();
    }  
    
}



void draw() {
  background(255); 
    //Custom Function
      //drawWings();
        moveWings();
  
  //FEET
    //Left Foot
      fill(120, 200, 80);
      ellipse(xposition4-33, yposition3+94, 21, 65);  
      
    //Right Foot 
      ellipse(xposition4+33, yposition3+94, 21, 65);    
  
  //LEGS
    //Left Leg
      fill(120, 200, 100);
      ellipse(xposition3-40, yposition3+57, 45, 90);    
    //Right Leg
      ellipse(xposition3+40, yposition3+57, 45, 90);    
  
  //BODY
    fill(120, 200, 130);
    ellipse(xposition2, yposition2+5, 155, 143); 
    
  
  //ARMS
    //Left Arm
      fill(120, 200, 172);
      rect(xposition2+25, yposition2+56, 9, 25); 
      
    //Right Arm      
      rect(xposition2-25, yposition2+56, 9, 25);  
      
    //Hands
      //Left Hand
        ellipse(xposition2-27, yposition2+80, 7, 7);
        ellipse(xposition2-21, yposition2+84, 8, 8);
        ellipse(xposition2-15, yposition2+80, 7, 7);
    
      //Right Hand
        ellipse(xposition2+35, yposition2+80, 7, 7);
        ellipse(xposition2+29, yposition2+84, 8, 8);
        ellipse(xposition2+23, yposition2+80, 7, 7);
    
  //HORNS
    //Left Horn
      fill(32, 130, 255);
      beginShape();
      vertex(xposition-31, yposition-40);
      bezierVertex(xposition-35, yposition-101, xposition-35, yposition-101, xposition, yposition-40);
      endShape();
  
    //Right Horn
      fill(32, 130, 255);
      beginShape();
      vertex(xposition+31, yposition-40);
      bezierVertex(xposition+35, yposition-101, xposition+35, yposition-101, xposition, yposition-40);
      endShape();
  
  //triangle(xposition-35, yposition-40, xposition-25, yposition -90, xposition-8, yposition-40);  //lefthorn
  //triangle(xposition+35, yposition-40, xposition+25, yposition -90, xposition+8, yposition-40);  //righthorn
  
  //HEAD
    fill(120, 200, 172);
    ellipse(xposition, yposition, headsize, headsize);       

  //EYE SOCKETS
    //Left Socket
      ellipse(xposition-28, yposition-39, 20, 25);   
      ellipse(xposition+28, yposition-39, 20, 25);                                                

  //JAW
  fill(32, 170, 240);                                                                          
  ellipse(xposition, yposition +25, 105, 60);
  
  //CHEEKS
    //Left Cheek
      ellipse(xposition-40, yposition+15, 30, 50);  
    //Right Cheek
      ellipse(xposition+40, yposition+15, 30, 50);                                                   //right cheek
  
  
  //EARS
    //Top of left ear
      fill(120, 200, 172);
      beginShape();
      vertex(xposition-30, yposition-30);
      bezierVertex(xposition-40, yposition-45, xposition-50, yposition-35, xposition-85, yposition-5);
      endShape();
    //Bottom of left ear
      beginShape();
      vertex(xposition-30, yposition-40);
      bezierVertex(xposition-25, yposition-15, xposition-50, yposition-35, xposition-85, yposition-5);
      endShape();     
  
  //Top of right ear
      beginShape();
      vertex(xposition+30, yposition-30);
      bezierVertex(xposition+40, yposition-45, xposition+50, yposition-35, xposition+85, yposition-5);
      endShape();
  
  //TEETH
    //left tooth
      fill(32, 170, 240);  
      beginShape();
      vertex(xposition-30, yposition+15);
      bezierVertex(xposition-30, yposition-40, xposition-30, yposition-40, xposition, yposition+15);
      endShape();
    //right tooth
      fill(32, 170, 240);  
      beginShape();
      vertex(xposition+30, yposition+15);
      bezierVertex(xposition+30, yposition-40, xposition+30, yposition-40, xposition, yposition+15);
      endShape();
      //triangle(xposition-30, yposition-20, xposition-30, yposition +15, xposition, yposition+15);  //left tooth
      //triangle(xposition+30, yposition-20, xposition+30, yposition +15, xposition, yposition+15);  //right tooth
  
  
  //EYES
    //Left Eye
      fill(255);
      ellipse(xposition - 29, yposition - 39, 10, 12);  
    //Right Eye      
      ellipse(xposition + 29, yposition - 39, 10, 12);                                               
  
  //PUPILS
    //Left Pupil
      fill(10);
      ellipse(xposition - 27, yposition - 38, 4, 4);  
    //Right Pupil
      ellipse(xposition + 27, yposition - 38, 4, 4);                                           
  
  //NOSE
  fill(0);
    //Left Nostril
      ellipse(xposition-6, yposition-24, 3, 7); 
    //Right Nostril  
      ellipse(xposition+6, yposition-24, 3, 7);                                                     
  
  //Mouse Position Var Calculations
  xposition = xposition + (mouseX - xposition)/20.0;                                            //head delay x
  yposition = yposition + (mouseY - yposition)/20.0;                                            //head delay y
  xposition2 = xposition2 + (mouseX - xposition2)/25.0;                                         //body delay x
  yposition2 = yposition2 + (mouseY - yposition2)/25.0;                                         //body delay y
  xposition3 = xposition3 + (mouseX - xposition3)/30.0;                                         //legs delay x
  yposition3 = yposition3 + (mouseY - yposition3)/30.0;                                         //legs delay y
  xposition4 = xposition4 + (mouseX - xposition4)/35.0;                                         //feet delay x
  yposition4 = yposition4 + (mouseY - yposition4)/35.0;                                         //feet delay x

  



  


}



