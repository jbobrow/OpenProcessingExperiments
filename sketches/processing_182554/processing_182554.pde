
String text = "";

void setup()
{
  size(1000,600);
  textFont(createFont("Dax-Bold",(40)));
   background(255);
}
 
void draw(){
  float  x1 = map(mouseX, 0, 500, 0, 255);
  float  x2 = map(mouseY, 0, 500, 0, 255);
    fill(x1,x2,0);
//    
//if (mousePressed);
//  fill(x1,x2,0);
//  noStroke();
//  ellipse(mouseX,mouseY,8,8);
  
  
  text(text, +40, +40,920,520);
  println(mouseX + " : " + pmouseX);
  println( text );

}
  void keyReleased() {
  textAlign(CORNER,TOP);
  text = text + key;
 
  }


 

//  if (mousePressed){
//  noLoop();
//} else {
//  loop();



