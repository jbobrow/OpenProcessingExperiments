
PImage img;       
int cellsize = 5; 
int cols, rows;   
int posX, posY;
float x = random(10, 10) ;
float y = random(10, 10);
void setup() {
 
  img = loadImage( "swarm.jpg" ); 
  cols = img.width/cellsize;             
  rows = img.height/cellsize;    
  
  size(500,500, P3D);  
}

void draw() {
  background(0);
  img.loadPixels();
 x= x + random(3)-random(3);
  y= y + random(3)-random(3);
  for(int i=img.pixels.length-1;i>500;i--){
img.pixels[i]=img.pixels[i-500];
}
  for (int i = 0; i < cols; i++ ) {
   
    for (int j = 0; j < rows; j++ ) {
      int x = i*cellsize + cellsize/10; 
      int y = j*cellsize + cellsize/10; 
      int loc = x + y*width;           
      color c = img.pixels[loc];      
      posX=int(random(0,10));
      posY=int(random(0,10));
     
      float z = (mouseX/(float)width) * brightness(img.pixels[loc])+ 100.0;


      pushMatrix();
      translate(x,y,z); 
      fill(c);
      stroke(c);
      ellipseMode(CENTER);
      ellipse(posX,posY,cellsize,cellsize);
      rectMode(CENTER);
      //rect(0, 0, posX, posY);
   
      triangle(cellsize, 9, posX, posY, cellsize, 6);
      //triangle(x, y, 20, cellsize, 30, cellsize);
       //triangle(30, cellsize, x, y, 10, cellsize);
     // triangle(cellsize, posX, cellsize, posY, x, y);
       //triangle(posX, posY, posY, posX, cellsize, 30);
      //triangle(posY, posX, posX, posY, 30, cellsize);
  
  //if(mousePressed){
    
    //rect(mouseX, mouseY, posX, posY, 20, 20, c, c);
    //triangle(mouseX,mouseY, posX, posY, c, c);

      popMatrix();



  }

    }
   // saveFrame();
  }
  


