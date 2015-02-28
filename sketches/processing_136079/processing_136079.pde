
float r;
float g;
float b;

void setup(){
  size(500,500);
  background(255);
}

void draw(){
   if(mousePressed){
     fill(0);
     stroke(r,g,b);
     float weight=dist(pmouseX, pmouseY, mouseX, mouseY);
     strokeWeight(weight);
     point(mouseX, mouseY);
   }
   changeColor();
}

void changeColor(){
  r=(255*mouseY/height);
  g=(255*mouseX/width);
  b=(255*mag(width, height)/mag(mouseX,mouseY));
}
