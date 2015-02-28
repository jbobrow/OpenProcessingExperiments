

void setup(){
  size(640, 480);
  background(0);
  //colorMode(HSB, 360, width, height); 
  colorMode(HSB, 360, 360, height); 
  
  smooth(); 
}

void draw(){
  println("x: "+mouseX);
  println("y: "+mouseY);
  println("");
  noStroke();
   fill(mouseX + 200 , mouseX, mouseY - (height/5),height/20);
   triangle(width/2,height/2,mouseX+20, mouseY+20, mouseX-20, mouseY+20); 
   fill(0);
   rect(0,0,width, height/2);
}


