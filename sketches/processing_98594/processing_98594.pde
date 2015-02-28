
/*
Cloud myCloud1 ;
Cloud myCloud2 ;
*/
int amt = 10 ;
PImage Uptown ;
PFont myFont ;

Cloud[] myClouds = new Cloud[amt] ;

void setup() {
 size(500, 500) ;
 myFont = createFont ("FrancoisOne.ttf", 21) ;
 Uptown = loadImage("Uptown.jpg") ;
//myCloud1 = new Cloud() ;
//myCloud2 = new Cloud() ;
for (int i = 0 ; i < amt; i++) {
  myClouds[i] = new Cloud() ;
}  
  
}


void draw() {
  background(Uptown) ;
  textFont(myFont) ;
  text("The answer my friend, is blowing in the wind..", 60, 425) ; 
 /* 
  myCloud1.display() ;
  myCloud1.drive() ;
  
  
  myCloud2.display() ;
  myCloud2.drive() ;
 */ 
 
 for (int i = 0 ; i < amt ; i++) {
  myClouds[i].display() ;
  myClouds[i].drive() ;
 }
  
}
class Cloud {
  

  
 //attribute
 PImage Clouds ;
 float x ;
 float y ;
 color myColor ; 
 float v ;
 float w ;
 

//constructor
Cloud() {
 Clouds = loadImage("Clouds.gif") ;
 x = random(width) ;
 y = random(height) ;
v = random(1, 2) ;
w = random(25, 80) ;
 myColor = color(random(255), random(255), random(255)) ;
}


//methods  
  void display() {
    image(Clouds, x, y, w, 30) ;
  }
  
  void drive() {
  x = x + v ;
  
   if (x > 500) {
     if(x > width) ;
     x = 0 ;
}
 } 
  }


