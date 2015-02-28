
boolean buttonR=false;
boolean buttonG=false;
boolean buttonB=false;

int d=30;
int x=d/2;
int y=d/2;
int speedx=1;
int speedy=1;


void setup() {
  size(300,550);
  background(125);
}

void draw() {
  
  // buttons
 
  stroke(255);
  fill(255,0,255);
  rect(240,50,30,50);
  
  stroke(255);
  fill(0,255,0);
  rect(240,150,30,50);
  
  stroke(255);
  fill(0,0,255);
  rect(240,250,30,50);
  
  


  // bouncing ball
    
  
  x=x+speedx;
  y=y+speedy;
  
  if (x>width-100 || x<d/2) {
    speedx=speedx*-1;
  }
  
  if (y>height-d/2 || y<d/2) {
    speedy=speedy*-1; 
  }   
  
  fill(0);
  
     if (buttonR) {
    fill(255,0,255);
  } else if (buttonG) {
    fill(0,255,0);
  } else if (buttonB) {
    fill(0,0,255);
  }
 
  
  stroke(255);
  ellipse(x,y,d,d);

  
}

void mousePressed() {
  
   if (mouseX<275 && mouseX>240 && mouseY<100 && mouseY>50) {
    buttonR=true;
    buttonG=false;
    buttonB=false;
   } else if (mouseX<275 && mouseX>240 && mouseY<200 && mouseY>150) {
    buttonR=false;
    buttonG=true;
    buttonB=false;
   } else if (mouseX<275 && mouseX>240 && mouseY<300 && mouseY>250) {
     buttonR=false;
     buttonG=false;   
     buttonB=true;
   }
}

void keyPressed() {
  background(125);
  x=d/2;
  y=d/2;
}


