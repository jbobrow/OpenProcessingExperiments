
PImage red;
PImage purp;
PImage pink; 
PImage blue;

float aspect;
boolean paused = false;

void setup() {
  size(800,800);
  red  = loadImage("red.png"); pink = loadImage("pink.png"); purp = loadImage("purp.png"); blue = loadImage("blue.png");

}



void draw(){
  
  //draw random purp
  if(!paused){
    aspect = random(0, 2.0);
    image(purp, random(-width,width), random(-height,height), purp.width*aspect, purp.height*aspect);
  }
}

//draw red mouse click
void mousePressed(){
    aspect = random(0, 1.0);
    image(red, mouseX, mouseY, red.width/5, red.height/5);
  }
  

void keyPressed(){
  
  //press ; to clear
  if (key == ';') {
    background(0);
  }
  
  //spacebar pause and unpause
  if(key == ' '){
    if(paused) {paused = false;} 
    else {paused = true; }
  }
  
  //press q,w,e,r,a,s,d,f,z,x,v,g,t
  if( key =='q' || key == 'w' || key == 'e' || key == 'r' || key == 'a' || key == 's' || key == 'd' || key == 'f' || key == 'z' || key == 'x' || key == 'g' || key == 'v' || key == 't' ){
    aspect = random(0, 2.5);
  image(pink, random(width), random(height), pink.width*aspect, pink.height*aspect);}


  //press m,n,b,l,k,j,h,y,u,i,o,p,c
  if( key =='m' || key == 'n' || key == 'b' || key == 'l' || key == 'k' || key == 'j' || key == 'h' || key == 'y' || key == 'u' || key == 'i' || key == 'o' || key == 'p' || key == 'c' ){
    aspect = random(0, 1.0);
  image(blue, random(width), random(height), blue.width*aspect, blue.height*aspect);}

}  





