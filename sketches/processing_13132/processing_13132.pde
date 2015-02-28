
float x, y;
float spdX, spdY;
float r;
float gravity;

void setup() {
 // frameRate(12);
  size(400, 400);
  smooth();
  background(255);

  spdX = 2.25;
  spdY = 0.0;
  r = 5.0;
  gravity = .026;
  x=200;
  y=100;
}

void draw() {
  print(py + " " + y + "\n");
  background(255);
  moveRectangle2();
  moveRectangle();


  fill(0);
  stroke(0);
  ellipse(x, y, r*2, r*2);
  x+=spdX;
  spdY += gravity+.005;
  y+=spdY;

  if (x>width-r) {
    x = width-r;
    spdX*=-1;
  } 
  else if (x < r) {
    x = r;
    spdX*=-1;
  } 
  if (y>height-r) {
    y = height-r;
   // y=0;
    spdY *= -1;
    //spdY *= damping;
    //spdX *= friction;
  } 
  else if (y<r) {
    y = r;
    spdY *=-1;
  }
  
  //rectangle 1 bounce
    //x bounce
   if(y<py+100+r && y>py+r && x<px+50) {
    spdX *=-1;
   }
   else if(y<py+100+r && y>py+r && x<px-r    ) {
    spdX *=-1;
   }
   //y bounce
   if(x>px-r && x<px+50+r && y>py+r && y<py+100){
    spdY *=-1;
    spdX *=-1;
   } else if(x>px-r && x<px+50+r && y<py+100+r && y>py+100) {
    spdY*=-1;
    spdX*=-1;
  } 
  //rectangle 2 bounce
    //x bounce
   /*if(y<py2+100+r && y>py2+r && x>px2+r) {
    spdX *=-1;
   } else if(y<py2+100+r && y>py2+r && x<px2+100+r) {
    spdX *=-1;
   } */
   //y bounce
   if(x>px2+r && x<px2+50+r && y>py2+r && y<py2+100+r){
    spdY *=-1;
   }
   else if(x>px2+r && x<px2+50+r && y<py2+100+r && y>py2+r) {
    spdY*=-1;
  }
}


