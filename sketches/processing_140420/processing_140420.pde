
// base example for color experiments
// AW, March 2014
 
color c1,c2,c3; // FÃ¼llfarbe, Linienfarbe, Hintergrundfarbe
void setup() {
  size(400,400);
  strokeWeight(2);
  colorMode(HSB, 360,100,100);
  defineColors();
  background(c2); 
}
 
void draw() {
  defineColors();
  fill(c1);
  stroke(c3);
  ellipse(mouseX, mouseY, abs(mouseX-pmouseX), abs(mouseX-pmouseX));
if(mousePressed == true){
  background(c2);
}
}
   
void defineColors() {
  //int r1 = (int)random(342
  //RGB MODE
   //c1 = color(241,150,170);
   //c2 = color(214,237,245);
   //c3 = color(194,219,117); 
   //HSB MODE
   c1 = color((int)random(330,360), (int)random(30,40), (int)random(80,100));//342,38,95
   c2 = color(195, (int)random(10,20), (int)random(70, 160)); //13,96
   c3 = color(75, 47, (int)random(80, 100)); //86
}

