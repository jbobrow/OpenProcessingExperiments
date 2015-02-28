
float x,y;
float degrade = 0;
boolean verif = false;

void setup(){
  smooth();
  size (500, 500);
  x = random(width);
  y =mouseY;
}

void mouseDragged (){
  verif = true;

}

void draw(){
  if(verif==true){
    degrade=map(mouseY,0,height,0,255);
  }
  else{
    degrade=125;
  }

  background (degrade,0,0,00);
  for(int i=1; i<width; i=i+10){
    x = random(width);
    y =mouseY;
    if (mouseY < height/2) {
      ellipse(x, y, 50, 50);
    } 
    else if (mouseY > height/2){
      rect (x,y, 50,50);
    } 
  }
}









