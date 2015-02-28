
/* @pjs font="YesevaOne-Regular.ttf"; */

int x1 = 0;
int  y1 = 970; 

PFont myFont;
PImage background; 
PImage house1; 
PImage house2;
PImage house3;

void setup () { 
  size (1920, 1080);
  
myFont = loadFont("YesevaOne-Regular.ttf");

house1 = loadImage ("house1.png");
house2 = loadImage ("house2.png");
house3 = loadImage ("house3.png");
background = loadImage ("background2.png");


//background (#403C3C);
      noStroke(); // or just comment out rect//
      noFill(); 
  rect (30, 0, 100, y1); 

}

 

void draw () { 
  image (background, 0, 0, width+130, height+130);  
  
makeBars(50, 970); 
makeBars(250, 970);  
makeBars(450, 970);
makeBars(650, 970);
makeBars(850, 970); 
  
fill(#000000);
textFont(myFont, 55);
  text("A single wind turbine", x1, height/1.27);
  text("can power 500 homes", x1, height/1.27+60);
 x1=x1+3;
 
 if (x1>1275) {
   x1=1275;
 }


} 

void makeBars(int x, int y){ 
   int i = 0; 
  while (i < y){ 

   image (house1, x, i, 100, 100);  
   i = i + 107;  
    image (house2, x, i, 100, 100);  
   i = i + 107;  
    image (house3, x, i, 100, 100);  
   i = i + 107;  
   
  }

}


