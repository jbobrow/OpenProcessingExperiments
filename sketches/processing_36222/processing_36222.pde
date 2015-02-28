
int maxDots = 2000;
float [] xPos = new float [maxDots];
float [] yPos = new float [maxDots];
float [] colour = new float [maxDots];
int dotDiameter = 1;
int dotEnlarge = 50;

float speed =0;
float gravity = 0.1;

//int index = 0;

void setup(){
  size(700,400);
  background (0);
  noStroke();
frameRate(10);  
ellipseMode(CORNER);
//create();
}

void draw(){
erase();
create();

int rotateCount = 0;
  while(rotateCount <36){
    rotate(radians(10));
    rotateCount++;
  }

//gravity rise
while (pmouseY>mouseY){
  for (int m = 0; m < maxDots; m++){
    fill(0);
    ellipse(xPos[m], yPos[m], dotDiameter, dotDiameter);
    yPos[m] = yPos[m]-speed;
    speed = speed + gravity;
      if (colour[m] <= 1){
       fill(255,0,0); //red
      }
      else if (colour[m] >1 && colour[m] <=2){
      fill(0,255,0); //green
      }
      else if (colour[m] > 2 && colour[m] <=3){
       fill(0,0,255); //blue
      }
      ellipse(xPos[m],yPos[m], dotDiameter, dotDiameter);
if (yPos[m] <0){
  speed = speed * 0.95;
  }
//index++;
  }
}

//enlarge if on a dot
  for (int k = 0; k < maxDots; k++){
    if (xPos[k] == mouseX && yPos[k] == mouseY){
      fill(0);
      ellipse(xPos[k], yPos[k], dotDiameter, dotDiameter);
      if (colour[k] <= 1){
         fill(255,0,0,127); //red
      }
      else if (colour[k] >1 && colour[k] <=2){
        fill(0,255,0,127); //green
      }
      else if (colour[k] > 2 && colour[k] <=3){
         fill(0,0,255,127); //blue
      } 
      ellipse(xPos[k], yPos[k], dotEnlarge, dotEnlarge);
      if (colour[k] <= 1){
         fill(255,0,0); //red
      }
      else if (colour[k] >1 && colour[k] <=2){
        fill(0,255,0); //green
      }
      else if (colour[k] > 2 && colour[k] <=3){
         fill(0,0,255); //blue
      } 
      ellipse(xPos[k], yPos[k], dotDiameter, dotDiameter);
    }
  }
}

 
  
 
  
void create (){
  //frameRate(1);
  for (int i = 0; i < maxDots; i++){
    xPos[i] = random(0, width);
    yPos[i] = random (0,height);  
    
      colour[i] = random (3);
      if (colour[i] <= 1){
       fill(255,0,0); //red
      }
      else if (colour[i] >1 && colour[i] <=2){
      fill(0,255,0); //green
      }
      else if (colour[i] > 2 && colour[i] <=3){
       fill(0,0,255); //blue
      }
ellipse(xPos[i],yPos[i], dotDiameter, dotDiameter);

//index++;
}
}

void erase(){
  
  for (int j = 0; j < maxDots; j++){
    fill(0);
    ellipse(xPos[j], yPos[j], dotDiameter, dotDiameter);
    
    //index++;
  }
}


void mousePressed() {
  noLoop();
}

void mouseReleased() {
 
   loop();
}

