
int col = 0;
void setup (){
 size (200, 200);
 background(222, 112, 215);
 noStroke();
 colorMode(HSB);
}

void draw(){
  fill(255, 0, col); //bow
  rect (90, 130, 20, 10); //nose
  rect(70, 40, 10, 10); //left ear
  rect(40, 32, 30, 10); //left ear
  rect(30, 41, 10, 40); //left ear
  rect(40, 60, 10, 10); //left ear
  rect(20, 80, 10, 20); //left side
  rect(10, 100, 30, 10); //top left whisker
  rect(20, 110, 10, 10); //left side
  rect(10, 120, 30, 10); //bottom left whisker
  rect(20, 130, 10, 10); //left side
  rect(30, 140, 10, 20); //left side
  rect(40, 160, 20, 10); // left jaw
  rect(60, 170, 80, 10); //chin
  rect(140, 160, 20, 10); //right jaw 
  rect(160, 140, 10, 20); //right side
  rect(170, 130, 10, 10); //right side
  rect(160, 120, 30, 10); //bottom right whisker
  rect(170, 110, 10, 10); //right side
  rect(160, 100, 30, 10); //top right whisker
  rect(170, 60, 10, 50); //right side
  rect(160, 80, 10, 10); //right side
  rect(140, 90, 20, 10); //bow
  rect(120, 30, 10, 20); //bow
  rect(130, 40, 10, 10); //bow
  rect(110, 50, 10, 20); //bow
  rect(100, 50, 10, 10); //bow
  rect(120, 70, 20, 10); //bow
  rect(130, 80, 10, 10); //bow
  rect(90, 70, 20, 10); //bow
  rect(170, 50, 10, 10); //bow
  rect(60, 110, 10, 20); //left eye
  rect(130, 110, 10, 20); //right eye
  rect(150, 70, 10, 10); //bow
  rect(150, 60, 10, 20);//bow
  rect(140, 50, 10, 20); //bow
  rect(150, 40, 20, 10); //bow
  rect(160, 30, 10, 10); //bow
  rect(90, 20, 70, 10); //head
  rect(80, 30, 20, 10); //head
  rect(80, 30, 10, 40); //ear 
  fill(col, 255 , 255 ); //bow
  rect(160, 50, 10, 30); //bow
  rect(150, 50, 10, 10); //bow
  rect(140, 80, 20, 10); //bow
  rect(140, 70, 10, 10); //bow
  rect(90, 40, 10, 30); //bow
  rect(100, 60, 10, 10); //bow
  rect(100, 40, 20, 10); //bow
  rect(100, 30, 20, 10); //bow
  rect(120, 50, 20, 10); //bow
  rect(120, 60, 20, 10); //bow
}

void mousePressed(){ //mousePressed
  col+=15; //col
  col%=250; //col
  println(col); //col
}

