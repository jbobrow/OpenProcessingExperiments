
int stepX;
int stepY;

PImage img;


void setup(){
  size(400,450);
  background(255);
 img= loadImage("picture.jpg");
}

void draw(){
  colorMode(RGB);
    background(255);
 image(img,40,30);
  image(img,60,30);
 tint(0, random(255), 204, 80); 
    image(img,80,50,width/3,height/2);
    image(img,180,130,width/6,height/19);
    image(img,100,230,width/2,height/20);
  noStroke();

  
  if( mouseX>40 && mouseX<360 && mouseY>30 && mouseY<330){
  
  stepX=mouseX/10-3;
  stepY=mouseY/10-2;
  for( int gridX=40; gridX<360 ;gridX+=stepX){
  for( int gridY=30; gridY<330;gridY+=stepY){
   ellipseMode(CORNER);
    colorMode(HSB,320,300,100);
   fill(gridX,gridY,random(255),random(255));
  ellipse(gridX,gridY,stepX,stepY);
    ellipse(height-gridX,gridY,stepX,stepY);
 
}}

}
 fill(320);
rect(360,0,40,height);
rect(0,330,360,height);
rect(0,0,height,40);
rect(0,0,40,height);
if(mousePressed){
  background(0);
  fill(random(255),255,random(255));
 
ellipse(mouseX-10,mouseY-10,30,30);
ellipse(width-mouseX+10,height-mouseY+10,30,30);
ellipse(width-mouseX+10,mouseY-10,30,30);
ellipse(mouseX-10,height-mouseY+10,30,30);
  }
}



