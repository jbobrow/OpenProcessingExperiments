



int maxImages = 18;
int imageIndex = 0;


PImage[] images = new PImage[18]; //image array

int r;
int value = 0;


void setup() {
  size(1250, 850);
 
  for (int i = 0; i < images.length; i ++)
   {
    images[i] = loadImage( i +".jpg");
   }
   for(int i=0; i  < images.length; i ++)
   {
   images[i].resize(150,200);
   }
   
background(random(255),random(255),random(255));
smooth();
}

void draw() {
  image(images[imageIndex],0,0);
  imageMode(CORNER);
  stroke(141,255,0);
  
  if (mousePressed == true); {
    strokeWeight(2);
    line(mouseX, mouseY, pmouseX, pmouseY); 
   
}
}
   
void mousePressed() {
  imageIndex = int(random(images.length));
   for(int count = 0;count<20;count ++)
    {
    rectMode(CENTER);
    rect(mouseX,mouseY,10,10);
    stroke(255, 0, 0);
    fill(255,255,0);
    r=int(random(18));
    
    
    }}
    
void keyPressed(){
  switch (key) {
    case 'r':
    background(random(255),random(255),random(255));
    
  
}
}





