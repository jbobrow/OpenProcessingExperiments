
PImage img;

void setup(){
  size(400,400,P3D);
  img = loadImage("art.jpg");
 
  background(0);
 
  
}
float cameraX,cameraY;

  void draw (){
   
    
    camera(-100, 50, random(-300,500), width, height, 1, 1, 1, 1);
    cameraX = radians(map(mouseX, 0, width, 50, 0));
     cameraY = radians(map(mouseY, 0, height, 180, 0));
      println(cos(cameraX));
   
    int x=floor(random(0,img.width));
    int y= floor(random(0,img.height));
   
    color myColor = img.get(x,y);
   
  stroke(0);
  fill(myColor,100);
 rect(x,y,random(20,200),50);
  }


