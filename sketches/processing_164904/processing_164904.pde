
PImage illusion;

void setup() {
  size(500,500);
  illusion = loadImage("illusion.jpg");
}
  
 void draw() {
  
  if(key=='a')
  if (mousePressed){
    stroke(random (255), random (255), random (255));
    strokeWeight(14);
    line(mouseX, mouseY, pmouseX, pmouseY);

  }

 if (key=='s')
 if(mousePressed){
   stroke(#47FA51);
   strokeWeight(3);
   ellipse(mouseX, mouseY, 30, 30);
 }
   
 
 if(key=='d')
 if(mousePressed){
 filter(ERODE);
   illusion.resize(0,200);
   image(illusion, pmouseX, pmouseY);
 
 }
 
 if(key=='f') {
   fill(#FCFCFC);
   rect(0, 0, 500, 500);
 }
 
}


