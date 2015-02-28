
//example tutorial from processing.org
//Scale Shape by George Brower

//loaded shape name
PShape lolo;

void setup() {
//size of screen  
  size(950, 250);
//no jagged lines  
  smooth();
//loaded shape from created and exported from illustrator as an .svg file 
//in the same folder as the processing code
  lolo = loadShape("lolo.svg");
} 

void draw() {
//background colour  
  background(#FFFFFF);
//"width/number" how far from the left the shape begins
//"height/number" how many unite from the bottom the shpe begins
  translate(width/15, height/2);
//"zoom" = variable name for referencing
//"map" = maps out the positions of the loaded shape
//"mouseX" current position of the x-axis of the mouse, shape follows
  float zoom = map(mouseX, 87, width, 0.1, 4.5);
  scale(zoom);
  shape(lolo, 140, -190);
}

                
                
