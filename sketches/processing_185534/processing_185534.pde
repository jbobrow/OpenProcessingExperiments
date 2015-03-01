

float x = 0;
float y = 0;
float r = 20;
float d = 150;

int speed = 2;
int currentState = 0;
int currentSizeState = 2;


void setup(){
size(600,600);
  smooth();
  frameRate (20);

}

void draw() {
  background(0);

float x = 75;   
  
while (x <= width) {
stroke(0);
fill(255);
ellipse(x,y,r,r);
 x=x+150;

  

 if (currentState == 0){
    y = y - speed;
    if (y < 0){
      y = 0;
      currentState = 1;
      }
      
  }else if (currentState == 1){
    y = y + speed;
    if (y > height-15){
      y = height-15;
      currentState = 0;
        }
  }
  
    if (currentSizeState == 2){
    r = r + .5;
    if (r > 40){
      r = 1;
      
      }
    }
 }
}


