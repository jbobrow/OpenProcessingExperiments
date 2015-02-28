
float rswitch;
float colrandom;

void setup() {
  
  rswitch= int(random(10));
  colrandom = int(random(5));
  println(colrandom);
  
  size(350,350);
  
  background(255);
  
}

void draw(){

randomColor();  
randomDrawing();

}

void randomDrawing() {
  
if (rswitch == 0) {
wingLines();
cornerLines();
xLines();
xytiltLines();
horizonLines();
verticalLines();
drawLine(); 
}

if (rswitch == 1) {
wingLines();
drawLine(); 
}

if (rswitch == 2){
xLines();
xytiltLines();
horizonLines();
verticalLines(); 
}

if (rswitch == 3){
xLines();
xytiltLines(); 
}

if (rswitch == 4){
wingLines();
cornerLines(); 
}

if (rswitch == 5){
horizonLines();
verticalLines(); 
}

if (rswitch == 6){
wingLines();
horizonLines();
verticalLines(); 
}

if (rswitch == 7){
horizonLines();
verticalLines();
drawLine(); 
}

if (rswitch == 8){
wingLines();
cornerLines();
drawLine(); 
}

if (rswitch == 9){
drawLine();
}  
}

void randomColor() {

if (colrandom == 0){
stroke(76,random(220,255),50);
}
if (colrandom == 1){
stroke(95,random(230),random(120,255));
}
if (colrandom == 2){
stroke(255,random(150,255),40);
}
if (colrandom == 3){
stroke(random(25),217,random(255));
}
if (colrandom == 4){
stroke(int(random(255)),100,100);
}

}

void mouseDragged(){
rotateSquare();
}

void wingLines() {

line(mouseX,mouseY,width,mouseX);
line(mouseX,mouseY,0,mouseX);

}

void xytiltLines(){

line(0, mouseY, width, mouseX);
line(mouseY, 0, mouseX, width);

}

void cornerLines(){

line(mouseX,0,height,mouseX);
line(0,mouseY,mouseY,height);
//line(mouseX,height++,mouseY,width++);

}

void xLines(){

line(0,width,mouseX,mouseY);
line(0,0,mouseX,mouseY);
line(height,0,mouseX,mouseY);
line(width,height,mouseX,mouseY);

}

void horizonLines(){
  
stroke(255);
line(0,mouseY,width,mouseY);

}

void verticalLines(){

stroke(255);
line(mouseX, 0, mouseX, width);

}

void drawLine(){

stroke(29,89,255);
line(mouseX,mouseY,pmouseX,pmouseY);

}

void rotateSquare() {

stroke(int(random(20,255)),50,100);
pushMatrix();
rectMode(CENTER);
translate(mouseX,mouseY);
rotate(millis() * 0.001 * TWO_PI); //Frame Rate
rect(0,0,35,35);
popMatrix();

}

void mouseClicked(){

if (mouseButton == LEFT){
loop();
setup();
}

if (mouseButton == RIGHT) {
noLoop();
//save(1);
}

}
