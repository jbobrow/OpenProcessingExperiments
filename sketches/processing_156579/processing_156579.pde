
PFont font;
float circle1X; //x-position of center of circle1
float circle1Y; //y-position of center of circle1
float circle2X;//x-position of center of circle2
float circle2Y;  //y-position of center of circle2
float circle3X; //x-position of center of circle3
float circle3Y; //y-position of center of circle3
float circle4X;//x-position of center of circle4
float circle4Y;  //y-position of center of circle4
float circle5X; //x-position of center of circle5
float circle5Y; //y-position of center of circle5
float circle6X;//x-position of center of circle6
float circle6Y;  //y-position of center of circle6


float diameter; //diameter of circle
boolean state1=true;
boolean v1; //state change value for circle1
boolean v2; //state change value for circle2
boolean blue; 
boolean red;
boolean green;
boolean yellow;

void setup(){
  
  size(800, 500);
  diameter=75;
  font = loadFont("Serif-23.vlw");
  circle1X = width/4;
  circle1Y = 2*height/5;
  circle2X = 3*width/4;
  circle2Y = 2*height/5;
  circle3X = width/8;
  circle3Y = 3*height/5;
  circle4X = 3*width/8;
  circle4Y = 3*height/5;
  circle5X = 5*width/8;
  circle5Y = 3*height/5;
  circle6X = 7*width/8;
  circle6Y = 3*height/5;
  
}

void draw(){
  background(255);
  
  if( v1 == true ){ 
  fill(0);
  textAlign(CENTER);
  textFont(font);
  text ("WHICH COLOR DO YOU LIKE?", circle1X, circle2Y+30);
  text ("BLUE", circle3X, circle3Y);
  text ("RED", circle4X, circle4Y);
  }
 
  else if (v2==true){
  fill(0);
  textAlign(CENTER);
  textFont(font);
  text("WHICH COLOR DO YOU LIKE?", circle2X, circle1Y+30);
  text("GREEN", circle5X, circle5Y);
  text("YELLOW", circle6X, circle6Y);
  }
  
    if (blue == true) {
    background(0,0,255);
}

    if(red == true) {
      background(255,0,0);
    }
    
    if(green == true){
      background(0,255,0);
    }
    
    if(yellow == true){
      background(255,255,0);
    }
  

  if (state1==true){
  fill(0);
  textAlign(CENTER);
  textFont(font);
  text ("LEFT", 200, 200);
 
   fill(0);
  textAlign(CENTER);
  textFont(font);
  text ("RIGHT", 600, 200);
  
  fill(0);
  textAlign(CENTER);
  textFont(font);
  text ("PICK A SIDE:", width/2, 50);
  
  }
  
}

void mousePressed(){
  if(dist(mouseX, mouseY, circle1X, circle1Y)<diameter/2){
    v1=!v1;
  }
  if(dist(mouseX, mouseY, circle2X, circle2Y)<diameter/2){
    v2=!v2;
  }
  
  if(dist(mouseX, mouseY, circle3X, circle3Y)<diameter/2 && v1==true){
  blue=!blue;
  }
  
  if(dist(mouseX, mouseY, circle4X, circle4Y)<diameter/2 && v1==true){
  red=!red;
  }
  
  if(dist(mouseX, mouseY, circle5X, circle5Y)<diameter/2 && v2==true){
  green=!green;
  }
  
  if(dist(mouseX, mouseY, circle6X, circle6Y)<diameter/2 && v2==true){
  yellow=!yellow;
  }
  
  


}



