
//Left mouse key is simetric, slow progress -> order
//while right ket represents CHAOS! 
//I think here should be stated: WARNING for people with EPILEPSY


void setup() {
  size(1200,720);
  background(0);
}
int x = width/2;
int y = height/2;
int howMany = 0;
int start = 0;
int mX = 0;
int mY = 0;

void draw () {
 mX = mouseX;
 mY = mouseY;
  if (mousePressed) {
    if (mouseButton == LEFT) {
    howMany ++;
    start++;
    colorMode(HSB, 360, 360, 360);
    stroke(mX^(1/2),mY^(1/2),random(0,(mY+mX)^(1/2)));
    strokeWeight (1); 
      for (int i=1; i<howMany+1; i++){
        line(start+(5*(howMany-1)),(height/2)+(howMany-1)*5,start+(5*(howMany)),(height/2)+(howMany)*5);
        line(start+(5*(howMany-1)),(height/2)-(howMany-1)*5,start+(5*(howMany)),(height/2)+(howMany)*5);
        line(start+(5*(howMany-1)),(height/2)-(howMany-1)*5,start+(5*(howMany)),(height/2)-(howMany)*5);
  }
    }
  else if (mouseButton == RIGHT) {
    float howMany=random(0,100);
    float start=random(0,width/8);
      if (mousePressed == true){
        background(random(0,50));
        colorMode(HSB, 360, 360, 360);
        stroke(mX^(1/2),mY^(1/2),random(0,(mY+mX)^(1/2)));
        strokeWeight (1); 
          for (int i=1; i<howMany+1; i++){
            strokeWeight(1);
            line(start+(5*(random(0,(mY+mX)^(1/2))-1)),(height/2)+(random(0,(mY+mX)^(1/2))-1)*5,start+(5*(random(0,(mY+mX)^(1/2)))),(height/2)+(random(0,(mY+mX)^(1/2)))*5);
            line(start+(5*(random(0,(mY+mX)^(1/2))-1)),(height/2)-(random(0,(mY+mX)^(1/2))-1)*5,start+(5*(random(0,(mY+mX)^(1/2)))),(height/2)+(random(0,(mY+mX)^(1/2)))*5);
            line(start+(5*(random(0,(mY+mX)^(1/2))-1)),(height/2)-(random(0,(mY+mX)^(1/2))-1)*5,start+(5*(random(0,(mY+mX)^(1/2)))),(height/2)-(random(0,(mY+mX)^(1/2)))*5);
  }
  }
  }
}
}
void mouseReleased() {
  howMany = 0;
  start = 0;
}
void keyPressed(){
  if (key== 's' || key=='S') saveFrame("Screenshot.png");
  if (key == DELETE || key == BACKSPACE) background(0,0,0);
 
}


