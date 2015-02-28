
PImage image1;
PImage image2;
PImage image3;
PImage image4;
PImage image5;
PImage image6;
PImage image7;
float x;
float y;
float dia = 50;
float radius = dia/2;
color col = color(200);
 
 
void setup() {  //setup function called initially, only once
  size(500,500);
  background(255);  //set background white
  frameRate(99999999);
   image1 = loadImage("imagename.jpg");
   image2 = loadImage("imagename.jpg");
   image1 = loadImage("imagename.jpg");
}
 
void draw() {  
float x = 450;
float y = 450;
  fill(col);
  ellipse(x,y,dia,dia);
   fill(200,20,5);
text("Next", 435,455);
   
  
  if(mousePressed == true) { //add some interaction
    if(mouseX > x-radius && mouseY< x+radius && mouseY > y-radius && mouseY < y+radius){
    background(255);
 
  fill(240,90,0);
noStroke();
ellipse(450,450,dia,dia);
fill(0);


    }
    }
    }
 
                


  


