
void setup(){
  size(960, 640);
  background(0, 0, 0);
}

void draw(){
  // White Background
  fill(255,255,255);
  rect(10,10,940,620);
   
   
   // Lines
     // rectMode(CENTER);
     fill(0,0,0);
     
     // Vertical Lines
     rect(60,60,5,520); //Left
       rect(100,0,5,60);
     rect(180,60,5,580);
     rect(300,0,5,640);
     rect(450,0,5,640); //Center
     rect(600,0,5,640);
       rect(750,0,5,580);
       rect(860,580,5,60);
     rect(900,60,5,520); //Right
     
     // Horizontal Lines
     rect(0,60,960,5); //Top
     rect(0,190,960,5);
     rect(0,320,960,5); //Center
     rect(0,450,960,5);
     rect(0,580,960,5); //Bottom
   
   
   // Squares

     //White
     fill(255,255,255);
     rect(186,516,114,114);
     
     //Red
     fill(245,15,15);
     rect(65,65,235,255);
     rect(455,130,145,115);
     rect(305,515,145,115);
     
     //Blue
     fill(13,127,190);
     rect(305,405,145,115);
     rect(605,325,295,255);
     
     //Yellow
     fill(250,227,23);
     rect(10,455,50,125);
     rect(185,505,55,125);
     rect(305,10,145,180);
     rect(455,455,145,125);
     rect(605,10,145,115);
     
     //Black
     fill(0,0,0);
     rect(65,325,115,125);
     rect(185,445,115,70);
     rect(525,585,80,45);
     rect(675,10,75,55);
     rect(605,125,145,65);
     rect(755,195,145,125);
     
     //Black Strokes
     fill(0,0,0);
     rect(0,60,960,5); //Top
     rect(450,125,300,5);
     rect(450,240,500,5);
     rect(180,405,270,5);
     rect(180,515,270,5);
     rect(240,515,5,120);
     rect(375,195,5,125);
     rect(525,325,5,125);
     rect(525,585,5,65);
     
     //Blue Top
     fill(13,127,190);
     rect(455,10,145,115);
     
     //Yellow Top
     fill(250,227,23);
     rect(905,65,45,125);
     
     //White Top 
     fill(255,255,255);
     rect(605,195,145,125);

   
   //Green Circle
     pushMatrix();
     pushStyle();

       strokeWeight(5);
       
       fill(79,196,66);
       ellipse(678, 258, 130, 130);
       
       translate(width/2, height/2);
       rotate(PI/2);
       scale(1,1);
       
     popStyle();
     popMatrix();
  
  
  //TRIANGLE
  pushMatrix(); // Setting up new Matrix
  pushStyle();
     fill(0,0,0);
     translate(width/2, height/2); //(width/2, height/2)
     rotate(45); //PI/2 is 90 degrees
     scale(15,1);
     rect(5,-109,19.5,5);
   popStyle();
   popMatrix();
   
   pushMatrix(); // Setting up new Matrix
   pushStyle();
     fill(0,0,0);
     translate(width/2, height/2); //(width/2, height/2)
     rotate(-45.05);
     scale(14,1);
     rect(-6,370,19.5,5);
   popStyle();
   popMatrix();
}


