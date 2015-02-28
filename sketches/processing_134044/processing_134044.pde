
float rectWidth = 10;
float rectHeight = 10;
float rectY = 350;
float rectX = 350;
float speed = -3;
boolean respawn = true;


// state 1 is ...building upwards
// state 2 is ...building sideways
// state 3 is ...while going sideways, pick same color
int state = 1;
void setup()
{
size(900, 700);
smooth();
// ground
fill(0);
rect(0, 500, width, 200);
rectMode(CENTER);
colorMode(HSB,255);
fill(#C5B2FF);
stroke(0);
}
void draw() {
//background(255);
if (state == 1) {
 // building upwards
if (respawn == true) {
 rectY = 500; 
 rectX = random(width);
 respawn = false;
 float hue = random(0,255);
fill( color( hue, 40, 255) );
    }
rect(rectX, rectY, rectWidth, rectHeight); 
    rectY+=speed;
if (random(1000) < 30) {
 respawn = true;
    }
if (random(1000) > 998) {
    state = 2;
}
}
if (state == 2) {
// building to the side
float x = random(width);
float y = random(0, 350);
color c = get(int(x),int(y));
if (c == color(0)) {
rectX = x;
rectY = y;
state = 3;
}
}
if (state == 3) {
rect(rectX, rectY, rectWidth, rectHeight); 
rectX+=speed;

if (random(100) < 1) {
state = 2;
}
if (random(100) > 99) {
state = 1;
respawn = true;

}
}
}
void mousePressed() {
rectWidth = rectWidth * 2;
rectHeight = rectHeight * 2;
}
void mouseClicked() {
rectWidth = rectWidth/2;
rectHeight = rectHeight/2;
}
void mouseMoved() {
  rectWidth = rectWidth + 2;
  if (rectWidth > 10){
    rectWidth = 0;
}
}



