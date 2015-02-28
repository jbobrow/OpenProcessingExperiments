
PImage img;  
//float x = random(1, 1) ;
//float y = random(1, 1);
int cellsize = 5; 
int cols, rows;   
int posX, posY;
void setup() {
 
  img = loadImage( "river.jpg" ); 
  cols = img.width/cellsize;             
  rows = img.height/cellsize;    
  
  size(400,200, P3D);  
}

void draw() {
  background(0);
  img.loadPixels();
 //x= x + random(5)-random(5);
  //y= y + random(5)-random(5);
  
  for(int i=img.pixels.length-1;i>500;i--){
img.pixels[i]=img.pixels[i-500];
}
  for (int i = 0; i < cols; i++ ) {
   
    for (int j = 0; j < rows; j++ ) {
      int x = i*cellsize + cellsize/20; 
      int y = j*cellsize + cellsize/20; 
      int loc = x + y*width;           
      color c = img.pixels[loc];      
      posX=int(random(0,20));
      posY=int(random(0,20));
     
      float z = (mouseX/(float)width) * brightness(img.pixels[loc])+ 100.0;


      pushMatrix();
      translate(x,y,z); 
      fill(c);
      stroke(c);
      ellipseMode(LEFT);
      ellipse(posX,posY,cellsize,cellsize);
      rectMode(CENTER);
      rect(0, 0, posX, posY);
       rect(posX, posY, cellsize, cellsize);
      ellipse(cellsize, cellsize, 0,0);

      rect(cellsize, cellsize, posX, posY);
  //if(mousePressed){
    
    //rect(mouseX, mouseY, posX, posY, 20, 20, c, c);
    //triangle(mouseX,mouseY, posX, posY, c, c);
      popMatrix();



  }
    }
    //saveFrame();
  }


