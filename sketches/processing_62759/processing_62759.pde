
float lineX = 250;
float lineY = 250;

float colour = 10;

void setup() {
    background(0);
    smooth();
      size(500, 500);
      colorMode(HSB);
}

void draw(){
  

fill(0,0,0,10);
rect(-10,-10,520,520);

  lineX = lineX+(mouseX-lineX)/50.0;
  lineY = lineY+(mouseY-lineY)/50.0;
translate(mouseY, mouseX);  
rotate(radians(random(30))); 
  ellipse(mouseX, mouseY, lineX, lineY);
  rect(mouseY, mouseX, lineX, lineY);
strokeWeight(2);

if (colour <255){
      colour = colour + 0.05;
} else { colour = 0;
}

  stroke(colour, 200, 200, 75);
  
if (mousePressed && (mouseButton == LEFT)) {
    lineX = lineX+10;
    lineY = lineY+10;
} else if (mousePressed && (mouseButton == RIGHT)) {
   lineX = lineX-10;
   lineY = lineY-10;  
}


}




void keyPressed()
{
//    background(0);
}
