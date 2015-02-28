
/* @pjs font="YesevaOne-Regular.ttf"; */

int x1 = 0; 
int  y1 = 970; 

PFont Ye;

PImage house1; 
PImage house2;
PImage house3;

PImage gradient; 
PImage base; 
PImage top; 
PImage FLOWERS; 
ArrayList myClouds ;
float angle = PI*2;
float jitter; 

void setup () { 
  size (1920, 1080);
  
Ye = loadFont("YesevaOne-Regular.ttf");
base = loadImage ("base.png"); 
top = loadImage ("top.png"); 
gradient = loadImage ("gradient.png");
FLOWERS = loadImage ("FLOWERS.png"); 
house1 = loadImage ("house1.png");
house2 = loadImage ("house2.png");
house3 = loadImage ("house3.png");

 
//background (#403C3C);
      noStroke(); // or just comment out rect//
      noFill(); 
  rect (30, 0, 100, y1); 

myClouds = new ArrayList() ;

  for (int i = 0 ; i < 20; i++) {
    myClouds.add(new Cloud()) ;
  }


}

 

void draw () { 
imageMode(CORNER) ;
  image (gradient, 0, 0, width, height);
 
   for (int i = 0 ; i < myClouds.size() ; i++) {
    Cloud cloud = (Cloud) myClouds.get(i) ;
    cloud.display() ;
    cloud.drive() ;
  }

    image (base, 1650, 340, 85, 885); 
    fill(#898686); 
  
makeBars(50, 970); 
makeBars(250, 970);  
makeBars(450, 970);
makeBars(650, 970);
makeBars(850, 970); 
image (FLOWERS, 1650, 970, 126, 142);

// begin rotating the turbine

  angle = angle+.02;
 pushMatrix() ; 
  translate(1690, 320); // use location of turbine instead of 200, 300
  imageMode(CENTER, CENTER);
  rotate(angle);

  
image (top, 0,0, 737, 771);
 popMatrix() ;

// image (turbine, 1310, 0, width/2.5, height+140);
 
fill(#0F0101);
textFont(Ye, 55); 
  text("A single wind turbine", x1, height/1.27);
    text("can power 500 homes", x1, height/1.27+60);
 x1=x1+3;

if (x1>995){
  x1=995; 
}
fill (#F7FAFF); 
textFont(Ye, 28); 
text ("Each house represents 10 homes.", 1045, 1005); 

/*if (second() % 2 == 0) {  
    jitter = random(-0.1, 0.1);
  }
angle = angle + jitter;
  float c = cos(angle);
  translate(width/2, height/2);
  rotate(c);   
image (FLOWERS, 1650, 890, 120, 250); */
} 

void makeBars(int x, int y){ 
   int i = 0; 
  while (i < y){ 

   image (house1, x, i, 105, 105);  
   i = i + 107.7775;  
    image (house2, x, i, 105, 105);  
   i = i + 107.7775;  
    image (house3, x, i, 105, 105);  
   i = i + 107.7775;  
   
  }

}
class Cloud {
  
  // attributes
  float x ; 
  float y ;
  float myO ; 
  float v ;
float myWidth ;
float myHeight ;
 
  
  // constructor
  Cloud() {
    x = random(width) ;
    y = random(height/2-90) ;
   v = random(1, 5) ; 
    myO = random(80, 200) ; 
   myWidth = random(200, 500) ; 
  myHeight = random(100, 220) ;  
  }
  
  
  // methods
  void display() {
      noStroke(); 
    fill(255, myO) ; 
    ellipse (x, y, myWidth, myHeight); 
    
  }
  
  void drive() {
    x = x + v ;
    if (x > width) {
      x = 0 ;
    }
 //   y = y + v; 
  //  if (y > height){ 
   //   y = 0; 
  }
  }


