
//Amanda Rhee
//July 8, 2013
//Project: Mouse Drawing 
  //Referenced: DMA 
void setup() {
background(255); //white background
size(400, 400);//screen size
}
void draw() { 
  if(mousePressed == true)
  fill (0);
  if(mousePressed == true)
  ellipse(mouseX, mouseY, 5, 5);
  println("mouseX:"+mouseX+" , mouseY:"+mouseY);
}
