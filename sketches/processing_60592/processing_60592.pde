
//MAIN SETUP
void setup(){
  size(400,400);
  smooth();
  //noCursor();
  frameRate(10);
}
 
//ZEICHNEN
void draw (){
  noStroke();
  //ellipse(200,200,(mouseX+mouseY)/50,(mouseX+mouseY)/50);
  
  //ZWEI KREISE
  fill(216,228,54,10);
  ellipse(200,200,(mouseX+mouseY)/5,(mouseX+mouseY)/5);
  
  fill(255,15);
  ellipse(200,200,mouseX,mouseX);
  
  //VERBLASSEN
  noStroke();
  fill(82,164,207, 10);
  rect(0, 0, width, height);
  
  

}
