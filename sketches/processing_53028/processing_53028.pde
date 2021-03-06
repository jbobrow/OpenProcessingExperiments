
PImage img;       
int pixelSize = 2; 
int xPixels, yPixels;   

float zPos;
float colorVal;

float lastX=0;
float currentX;
float mouseXChange;

float lastY=0;
float currentY;
float mouseYChange;

void setup() {
  size(552, 484, P3D); 
  img  = loadImage("breakdown.png");
  loadPixels();
  xPixels = width/pixelSize;            
  yPixels = height/pixelSize;            
}

void draw() {
  background(0);
  loadPixels();
  
  lastX=currentX;
  currentX= mouseX;
  mouseXChange= abs(currentX-lastX);
  float xScale=map(mouseXChange, 0, width, 0, 50);
  
  lastY=currentY;
  currentY= mouseY;
  mouseYChange= abs(currentY-lastY);
  float yScale=map(mouseYChange, 0, height, 0, 100);


  for ( int i = 0; i < xPixels;i++) {
    for ( int j = 0; j < yPixels;j++) {
      int x = i*pixelSize+pixelSize/2; 
      int y = j*pixelSize+pixelSize/2;
      int pixelPos = x + y*width;     
 
 
      float r= red(img.pixels[pixelPos]);
      float g= green(img.pixels[pixelPos]);
      float b= blue(img.pixels[pixelPos]);     
      color c = img.pixels[pixelPos];
      colorVal=r+g+b;
      float colorScale= (r+g+b)/8;
      
      zPos=xScale-random(colorScale/2)*xScale;
      
      if(colorVal>35){
        img.pixels[pixelPos]+=random(xScale)+colorVal;
      }
      
      else{
        img.pixels[pixelPos]-=random(yScale)+colorVal;
      }
      
      
      pushMatrix();
      noStroke();
      translate(x,y,zPos);
      fill(r, g, b);
      rect(0,0,pixelSize+random(yScale),pixelSize+random(yScale));
      popMatrix();
    }
  }
}

