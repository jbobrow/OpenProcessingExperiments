
PImage rEye;
PImage bEye;
PImage pEye;
PImage yEye;
PImage maskE;
PImage Eye;
int remainX;
int remainY;
int subY;
int subX;
int counter;
int crossedEye;
boolean blink = false;
int blinkY = -25;
boolean blinking = false;
boolean dilated = true;
boolean light = false;



void setup(){
  size(800, 400);
  rEye = loadImage("redIris.png");
  bEye = loadImage("blueIris.png");
  pEye = loadImage("purpleIris.png");
  yEye = loadImage("yellowIris.png");
  maskE = loadImage("mask.png");
  Eye = bEye;
}

void mouseReleased(){
  crossedEye = 0;
}

void keyPressed(){
  if(key == 'y'){
  Eye = yEye;
  }
  
    if(key == 'b'){
  Eye = bEye;
  }
  
    if(key == 'r'){
  Eye = rEye;
  }
  
    if(key == 'p'){
  Eye = pEye;
  }
  

  if(key == 'l'){
   dilated = !dilated;
   light = !light;
}
}

void mousePressed(){
  counter = 0;
  blink = true;
}

void draw(){
  background(255, 255, 255);
  

  
  subY = abs(mouseY -200);
  remainY = subY/5;
  

  if(mouseY<200){
    remainY=-remainY;
  }
  
   subX = abs(mouseX -400);
  remainX = subX/5;
  

  if(mouseX<400){
    remainX=-remainX;
  }
  
  if(mousePressed){
    if(crossedEye < 90){
     crossedEye++;
    }
    image(Eye, 80+remainX+crossedEye, 100+remainY);
  image (Eye, 470+remainX-crossedEye, 100+remainY);
  image(maskE, 0, 0);
  
  if (dilated == true){
  fill(0);
   ellipse(remainX+197+crossedEye, remainY+185, 70, 70); 
      ellipse(remainX+587-crossedEye, remainY+185, 70, 70); 
}






if (light == true){
  fill(254, 255, 0);
  ellipse(400, -75, 300, 300);
}
  }
  
  else{
  

  image(Eye, 80+remainX, 100+remainY);
  image (Eye, 470+remainX, 100+remainY);
  image(maskE, 0, 0);
  if (dilated == true){
  fill(0);
   ellipse(remainX+197, remainY+185, 70, 70); 
      ellipse(remainX+587, remainY+185, 70, 70); 
}

if (light == true){
  fill(254, 255, 0);
  ellipse(400, -75, 300, 300);
}
  
  }
  
  noStroke();
  
  fill(0);
     if (blink == true && blinkY <= 110){
    blinkY= blinkY + 5;
    rect(50, blinkY, 700, 150);
    blinking = true;
     if(blinkY == 110){
       blink = false;
     }
    
    }
    else if(blinking == true){
      blinkY = blinkY - 5;
      rect(50, blinkY, 700, 150);
      if (blinkY == -25){
        blinking = false;
       }   
}

}





