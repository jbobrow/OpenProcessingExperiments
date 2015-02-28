
void setup () {
  size(1280,800);
  ellipseMode( CENTER );
  rectMode( CENTER );
  frameRate(20);
}
//GLOBAL VARIABLES
float xpos = 640;
float ypos = 400;
boolean crouch = false;
boolean aim = false;
float height1 = 100;
float velocity = 0;
float gravity = 5;


void draw() {
    background(200);
    
//HEIGHT OF THRE CHARACTER BASED ON CROUCH AND STAND
if (crouch == true) {
  height1 = 50;
} else { height1 = 100;
}
  
if(keyPressed) {
   if (key == ' ' && ypos == 600) {
     if (crouch == false) {
     velocity = -50;
     aim = false;
     } else { 
       crouch = false;
       velocity = -65;
     }
   } else if (key == 'a') {
     //move left
     if (crouch == false) {
     xpos = xpos - 10;
     } else { 
       xpos = xpos - 5;
     }
   } else if (key == 'd') {
     //move right
    if (crouch == false) {
     xpos = xpos + 10;
     } else { 
       xpos = xpos + 5;
     }
   } else if (key == 'd' && key == ' ') {
     //jump right
    if (crouch == false) {
     xpos = xpos + 10;
     velocity = -35;
     } else { 
       xpos = xpos + 5;
     }
   }
}

if(keyPressed) {
   if (key == 's') {
     if (crouch == false) {
     crouch = true;
     } else {
       crouch = false;
     }
   }
   
   if (key == 'w') {
     if (crouch == true) {
     crouch = false;
     }
   }
   
   if (key == 'r') {
     if (aim == false) {
     aim = true;
     } else {
       aim = false;
   }
   
   
}
}


velocity = velocity + gravity;

ypos = ypos + velocity;


if (ypos > 600) {
  ypos = 600;
}

  
  
     if (aim == true) {
       fill(255,0,0);
       ellipse(xpos, ypos, 200,200);
       fill(200);
       ellipse(xpos, ypos, 180,180);
    }

  
  fill(50);
  ellipse(xpos,ypos,50,height1);
  
  
  
}




