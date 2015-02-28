
class Object
{
  //=======Display Wall==========
  //Front Wall
  void drawWall()
  {
    pushMatrix();
    translate(width/2,height/2,-700);
    
    beginShape();
    texture(BackgroundDesert2Front);
    vertex(-400, -300, 0, 0);
    vertex(400, -300, 500, 0);
    vertex(400, 300, 500, 512);
    vertex(-400, 300, 0, 512);
    endShape();
    
    popMatrix();
  }
  void drawWall2()
 //Left Wall drawWall2()
  {
    pushMatrix();
    translate(width/2,height/2,-700);
    
    beginShape();
    texture(BackgroundDesert2Left);
    vertex(-400, -300, 0, 0);
    vertex(-400, -300, 570, 100, 0);
    vertex(-400, 300, 570, 100, 512);
    vertex(-400, 300, 0, 512);
    endShape();

    popMatrix();
  }
  //Right Wall
 void drawWall3()
 {
   pushMatrix();
   translate(width/2,height/2,-700);
   
   beginShape();
   texture(BackgroundDesert2Right);
   vertex(400, -300, 0, 0);
   vertex(400, -300, 570, 100, 0);
   vertex(400, 300, 570, 100, 512);
   vertex(400, 300, 0, 512);
   endShape();
   
   popMatrix();
 }
 //Celling
 void drawWall4()
 {
   pushMatrix();
   translate(width/2,height/2,-700);
   beginShape();
   texture(BackgroundDesert2Celling);
 
   vertex(400, -300, 0, 0);
   vertex(400, -300, 570, 100, 0);
   vertex(-400, -300, 570, 100, 512);
   vertex(-400, -300, 0, 512);
    
   endShape();
   popMatrix();
 }
 
 //Floor
 void drawWall5()
 {
   pushMatrix();
   translate(width/2,height/2,-700);
   beginShape();
   texture(BackgroundDesert2Floor);
 
   vertex(400, 300, 0, 0);
   vertex(400, 300, 570, 100, 0);
   vertex(-400, 300, 570, 100, 512);
   vertex(-400, 300, 0, 512);
    
   endShape();
   popMatrix();
 }
};
    



