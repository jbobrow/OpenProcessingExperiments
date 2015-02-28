
// ladybug

void setup() {
  size(200,200);
  smooth();
  frameRate(45);
}

void draw() {
  
  colorMode(RGB,255,255,255);
  background(mouseX,200,200);
  noStroke();
  
  //head
  fill(0);
  ellipse(mouseX,mouseY-55,35,35);
  
  //antenna ends
  //fill(0);
  //ellipse(mouseX+20,mouseY-75,7,7);
  //ellipse(mouseX-20,mouseY-75,7,7);
  
  //antenna
  stroke(0);
  strokeWeight(1);
  line(mouseX-10,mouseY-70,pmouseX-24,pmouseY-75);
  line(mouseX+10,mouseY-70,pmouseX+24,pmouseY-75);
 
 
  //body
  stroke(0);
  strokeWeight(3);
  fill(255,0,0);
  ellipse(mouseX,mouseY,100,110);
  
  //stripe
  line(mouseX,mouseY-55,mouseX,mouseY+54);
  
  //spots
  noStroke();
  fill(0);
    //middle spots
  ellipse(mouseX+15,mouseY+5,15,15);
  ellipse(mouseX-15,mouseY+5,15,15);
    //top layer spots
  ellipse(mouseX+35,mouseY-25,15,15);
  ellipse(mouseX-35,mouseY-25,15,15);
    //bottom layer spots
  ellipse(mouseX+30,mouseY+35,15,15);
  ellipse(mouseX-30,mouseY+35,15,15);
  
}




  
  
  

