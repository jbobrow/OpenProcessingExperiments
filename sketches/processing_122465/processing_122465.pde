
void setup() {
  size(200,200);
}

void draw(){
  background(255,255,255);
  
  /*body*/
  fill(191, 52, 52);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 100, 90);
  
  /*inside*/
  fill(240, 174, 174);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY, 60, 69);
  stroke(0);
  
  /*head*/
  fill(191, 52, 52);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY -65, 80, 60);
  
   /*mouth*/
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY -48, 18, 19);
  
  /*teeth left*/
  fill(255);
  rect(mouseX -5,mouseY -57, 5,8);
  
  /*teeth right*/
  fill(255);
  rect(mouseX,mouseY -57, 5, 8);
  
  /*eye*/
  fill(247, 245, 245);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY -76, 35, 26);
  
  /*pupil*/
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY -75, 18, 18);
  
  /*iris*/
  fill(247, 245, 245);
  ellipseMode(CENTER);
  ellipse(mouseX +3, mouseY -71, 5, 5);
  
  /*foot left*/
  fill(191, 52, 52);
  ellipseMode(CENTER);
  ellipse(mouseX -25, mouseY +40, 30, 38);
  
  /*foot right*/
  fill(191, 52, 52);
  ellipseMode(CENTER);
  ellipse(mouseX +25, mouseY +40, 30, 38);
  
  /*hand left*/
  fill(191, 52, 52);
  ellipseMode(CENTER);
  ellipse(mouseX -45, mouseY -13, 28, 33);
  
  /*hand right*/
  fill(191, 52, 52);
  ellipseMode(CENTER);
  ellipse(mouseX +45, mouseY -13, 28, 33);
 
}
