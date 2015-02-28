
int x;
int directionx;
int directiony;
int y;
float y1, y2;
PFont font;
int c,d;
float screencolor;

void setup(){
  size(700,600);
  x=width/2;
  y=height/2;
  directionx = 2;
  directiony = 2;
  y1 = height/2;
  rectMode(CENTER);
  font = loadFont ("Futura-Medium-35.vlw");
  c = 0;
  d= 0;
  
}

void draw(){
  screencolor = color(0,0,0);
  background(screencolor);
  textFont(font);
  y2 = mouseY;
    fill(#219AFA);
  rect(690,y2,10,50);
    fill(#DF69F7);
  rect(10,y1,10,50);
  fill(255);
  text("CHICKS V. DICKS", 200,100);
  text (c,250,150);
  text (d,425,150);
     
  
   fill(255);
  ellipse(x,y,40,40);
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
 
 if((dist(x,y,690,y2)< 20)){
   directionx = -directionx;
 }

 if ((dist(x,y,15,y1) < 20)){
   directionx = -directionx;
 }
    
    
  if(y > 600){
    directiony = -directiony;
  }
    
 if(y < 0){
    directiony = -directiony;
 }
  
  if((keyPressed == true) && (keyCode == DOWN) && (y1<=595)){
    y1 += 10;
  }
  
  if((keyPressed == true) && (keyCode == UP) && (y1>=2)){
    y1 += -10;
  }
  
 
  if(c >= 10){
    
    directionx=0;
    directiony=0;
    background(random(255),random(255),random(255));
    text("♀",350,300);
    
  }
  
  if(d >= 10){
   
    directionx=0;
    directiony=0;
    background(random(255),random(255),random(255));
    text("♂",350,300);
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

