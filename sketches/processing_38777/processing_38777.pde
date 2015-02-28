
int sizess = 20;
int goingup = 1;

// resource  http://processing.org/learning/topics/bounce.html 
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape


int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom



//START OF 2nd OBJECT
float xpos2, ypos2;    // Starting position of shape    

float xspeed2 = 1.5;  // Speed of the shape
float yspeed2 = 1.9;  // Speed of the shape

int xdirection2 = 1;  // Left or Right
int ydirection2 = 1;  // Top to Bottom
//END OF 2ND OBJECT

//START OF 3nd OBJECT
float xpos3, ypos3;    // Starting position of shape    

float xspeed3 = 1.5;  // Speed of the shape
float yspeed3 = 1.9;  // Speed of the shape

int xdirection3 = 1;  // Left or Right
int ydirection3 = 2;  // Top to Bottom
//END OF 3ND OBJECT

void setup(){
  size (800,800);
    xpos = width/3;
  ypos = height/3;
  xpos2 = width/2;
  ypos2 = height/2;
    xpos3 = width/2;
  ypos3 = height/2;
  background(255, 255, 255);
}


// end of resource



void draw(){

  float circlesize = 0+random(200);
  
    if(sizess == 50){
    goingup = 0;
  }
  if(sizess == 0){
    goingup = 1;
  }
  // resource  http://processing.org/learning/topics/bounce.html 
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  

  if (xpos > width-sizess || xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > height-sizess || ypos < 0) {
    ydirection *= -1;
  }
  // end of resource
  // resource  http://processing.org/learning/topics/bounce.html 
  xpos2 = xpos2 + ( xspeed2 * xdirection2 );
  ypos2 = ypos2 + ( yspeed2 * ydirection2 );
  

  if (xpos2 > width-sizess || xpos2 < 0) {
    xdirection2 *= -1;
  }
  if (ypos2 > height-sizess || ypos2 < 0) {
    ydirection2 *= -1;
  }
  // end of resource
  
    // resource  http://processing.org/learning/topics/bounce.html 
  xpos3 = xpos3 + ( xspeed3 * xdirection3 );
  ypos3 = ypos3 + ( yspeed3 * ydirection3 );
  

  if (xpos3 > width-sizess || xpos3 < 0) {
    xdirection3 *= -1;
  }
  if (ypos3 > height-sizess || ypos3 < 0) {
    ydirection3 *= -1;
  }
  // end of resource
  
  
  if(goingup == 1){
    
    sizess = sizess + 5;
    
  }else if (goingup == 0 ){
    sizess = sizess - 5;
  }
  
  noStroke();
  int fillcolor1 = 0;
  fill(120+random(200),64,87);

  delay(20);
  rect(xpos,ypos,sizess,sizess,sizess,sizess);
  fill(120+random(200),20,140);
  rect(xpos2,ypos2,sizess,sizess,sizess,sizess);
    fill(120+random(200),160,240);
  ellipse(xpos3,ypos3,sizess,sizess);
    fill(120+random(200),240,1);
  rect(mouseX,mouseY,sizess,sizess);
  //ellipse(xpos,ypos,sizess,sizess);
}

