
//Images
PImage num1;
PImage num2;
PImage num3;
PImage num4;
PImage num5;
PImage num6;
PImage num7;
PImage num8;
PImage num9;
PImage num10;
PImage girl;
PImage startscreen;
PImage background;

//For knowing if the start button has been clicked
boolean stage;

//For the girl
float girlx;

//Position of falling numbers
int dx = 1;
int dy = 3;

//Sets the speeds of the the numbers
float x1 = 5;
float y1 = -20;
 
float x2 = 5;
float y2 = -400;
 
float x3 = 5;
float y3 = -650;
 
float x4 = 5;
float y4 = -900;

float x5 = 5;
float y5 = -1150;

float x6 = 5;
float y6 = -1400;
 
float x7 = 5;
float y7 = -1650;
 
float x8 = 5;
float y8 = -1900;
 
float x9 = 5;
float y9 = -2150;

float x10 = 5;
float y10 = -2400;


void setup(){
  
  size(800,600);
  background(255);
  frameRate(30);
  
  //Loads images from the file
  num1 = loadImage("1.png");
  num2 = loadImage("2.png");
  num3 = loadImage("3.png");
  num4 = loadImage("4.png");
  num5 = loadImage("5.png");
  num6 = loadImage("6.png");
  num7 = loadImage("7.png");
  num8 = loadImage("8.png");
  num9 = loadImage("9.png");
  num10 = loadImage("10.png");
  girl = loadImage("girl.png");
  startscreen = loadImage("startscreen.jpg");
  background = loadImage("background.png");
 
  
  //Randomly sets the x value
  x1 = random(30, 800);
  x2 = random(30,800);
  x3 = random(30,800);
  x4 = random(30,900);
  x5 = random(30,900);
  x6 = random(30,900);
  x7 = random(30,900);
  x8 = random(30,900);
  x9 = random(30,900);
  x10 = random(30,900);
  

}

void draw() {
    
  //Starting Image
    image(startscreen,0,0);
    
    
      //Starts game when "click to start" is pressed
      if (mousePressed == true && mouseX > 13 && mouseX <293 && mouseY>255 && mouseY < 310){
        stage = true; }
       
      if (stage == true){
        
    //Makes sure there's no trail behind falling numbers
    image(background,0,0);
  
    //Sets y position of numbers
     y1 = y1 + dy;
     y2 = y2 + dy;
     y3 = y3 + dy;
     y4 = y4 + dy;  
     y5 = y5 + dy; 
     y6 = y6 + dy;
     y7 = y7 + dy;
     y8 = y8 + dy;
     y9 = y9 + dy;
     y10 = y10 + dy;
     
     //Gets numbers and co-ordinates 
     image(num1, x1, y1);
     image(num2,x2,y2);
     image(num3,x3,y3);
     image(num4,x4,y4);
     image(num5,x5,y5);
     image(num6,x6,y6);
     image(num7,x7,y7);
     image(num8,x8,y8);
     image(num9,x9,y9);
     image(num10,x10,y10);
     
     //Makes the numbers fall down the screen
     if( y1 > height) {
       y1=-20; x1=random(50,900);}
     if(y2 > height) {
         y2=-20; x2=random(50,900);}
      if( y3 > height) {
         y3=-20; x3=random(50,900);}
      if( y4 > height) {
         y4=-20; x4=random(50,900);}
      if( y5 > height) {
         y5=-20; x5=random(50,900);}    
     if( y6 > height) {
       y6=-20; x6=random(50,900);}
     if(y7 > height) {
         y7=-20; x7=random(50,900);}
      if( y8 > height) {
         y8=-20; x8=random(50,900);}
      if( y9 > height) {
         y9=-20; x9=random(50,900);}
      if( y10 > height) {
         y10=-20; x10=random(50,900);}     
        
    
   //Moves the girl left and right depending on the mouse movement
    girlx = mouseX;
    image(girl,girlx,410);
    
    
    
    
        
      }
      
      

}
  
  
  
  


