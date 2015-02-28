
//declaretion of all variables
int a=0;
int a1=0;
int a2=0;
int a3=0;

float x=300;
float h= 200;
float x2 = 0;
float x3 = 150; 
float x4 = 450;
float y = random(0,500);
float y2 = random(0,500);
float y3 = random(0,500);
float y4 = random(0,500);

void setup() {
    size(500, 500);
  background(100);
  smooth();
  noStroke();
}

void draw() {

//position of the circles change everytime  
  x = x - random(7,10);
  x2 = x2 - random(4,12);
  x3 = x3 - random(2,13);
  x4 = x4 - random(5,9);
  
  fill(10, 150);
  rect(0, 0, width, height);

//4 ellipses. They can change color
  fill(a,170,170);
  ellipse(x, y, 20, 20);
  fill(a1,170,170);
  ellipse(x2,y2,20,20);
  fill(a2,170,170);
  ellipse(x3, y3, 20,20);
  fill(a3,170,170);
  ellipse(x4,y4, 20, 20);

// ellipses move from right to left, continuously regenerating themselves
  if (x <= -20) {
    x = 500;
    y = random(0,255);
  }  
  if (x2 <= -20) {
    x2 = 500;
    y2 = random(100,355);
  }  
  if (x3 <= -20) {
    x3 = 500;
    y3 = random(150,455);
  }  
   if (x4 <= -20) {
    x4 = 500;
    y4 = random(400,500);
  }

//can control the white circle whith the keyboard
  fill(255);
  ellipse(200, h, 40, 40);
  if (keyPressed && keyCode == DOWN) {
       h = h+12;}   
  if (keyPressed && keyCode == UP) {
       h = h-12;}
       
//when the control crash an ellipse, it change the color       
  if(dist(200,h, x, y)<=40) {
   a = a +255;}
     if(dist(200,h, x2, y2)<=40) {
   a1 = a+255;
   if(x2<=0){
       a1=0;}}
     if(dist(200,h, x3, y3)<=40) {
   a2 = a+255;
   if(x3<=0){
       a2=0;}}
     if(dist(200,h, x4, y4)<=40) {
   a3 = a+255;}
   
//if all the ellipses are red they become grey again   
   if(a>=200 && a1>=200 && a2>=200 && a3>=200){
     a=0;
     a1=0;
     a2=0;
     a3=0;}
  }

