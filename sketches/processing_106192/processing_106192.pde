
int x = 0;
int y = 0;
void setup(){
size(500,500);
}

void draw(){
smooth();
background(0);
fill(255);
ellipse(x,y,50,50);
textSize(30);
fill(60,175,16);
text("X: " + x, 220,90);     //indicator of x
text("Y: " + y, 220,130);    //indicator of y
//I use conditional rules to control the behaviour of the cube. It goes eastward until it reaches x == 250 or greater, then it goes downwards until it reaches y == 450 or greater. Then a display message appears.
if (x >= 250){
  if(y >= 450){
    textSize(30);
    fill(60,175,16);
    text("Done", 220,50);
  }
  else{
    y = y+ 3;
  }
}
else{
  x = x + 3;
}
}


