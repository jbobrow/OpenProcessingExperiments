
int xr = 120;
int space =30;
int yr = 240;
int wr = 30;
int wh = 100;

void setup(){
  size(640,480);
  frameRate(60);
  background(#000000);
}

void draw(){
  stroke(0);
  strokeWeight(1);
  noFill();
  fill(#FFFBDE);
rect(120, 140, 390, 200);
fill(255);
//White Keys
if(mouseX> xr && mouseX < xr + space){
fill(127);
rect(xr, yr, wr, wh);
} else{
fill(255);
rect(xr, yr, wr, wh);
}

if(mouseX> xr +space && mouseX < xr + 2*space){
fill(127);
rect(xr+space, yr, wr, wh);
} else{
fill(255);
rect(xr+space, yr, wr, wh);
}

if(mouseX> xr +2*space && mouseX < xr + 3*space){
fill(127);
rect(xr+2*space, yr, wr, wh);
} else{
fill(255);
rect(xr+2*space, yr, wr, wh);
}
if(mouseX> xr +3*space && mouseX < xr + 4*space){
fill(127);
rect(xr+3*space, yr, wr, wh);
} else{
fill(255);
rect(xr+3*space, yr, wr, wh);
}
if(mouseX> xr +4*space && mouseX < xr + 5*space){
fill(127);
rect(xr+4*space, yr, wr, wh);
} else{
fill(255);
rect(xr+4*space, yr, wr, wh);
}
if(mouseX> xr +5*space && mouseX < xr + 6*space){
fill(127);
rect(xr+5*space, yr, wr, wh);
} else{
fill(255);
rect(xr+5*space, yr, wr, wh);
}

fill(255);

 

rect(xr+4*space, yr, wr, wh); 
rect(xr+5*space, yr, wr, wh); 
rect(xr+6*space, yr, wr, wh);
rect(xr+7*space, yr, wr, wh);
rect(xr+8*space, yr, wr, wh);
rect(xr+9*space, yr, wr, wh);
rect(xr+10*space, yr, wr, wh);
rect(xr+11*space, yr, wr, wh);
rect(xr+2*space, yr, wr, wh);
noFill();
fill(#000000);
//Black Keys
rect(170, 240, 20, 60); 
rect(140, 240, 20, 60); 
rect(230, 240, 20, 60);
rect(260, 240, 20, 60); 
rect(290, 240, 20, 60); 
rect(350, 240, 20, 60); 
rect(380, 240, 20, 60);
rect(440, 240, 20, 60);
rect(470, 240, 20, 60);
rect(500, 240, 10, 60);
//Sliders
noFill();
rect(140, 150, 10, 80);
rect(160, 150, 10, 80);
rect(180, 150, 10, 80);
rect(200, 150, 10, 80);
fill(#000000);
rect(140, 170, 10, 10);
rect(160, 190, 10, 10);
rect(180, 185, 10, 10);
rect(200, 165, 10, 10);

//Dial
noFill();
ellipse(270, 190, 55, 55);
fill(#DEDCC5);
ellipse(285, 190, 15, 15);

//touch
rect(320, 210, 170, 17);
}

/////////event

 void keyPressed() {
    fill(0);

  rect(330, 240, 30, 100);
rect(300, 240, 30, 100);
rect(270, 240, 30, 100); 
rect(240, 240, 30, 100); 
rect(210, 240, 30, 100); 
rect(180, 240, 30, 100); 
rect(150, 240, 30, 100);
rect(120, 240, 30, 100);
rect(360, 240, 30, 100);
rect(390, 240, 30, 100);
rect(420, 240, 30, 100);
rect(450, 240, 30, 100);
rect(480, 240, 30, 100);
}
