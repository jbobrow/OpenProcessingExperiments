
PImage img;
PImage img2;
PImage img3;
PImage img4;
float f= 0;


void setup() {
  size(600, 400);
  img = loadImage("_MG_9520_klein.jpg"); 
   img3 = loadImage("_MG_9522_klein.jpg");
  img4 = loadImage("_MG_9344_klein.jpg");
    img2 = loadImage("MG_9464.jpg"); 
}
void draw() { 
  image (img, 0,0,300,200);
   image (img2, 300,0,300,200);
    image (img3, 0,200,300,200);
     image (img4, 300,200,300,200);
     
     if(mouseX <= 300 && mouseY <= 200 && mousePressed)
     {
     
  image (img4, 0,0,f*1.5,f);
  f= f+2;
  
}if(mouseX >= 300 && mouseY <= 200 && mousePressed)
{

image(img3, 0,0,mouseX,mouseY);
}
if (mouseX>=0 && mouseY >= 200 )
{
  
  image(img2, 0, 0, f*1.5,f);
if(pmouseX >= 0 && pmouseY > 2 && mousePressed );
 float weight = dist(pmouseX, pmouseY, mouseX, mouseY);
  
 f= f+5;
 
image(img, pmouseX, pmouseY, mouseX,mouseY);

}
}
