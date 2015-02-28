
PImage img;

int xPos=22;
int yPos=96;
int dirX=5;
int dirY=2;
int rad=20;


void setup () {
  
  noCursor();
  size (400,300);
  img = loadImage ("Traumwelt.jpg");

  smooth();
}


void draw(){
  
  image(img,0,0);
  
  if (mousePressed){
  
  fill(255,50);
  ellipse(mouseX,mouseY,300,200);
  
}else{
  
  
    for(int i=0; i < img.height; i =i +3){
      
        color c= img.get(mouseX, i);
        
        stroke(c);
        
  line(0,i,mouseX,i);
  



  noStroke();
  fill(255);
  ellipse(xPos,yPos,rad,rad);
  
  if (xPos > width || xPos < 0){
  
  dirX =dirX *-1;
}

xPos=xPos +dirX;

if(yPos> height || yPos<0){
  dirY= dirY * -1;
  }
  
  yPos=yPos +dirY;
  
  
}
}
}


