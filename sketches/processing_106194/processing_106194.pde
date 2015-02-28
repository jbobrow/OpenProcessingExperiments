

float x = 50;
int y = 50;
void setup(){
size(500,500);
background(255);
}

void draw(){
background(255);
fill(0);
text("X: " +  x, 20,200);
rect(x,y,50,50);
if (y >= 500){
  y = - 2;
  x = random(50,450);
  }
  else{
    y = y +10;
  }
}

 



