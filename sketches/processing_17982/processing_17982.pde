
float posx=0;
float posy=0;
float sizex=50;
float b=200;

void setup() {
  size(250,250);
  background(0);
}

void draw() {
if (keyPressed){
  if (key=='b'||key=='B'){
  fill(0,0,b);
  rect(posx,posy,sizex,sizex);
  posx+=sizex;
  b++;
  if (posx>250) {
    posx=0;
    posy+=sizex;
  }

  if (posy>250) {
    posy=0;
    posx=0;
  }
  if (b>250) {
    b=200;
  } 
  }
}
if (keyPressed){
  if (key=='g'||key=='G'){
  fill(0,b,0);
  rect(posx,posy,sizex,sizex);
  posx+=sizex;
  b++;
  if (posx>250) {
    posx=0;
    posy+=sizex;
  }

  if (posy>250) {
    posy=0;
    posx=0;
  }
  if (b>250) {
    b=200;
  } 
  }
}
if (keyPressed){
  if (key=='r' ||key=='R'){
  fill(b,0,0);
  rect(posx,posy,sizex,sizex);
  posx+=sizex;
  b++;
  if (posx>250) {
    posx=0;
    posy+=sizex;
  }

  if (posy>250) {
    posy=0;
    posx=0;
  }
  if (b>250) {
    b=200;
  } 
  }
}
}


