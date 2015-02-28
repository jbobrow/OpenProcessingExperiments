

/////variables///////////////////////////////////////////////////////////
Wren wrenOne;
Wren wrenTwo;

void setup(){
  size (900,726);//the size of your sketch in pixels
  smooth();//turns on anti-ailiasing, witch smooths out some rough edges
  frameRate (14);
  
  wrenOne = new Wren (600, 400, 1);
  wrenTwo = new Wren (400, 200, 1);
}
  
/////draw///////////////////////////////////////////////////////////////
void draw() {

  background(0, 255, 255);//cyan

  ellipseMode(CENTER);
  
  wrenOne.display(1);
  wrenTwo.display(.5);
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
    
  //  float legaX=centerX+10 + 4*legdir;
  //  legdir= legdir*-1;
  //  float legbX=centerX-10 +4*legdir;
  //  legdir= legdir*1;
    

  ellipseMode(CENTER);
    
  
 }  
void display  (float sc){
  

        
  float  legaX=centerX+10*sc + 4*sc*legdir;
         legdir= legdir*-1;
  float  legbX=centerX-10*sc +4*sc*legdir;
         legdir= legdir*1;
  
 /////tail feather
  
    fill(200,125,0);//yellow/brown
    triangle(centerX +60*sc*-dir, centerY -70*sc,  centerX +60*sc*-dir, centerY +20*sc , centerX +90*sc*-dir, centerY);
   
/////body
  
     stroke(0);//black
     fill(180, 125,60);//brown
     ellipse(centerX, centerY ,130*sc,130*sc);
   
/////eyes
   
    noStroke();
      fill(0);//black
      ellipse(centerX -10*sc*-dir,centerY -10*sc, 4*sc, 4*sc);//left
      ellipse(centerX -50*sc*-dir,centerY -10*sc, 4*sc, 4*sc);//right
  
 //if (mouseX < centerX +130, centerX -130) || (mouseY < centerY +130, centerY -130) ; 
 // ellipse(centerX -10*-dir,centerY -10, 8, 8);//left
 // ellipse(centerX -50*-dir,centerY -10, 8, 8);//right 
  
/////front left leg
 
      stroke(0); //solid black
      strokeWeight(2);//line will have a thickness of 2
      line (centerX +10*sc, centerY +65*sc, legaX, centerY +115*sc);
  
/////front right leg
  
      stroke(0); //solid black!!!need to be re-set
      strokeWeight(2);
      line (centerX -10*sc, centerY +65*sc,legbX,centerY +115*sc);
   
//////beak
 
      fill(255,255,0);//yellow
      triangle(centerX -30*sc*-dir, centerY, centerX -50*sc*-dir, centerY +10*sc, centerX -30*sc*-dir, centerY +20*sc);

/////movement
   //void moveH (float sp){
    
        centerX = centerX+2*dir;
        centerX = centerX+1*dir;
        if(centerX>width -80||centerX<80)
        dir=dir*-1;
      //}
    
       if (mouseX > centerX -120*sc && mouseX < centerX +120*sc && mouseY > centerY -120*sc && mouseY < centerY +120){
       fill(0);//black
       ellipse(centerX -10*sc*-dir,centerY -10*sc, 8*sc, 8*sc);//left
       ellipse(centerX -50*sc*-dir,centerY -10*sc, 8*sc, 8*sc);//right 
      }

      
    
//void mousePressed(){
  // saveFrame ("screenshot.jpg");
}
}

