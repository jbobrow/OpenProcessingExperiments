
//Code used from Andreas Koller
//www.openprocessing.org/visuals/?visualID=25907

PImage img;
PFont font;
String input = "College";

 
void setup() {
  img = loadImage("IMG_2359.jpg");
  size(800,600);
  textAlign(CENTER,CENTER);
  font = createFont("Helvetica", 60);
  textFont(font);
  noStroke();
}
 
void draw() {
  
  fill(255);
  rect(0,0,width,height);
 
  fill(#81bcf4);
  if (mousePressed &&(mouseButton == LEFT)){
fill(#fbe860);
}
else if (mousePressed && (mouseButton == RIGHT)){
fill(#ffffff);
 }
 else{
 fill(#81bcf4);
}
//left and right click changes colour of text

  background(img);
  textSize(mouseX+.5);
 
  translate(width/2,mouseY);

 
  text(input,0,0);


}
 




