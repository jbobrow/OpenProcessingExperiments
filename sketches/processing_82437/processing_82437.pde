
import processing.video.*;
Movie myMovie;
int x;
int directionx;
int directiony;
int y;
float y1, y2;
PFont font;
int c,d;
float screencolor;
PImage p;
PImage v;


void setup(){
  size(700,600);
  x=width/2;
  y=height/2;
  directionx = 2;
  directiony = 2;
  y1 = height/2;
  imageMode(CENTER);
  font = loadFont ("Futura-Medium-35.vlw");
  c = 0;
  d= 0;
  p = loadImage ("penis.jpg");
  v = loadImage ("vagina.jpg");
  myMovie = new Movie(this, "Don't have sex!.mp4");
 myMovie.loop();
}

void draw(){
  screencolor = color(0,0,0);
  background(screencolor);
  textFont(font);
  y2 = mouseY;
    fill(#219AFA);
  image(p,670,y2);
    fill(#DF69F7);
  image(v,30,y1);
  fill(255);
  text("CHICKS V. DICKS", 200,100);
  text (c,250,150);
  text (d,425,150);
     
  
   fill(255);
  ellipse(x,y,40,20);
  fill(255);
  x += directionx;
  y += directiony;
  
  if(x > 700){
    c = c+1;
    x=width/2;
    y=height/2;
  }
  
  if(x < 0){
    d = d+1;
    x=width/2;
    y=height/2;
  }
 
 if((dist(x,y,690,y2)< 50)){
   directionx = -directionx;
 }

 if ((dist(x,y,15,y1) < 50)){
   directionx = -directionx;
 }
    
   
  if((keyPressed == true) && (keyCode == DOWN) && (y1<=595)){
    y1 += 10;
  }
  
  if((keyPressed == true) && (keyCode == UP) && (y1>=2)){
    y1 += -10;
  }
  
  
    
  if(y > 600){
    directiony = -directiony;
  }
    
 if(y < 0){
    directiony = -directiony;
 }
 
  if(c >= 10){
    
    directionx=0;
    directiony=0;
   background(random(255),sin(220),90);
    for (int i=0; i<700; i++){
    text("♀",random(i)*sin(3)*random(i*2),random(i));
    }
    image(myMovie,mouseX,mouseY);
  }
  
  if(d >= 10){
   
    directionx=0;
    directiony=0;
    background(cos(80),random(255),20);
    for(int i=0; i<700; i++){
    text("♂",random(i),random(i));
  }
  image(myMovie, mouseX, mouseY);
  }
  
  //if((keyPressed == true) && (key == 'n')){
   // y2 += 2;
 // }
  
  //if((keyPressed == true) && (key == 'i')){
   // y2 += -2;
 // }
  
 // if(y1 > 597){
  //  y1 += -2;
 // }
}
  void movieEvent (Movie m) {
    m.read();
  }
  
  
  
   void keyPressed(){
  if((keyPressed == true) && (keyCode == DOWN) && (y1<=595)){
    y1 += 10;
  }
  
  if((keyPressed == true) && (keyCode == UP) && (y1>=2)){
    y1 += -10;
  }
  }
 
  
  
  


