
void setup(){
  size(600, 600);
  background(255);
}
 
  
 
 //This is the function to draw a shape that will repeat in the background
 //variables x and y are setting the point in which we start drawing the shape
void ourShape(float x, float y){
 
  //those are the dimensions of our shape
  float a, b, c, h;
  a=9; b=12; c=15; h=12;
 
  fill(225);    //we fill the shape with colours from grey scale
  noStroke();
  quad(x, y, x+b, y-a, x+(2*b), y, x+b, y+a);
 
  fill(125);
  noStroke();
  quad(x, y, x, y+h, x+b, y+a+h, x+b, y+a);
 
  fill(25);
  noStroke();
  quad(x+b, y+a, x+b, y+a+h, x+(2*b), y+h, x+(2*b), y);
 
}
 
  
 
 //This function repeats our shape horizontally and vertically to fill in the window
void drawBackground(){
 
  background(152,37,37);    //red background will form a frame
  
   int shapeHeight=21;
   int shapeWidth=24;  
 
   //this loop draws first, and then every other row of shapes
  for (int i=0; i<588; i=i+shapeWidth){
    for (int j=9; j<588; j=j+(2*shapeHeight)){
      ourShape(i,j);
    }
  }
 
 //this loop draws second and then every other row of shapes
  for (int i=12; i<588; i=i+shapeWidth){
    for (int j=(shapeHeight+9); j<588; j=j+(2*shapeHeight)){
      ourShape(i,j);
    }
  }
 
}
 
 
//This is the function to select values for RGB model colours based on which value was used previously
float pickValue(float value){
 
   if (value>200 && value<=255){
     value = 10;
     return value;
   }
   else if (value>99 && value<=200){
     value = value + 55;
     return value;
   } 
   else if (value<55){
     value = value+200;
     return value;
   }
   else{
     return value;
   }
} 
 
void addCircles(){
   
  //We will draw circles in three different sizes
  int small, medium, large;
    small = 100;
    medium = 150;
    large = 200;
   
  //We fix colour for first two small circles
    float valueR, valueG, valueB;
    valueR = 54;
    valueG = 103;
    valueB =198;  
//We draw the small circles   
   fill(valueR, valueG, valueB, 100);
   ellipse(100,300,small,small);  
 
   fill(valueR, valueG, valueB, 100);
   ellipse(500,300,small,small);
 
//Then we use our picking funtion to set colour for next circles and draw them
   float valueR2, valueG2, valueB2;
      valueR2 = pickValue(valueR);
      valueG2 = pickValue(valueG);
      valueB2 = pickValue(valueB);  
 
   fill(valueR2, valueG2, valueB2, 100);
   ellipse(200,300,medium,medium);
    
   fill(valueR2, valueG2, valueB2, 100);
   ellipse(400,300,medium,medium);
 
//We repeat same procedure for the centaral circle  
   float valueR3, valueG3, valueB3;
      valueR3 = pickValue(valueR2);
      valueG3 = pickValue(valueG2);
      valueB3 = pickValue(valueB2);  
 
   fill(valueR3, valueG3, valueB3, 100);
   ellipse(300,300,large,large);
   
}
  
 
void draw(){
  //First we draw our background and then draw all of the circles
    drawBackground();
    addCircles(); 
 
//Finally, we add a very nice text showing who made this wonderful image :)
 
    PFont font;
    font = loadFont("Andalus-48.vlw");
        /*
    The changed font was not be visible on openprocessing.org, since changing fonts requires uploading a file to 'data' calogue of the sketch. */
    textFont(font, 60);
    fill(255);
    textAlign(CENTER);
    text ("Group 10",300,300);
