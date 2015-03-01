
void setup(){

size(640, 360);
noStroke();
background(0);

color inside = color(255, 0, 0);
color middle = color(255, 0, 10);
color outside = color(255, 0, 50);


pushMatrix();
translate(80, 80);
fill(inside);
rect(0, 0, 200, 200);

}
void draw(){
  
if(keyPressed == true && key == 's'){
  println("Saving image...");
  saveFrame("output-####.jpg"); 
}}



