
int posY;
boolean goingUp;


void setup() {
  size(500, 500);
  posY=height/2;
  goingUp =false;
}

void draw() {
  background(posY,posY/2,posY*2);
  fill(255);
  ellipse(width/2, posY, 50, 50);
  if (goingUp==false) {
    posY+=5;
    if(posY>500){
     goingUp=true;
    }
  }
  else{
  posY-=5;
  if(posY<0){
  goingUp=false;
   }
  }
}


