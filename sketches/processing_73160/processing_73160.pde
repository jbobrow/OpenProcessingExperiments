
creature creature1;
creature creature2;
creature creature3;
creature creature4;

boolean dancing = true;
//---------------------------------------------------SETUP & MAIN DRAW


void setup() {
  size( 900, 600 );        // size of the window
  creature1 = new creature ( width/2, height/2 );
  creature2 = new creature ( width/2, height/2 );
  creature3 = new creature ( width/2, height/2 );
  creature4 = new creature ( width/2, height/2 );
  //frameRate( 30 );
}

void draw() {
  creature1.drag( mouseX,     mouseY     );
  creature2.drag( mouseX+100 ,mouseY+100 );
  creature3.drag( mouseX+50  ,mouseY+200 );
  creature4.drag( mouseX-155 ,mouseY+60 );
  
  creature1.dance(  25 );
  creature2.dance( -35 );
  creature3.dance(  55 );
  creature4.dance( -45 );
  
  creature1.draw();
  creature2.draw();
  creature3.draw();
  creature4.draw();
}

void mouseReleased() {
  dancing=true;
  creature1.move( mouseX+100,     mouseY+100  );
  creature2.move( mouseX-100,      mouseY+50 );
  creature3.move( mouseX-100,     mouseY-100 );
  creature4.move( mouseX+100,     mouseY-100 );
}

//--------------------------------------------------- CREATURE CLASS

class creature {
 
  //Draw Variables  
  float localX = 170;
  float localY = 360;
  float posX;     // mouse
  float posY;
  
  color dOr = color(228,110,37);
  color bOr = color(247,148,30);
  float eyer = 255;
  float eyeg = 0;
  float eyeb = 0;
  color grayD = color(61);   
  color grayM = color(86);    
  color grayL = color(111);
  
  //Move Variables
  float distanceX; 
  float distanceY; 
  float newX; 
  float newY; 
  float alphaR = 20;
  
  float speedX = 0.1;
  float speedY = 0.2;
  
  //Dance Variables
  boolean isDone = false;
  float danceX;
  float speed = 0;
  float danceXL;
  float danceXR;
  float slow = 0.5;
  
  //Constructor-----------------------------------------CONSTRUCTOR
  creature (float localX, float localY){
    this.localX = localX;
    this.localY = localY;
  }
  
  //----------------------------------------------------DRAW CREATURE
  
  void draw () {
    ellipseMode(CORNERS);
    rectMode(CORNERS);
    smooth();
    noStroke();
    
    pushMatrix ();
    translate(0,180);
    
    // Ears
    fill(dOr);
    triangle(localX-10, localY-340, localX-30, localY-280, localX-10, localY-280);
    triangle(localX+10, localY-340, localX+10, localY-280, localX+30, localY-280);
    
    // Body
    fill(grayM);
    ellipse (localX-30, localY-240, localX+30, localY-180);
    ellipse (localX-30, localY-180, localX+30, localY-120);
    fill(grayL);
    ellipse (localX-20, localY-210, localX+20, localY-150);
    
    // Upper Arms
    fill(dOr);
    rect(localX-110, localY-250, localX-30, localY-230);
    rect(localX+30, localY-250, localX+110, localY-230);
    
    // Shoulders
    fill(grayD);
    ellipse(localX-50, localY-260, localX-10, localY-220);
    ellipse(localX+10, localY-260, localX+50, localY-220);
    
    // Head
    fill(bOr);
    ellipse(localX-31, localY-301, localX+31, localY-239);
    triangle(localX-30, localY-260, localX+30, localY-260, localX, localY-225);
    
    // Eyes
    //stroke(redEyes);
    stroke(eyer, eyeg, eyeb);
    strokeWeight(3.5);
    line(localX-27, localY-270, localX-10, localY-260);
    line(localX+10, localY-260, localX+27, localY-270);
    noStroke();
    
    // Lower Arms
    fill(bOr);
    ellipse(localX-150, localY-260, localX-90, localY-140);
    ellipse(localX+90, localY-260, localX+150, localY-140);
    
    // Claws
    stroke(grayD);
    strokeCap(SQUARE);
    strokeWeight(4.0);
    // Outer
    line(localX-130, localY-150, localX-127, localY-125);
    line(localX+128, localY-150, localX+125, localY-125);
    // Middle
    line(localX-120, localY-150, localX-117, localY-125);
    line(localX+118, localY-150, localX+115, localY-125);
    // Inner
    line(localX-110, localY-150, localX-107, localY-125);
    line(localX+108, localY-150, localX+105, localY-125);
    noStroke();
    
    // Mid Legs
    fill(dOr);
    rect(localX-70, localY-100, localX-50, localY-60);
    rect(localX+70, localY-100, localX+50, localY-60);
    
    // Feet
    fill(bOr);
    triangle(localX-50, localY-80, localX-30, localY-80, localX-70, localY);
    triangle(localX+30, localY-80, localX+50, localY-80, localX+70, localY);
    
    // Upper Legs
    fill(grayD);
    ellipse(localX-80, localY-160, localX-20, localY-80);
    ellipse(localX+20, localY-160, localX+80, localY-80);
    
    popMatrix ();
  }//end draw
  
  //------------------------------------------------- MOUSE DRAG
  
  void drag (float newX, float newY){
    this.newX = newX;
    this.newY = newY;
    
    //Follow mouse on left click
    if ( mousePressed == true ) {
      //create transition from original position to mouse position
      distanceX = newX - localX;
      localX +=   distanceX * speedX;
      distanceY = newY - localY;
      localY +=   distanceY * speedY;
      //black background fade-in
      fill(0, 0, 0, 20);
      rect(0, 0, width, height);
      //change eye colour
      eyeg = constrain (eyeg,0,255);
      eyeg = eyeg + 5;
      //dancing
      dancing = false;     
      } else {
      //black background fade-out
      fill(255, 255, 255, alphaR);
      rect(0, 0, width, height);
      //change back eye colour
      eyeg = constrain (eyeg, 0, 255);
      eyeg = eyeg - 5;
    }
  }
  
  //------------------------------------------------- MOUSE MOVE
    
  void move (float newX, float newY){
    posX = newX;
    posY = newY;
  }//end move
  
  //------------------------------------------------- DANCING MOVEMENT
  
  void dance (float danceX){
    this.danceX = danceX;
    if (dancing == true) {
      danceX= danceX + mouseY / 8 + mouseX / 8;
      localX = posX + danceX * sin(  millis() / 300.0  );
      localY = posY + danceX * sin(  millis() / 150.0  );
    }
  }//end dance

  //------------------------------------------------- END CLASS

}//end class creature
