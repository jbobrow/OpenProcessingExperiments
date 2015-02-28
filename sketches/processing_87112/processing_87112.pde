
// click to randomize
float x, y, squareSize;
color bgColor, strokeColor, fillColor;
float strokeWt;
void setup(){
size(920, 580);
rectMode(CENTER);
x = width/2;
y = height/2;

setRandomStyle();
frameRate(1);
//noLoop();
}
void draw(){
background(bgColor);
strokeWeight(strokeWt);
stroke(strokeColor);
fill(fillColor);
float x1=random(x);
float y1=random(y);
rect(x, y, squareSize, squareSize);
rect(random(x1), random(y1), squareSize, squareSize);
line(x*squareSize, y+squareSize, squareSize, squareSize);
line(random(x1)*squareSize, random(y1)+squareSize, squareSize, squareSize);
ellipse(squareSize,squareSize,x,y);
ellipse(squareSize,squareSize,random(x1),random(y1));
triangle(x, y, squareSize, squareSize/x, squareSize/y, x-y);
triangle(random(x1), random(y1), squareSize, squareSize/x, squareSize/y, x-y);
if (mousePressed){
setRandomStyle();

//noLoop();
}

}
void setRandomStyle(){
bgColor = color(random(255), random(255), random(255),random(50,255));
strokeColor = color(random(255), random(255), random(255),random(200,255));
fillColor = color(random(255), random(255), random(255),random(50,255));
strokeWt = random(5, 15);
squareSize = random(0, 1080);
float x1=random(x);
}
