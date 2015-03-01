
int r1=0,g1=0,b1=0;
boolean redOn=false, 
        greenOn=false,
        blueOn=false;

void setup() {  //setup function called initially, only once
  size(500,500);
  background(0);
  }
 
void draw() {
background(r1,g1,b1);
strokeWeight(12);
stroke(150);
fill(255,0,0);
rect(50,200,100,100);
fill(0,255,0);
rect(200,200,100,100);
fill(0,0,255);
rect(350,200,100,100)
strokeWeight(2);
stroke(0);
noFill();
if (redOn) {
rect(50,200,100,100);
r1=255;}
else {
r1=0;
}
if (greenOn) {
rect(200,200,100,100);
g1=255;}
else {
g1=0;
}
if (blueOn) {
rect(350,200,100,100);
b1=255; }
else {
b1=0;
}
}

void mousePressed()  {
if (mouseY >206 && mouseY <300) {
if (mouseX > 56 && mouseX < 144) {
if (redOn) {
redOn=false;
} else {
redOn=true;
}
}
if (mouseX>206 && mouseX <294) {
if (greenOn) {
greenOn=false;
} else {
greenOn=true;
}
}
if (mouseX>356 && mouseX<444) {
if (blueOn) {
blueOn=false;
} else {
blueOn = true;
}
}
}
}
