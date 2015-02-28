
PImage sand; //declaring


int x;
 
void setup(){
size(500,500);
smooth();
   
  sand = loadImage("sand2.jpg");

   
}
 
 
void draw(){
 // background(0);
 background(255);
 image(sand, 0,0);
  
 //get
 color temp = get(mouseX,mouseY);
  
 fill(temp,50);
 stroke(0);
 strokeWeight(2);
ellipse(mouseX, mouseY,50,50);
  
 float r = red(temp);
 float g = green(temp);
 float b = blue(temp);
 println(r+","+g+","+b);
}
  


