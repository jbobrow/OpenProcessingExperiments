
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
 
  lineX = lineX+(mouseX-lineX)/50.0;
  lineY = lineY+(mouseY-lineY)/50.0;

translate(mouseY, random(50));  
rotate(radians(45)); 
  line(mouseX, mouseY, lineX, lineY);
  line(mouseY, mouseX, lineX, lineY);


if (colour <255){
      colour = colour + 0.1;
} else { colour = 0;
}

  stroke(colour, 200, 200, 73);
  
}
