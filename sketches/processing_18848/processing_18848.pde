
/////BENJAMIN FUNKE // EMERGING FORMATS // UND // WINTER WREN W/ MOVEMENT AND ROLLOVER //
////setup
 
  float centerX = 800;
  float centerY = 400;
  int dir = 1;
  int legdir = 1;
  int speed = 2;
 
 
  void setup(){
    size (900,726);
    smooth();
  
  frameRate (14);
}
  
////draw
  
  void draw(){
 
    float legaX=centerX+10 + 4*legdir;
    legdir= legdir*-1;
    float legbX=centerX-10 +4*legdir;
    legdir= legdir*1;
    
    background(0, 255, 255);//cyan

  ellipseMode(CENTER);
    
  //tail feather
  
    fill(200,125,0);//yellow/brown
    triangle(centerX +60*-dir, centerY -70,  centerX +60*-dir, centerY +20 , centerX +90*-dir, centerY);
   
  //body
  
    stroke(0);//black
    fill(180, 125,60);//brown
    ellipse(centerX, centerY ,130,130);
   
  //eyes
   
    noStroke();
    fill(0);//black
    ellipse(centerX -10*-dir,centerY -10, 4, 4);//left
    ellipse(centerX -50*-dir,centerY -10, 4, 4);//right
  
  //front left leg
 
    stroke(0); //solid black
    strokeWeight(2);//line will have a thickness of 2
    line (centerX +10, centerY +65, legaX, centerY +115);
  
   //front right leg
  
    stroke(0); //solid black!!!need to be re-set
    strokeWeight(2);
    line (centerX -10, centerY +65,legbX,centerY +115);
   
  //beak
 
    fill(255,255,0);//yellow
    triangle(centerX -30*-dir, centerY, centerX -50*-dir, centerY +10, centerX -30*-dir, centerY +20);

  //movement
  
    centerX = centerX+2*dir;
    centerX = centerX+1*dir;
    if(centerX>width -80||centerX<80){
    dir=dir*-1;
  }
    
    if (mouseX > centerX -120 && mouseX < centerX +120 && mouseY > centerY -120 && mouseY < centerY +120){
    fill(0);//black
    ellipse(centerX -10*-dir,centerY -10, 8, 8);//left
     ellipse(centerX -50*-dir,centerY -10, 8, 8);//right 
    }
}

void mousePressed(){
 
    saveFrame ("screenshot.jpg");
}

