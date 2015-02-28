
PImage Pic;

void setup(){
  size(300,300);
  Pic = loadImage("2.jpg");
  background(255);
  noStroke();
  smooth();
}
void draw(){
 
 for(int countX = 0; countX < width/10; countX++) {
  for(int countY = 0; countY < height/10; countY++) {
     int y = floor(random(0,Pic.width));   
  int x = floor(random(0,Pic.height));  
  color myColor = Pic.get(x,y);     
  fill(myColor,90);
  noStroke();
   rect((countX * 10)-random(20),(countY * 10)-random(20),30,30);  
  stroke(myColor,90);
  line(mouseX,mouseY,mouseX+random(-300,300),mouseY+random(-300,300));
}
}
noLoop(); 
}

void mousePressed(){
  loop();
}







