
int limit = 70;
boolean saveNow=false;
int currentFrame = 0;
int frameLimit = 10;
int framePace = 0;
boolean start = false;
float lastX;
float lastY;
float mouseVel;
float lastR;
float rRate=4;
float currentR;
float rAccel=0.1;
float rRateLimit = 10;
int sketchSize = 500;
float absMouseV;
float lilCircleMax = sketchSize*2;
float lilCircleR;
float theta;
float lilCircleX;
float lilCircleY; 


void setup() {
  background(0);
  size(sketchSize, sketchSize);
  stroke(255);
}

void draw() {  
  
  mouseVel = (mouseX-lastX)+(mouseY-lastY);
    absMouseV = abs(mouseVel);
  if (mouseVel<10 && mouseVel!=0) start = true;

  if (start==true) {
    //slow fade
    fill(0,0.5);
    rect(0,0,sketchSize,sketchSize);
    
    

    //big circles
   

    //accel size
    rRate -=(absMouseV/width)*rRate;
    if (rRate+rAccel<rRateLimit) rRate+=rAccel;

    if (lastR-rRate >= 0) currentR = lastR-rRate;
    if (currentR+absMouseV < width/1.5) currentR += absMouseV;
    
    stroke(255,100-rRate);
    strokeWeight(1);
    fill(10, (absMouseV/6)-rRate+20);
    //big circles cont
    ellipse(width/2, height/2, currentR, currentR);
    lastR=currentR;
    if (currentR<rRate) rRate = 0;


    //line stuff
    
    stroke(255, absMouseV*10);
 
    line(width/2, height/2, mouseX, mouseY);



    //little circles
    stroke(255,100);
    strokeWeight(1);
    theta = atan((float)(mouseY-(height/2))/(mouseX-(width/2)));

    lilCircleR = (absMouseV/width)*lilCircleMax;
    
   
    fill(255, 0);
    
    //fix lil circles getting on wrong side of mouse
    if (mouseX < width/2) {
      lilCircleX = mouseX-(lilCircleR*cos(theta));
    } else {
      lilCircleX = mouseX+(lilCircleR*cos(theta));
    }
    
    if (mouseX < width/2) {
      lilCircleY = mouseY-(lilCircleR*sin(theta));
    } else {
      lilCircleY = mouseY+(lilCircleR*sin(theta));
    }
    
    ellipse(lilCircleX, 
    lilCircleY, 
    lilCircleR*2, 
    lilCircleR*2);



    //save pic sequence
    if (currentFrame<=limit && saveNow==true) {
      if (framePace == frameLimit) {
        saveFrame("output-###.png");
        currentFrame++;
        framePace = 0;
      } 
      else {
        framePace++;
      }
    } 
    else {
      saveNow = false;
      currentFrame = 0;
    }
  }


  lastX=mouseX;
  lastY=mouseY;
}

void displayText(String in){
  textSize(32);
  fill(0, 102, 153);
   text(in, 10, 30); 
}

void mousePressed() {
  saveFrame("snap-###.png");
}

void keyPressed() {
  if (key=='s')  saveNow = true;
  if (key=='r') background(0);
}



