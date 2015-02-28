
/////variables///////////////////////////////////////////////////////////
Wren wrenOne;
Wren wrenTwo;
 
void setup(){
  size (900,726);//the size of your sketch in pixels
  smooth();//turns on anti-ailiasing, witch smooths out some rough edges
  frameRate (14);
   
  wrenOne = new Wren (600, 400, 1);
 //wrenTwo = new Wren (400, 200, 1);
}
   
/////draw///////////////////////////////////////////////////////////////
void draw() {
 
  background(0, 255, 255);//cyan
 
  ellipseMode(CENTER);
   
  wrenOne.display();
  //wrenTwo.display();
}
 
class Wren{
  float centerX;
  float centerY;
  int dir;
  int legdir;
  int speed;
 
 Wren(float _centerX, float _centerY, int _dir) {
    
   centerX = _centerX;
   centerY = _centerY;
   dir = _dir;
   legdir= 1;
   speed= 2;
     
    float legaX=centerX+10 + 4*legdir;
    legdir= legdir*-1;
    float legbX=centerX-10 +4*legdir;
    legdir= legdir*1;
     
 
  ellipseMode(CENTER);
     
   
 } 
void display  (){
         
  float  legaX=centerX+10 + 4*legdir;
         legdir= legdir*-1;
  float  legbX=centerX-10 +4*legdir;
         legdir= legdir*1;
   
 /////tail feather
   
    fill(200,125,0);//yellow/brown
    triangle(centerX +60*-dir, centerY -70,  centerX +60*-dir, centerY +20 , centerX +90*-dir, centerY);
    
/////body
   
     stroke(0);//black
     fill(180, 125,60);//brown
     ellipse(centerX, centerY ,130,130);
    
/////eyes
    
    noStroke();
      fill(0);//black
      ellipse(centerX -10*-dir,centerY -10, 4, 4);//left
      ellipse(centerX -50*-dir,centerY -10, 4, 4);//right
   
 //if (mouseX < centerX +130, centerX -130) || (mouseY < centerY +130, centerY -130) ;
 // ellipse(centerX -10*-dir,centerY -10, 8, 8);//left
 // ellipse(centerX -50*-dir,centerY -10, 8, 8);//right
   
/////front left leg
  
      stroke(0); //solid black
      strokeWeight(2);//line will have a thickness of 2
      line (centerX +10, centerY +65, legaX, centerY +115);
   
/////front right leg
   
      stroke(0); //solid black!!!need to be re-set
      strokeWeight(2);
      line (centerX -10, centerY +65,legbX,centerY +115);
    
//////beak
  
      fill(255,255,0);//yellow
      triangle(centerX -30*-dir, centerY, centerX -50*-dir, centerY +10, centerX -30*-dir, centerY +20);
 
/////movement
   // void moveH (float sp){
     
        centerX = centerX+2*dir;
        centerX = centerX+1*dir;
        if(centerX>width -80||centerX<80)
        dir=dir*-1;
      //}
     
       if (mouseX > centerX -120 && mouseX < centerX +120 && mouseY > centerY -120 && mouseY < centerY +120){
       fill(0);//black
       ellipse(centerX -10*-dir,centerY -10, 8, 8);//left
       ellipse(centerX -50*-dir,centerY -10, 8, 8);//right
      }
 
       
     
//void mousePressed(){
  // saveFrame ("screenshot.jpg");
}
}               
