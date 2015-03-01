
void setup(){
  size(400,400);
  noStroke();
  smooth();
  frameRate(100);
  backGround();
}

void draw(){
}

void backGround(){
  fill(255,250,205);
  rect(0,0,400,200);
  fill(176,226,255);
  rect(0,200,400,200);
}


void mouseDragged(){
  if((mouseX>200)&&(mouseY<200)){
    for(int x=0;x<410;x=x+10){
      for(int y=200;y<410;y=y+10){
        float a=random(255);
        fill(0,a,255);
         ellipse(y,x,20,20);
      }
    }
  }
}


void mouseMoved(){
  if((mouseX<400)&&(mouseY<200)){
    fill(0);
    ellipse(mouseX,100,100,100);
    backGround();
  }
}
  
