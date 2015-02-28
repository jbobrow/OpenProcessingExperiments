

void setup () {
  //smooth();
  size(800,600);
}
void draw () {
 background(255);
 
rect(130, 120, 55, 55);
 
fill(mouseX, mouseY, 75);
triangle(30, 75, 58, 20, 86, 75); 

fill(78, 89, 75,40);
ellipse(width/2, height/2, mouseX, mouseY);


//ellipse(mouseX+150, mouseY, 55, 40);
//saveFrame();
//saveFrame("filename-#.jpg");
  stroke(0,0,0);
strokeWeight(1);

}

