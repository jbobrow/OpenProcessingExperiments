
int y;
int ySpeed; 
int acc;
int x;

void setup() {
  size(300, 300);

  y=100;
  ySpeed=10; //camelCasing
}

void draw() {
  background(255);

//side walls
  if (mouseX < (width-50) && mouseX > 50) {
    x=mouseX;
  }
  
  y-=ySpeed;
  fill(255, 0, 0);
  ellipse(x, y, 100, 100);

//impact with ground

  if (y >= (height-50)) {
    ySpeed*=-1;
  }

  //impact top edge

  if (y <= 50) {
    ySpeed*=-1;
  }
}

//if (hungry==true && haveGoneShopping==true){
//make sandwich (3);
//}
/*
|| means or
*/



