
PImage photo;

void setup(){
  size(314,397);
  photo = loadImage("bushyearbook.jpg");
  
 image(photo,0,0); 
  
  
  
}

void draw(){

   

   stroke(0);
   strokeWeight(3);
  if(mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);}

}


