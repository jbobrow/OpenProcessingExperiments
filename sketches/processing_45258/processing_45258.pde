
PImage img;       
int cellsize = 5; 
int cols, rows;   
int posX, posY;
void setup() {
 
  img = loadImage( "heart.jpg" ); 
  cols = img.width/cellsize;             
  rows = img.height/cellsize;    
  
  size(500,500, P3D);  
}

void draw() {
  background(0);
  img.loadPixels();
 posX=int(random(10,20));
      posY=int(random(10,20));
     
  for(int i=img.pixels.length-1;i>500;i--){
img.pixels[i]=img.pixels[i-500];
}
  for (int i = 0; i < cols; i++ ) {
   
    for (int j = 0; j < rows; j++ ) {
      int x = i*cellsize + cellsize/10; 
      int y = j*cellsize + cellsize/10; 
      int loc = x + y*width;           
      color c = img.pixels[loc];      

     
      float z = (mouseX/(float)width) * brightness(img.pixels[loc])- 100.0;


      pushMatrix();
      translate(x,y,z); 
      fill(c);
      stroke(c);
      ellipseMode(CENTER);
      ellipse(posX,posY,cellsize,cellsize);
      ellipse(0, 0, posY, posX);
      ellipse(0,0, cellsize, cellsize);
      popMatrix();

    }
  }
  //saveFrame();
}

