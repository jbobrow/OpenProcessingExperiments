
PFont font;
float angle = 0.0;
 
void setup(){
size(600,600);
smooth();
font = loadFont("Antipasto-48.vlw");
textFont(font);
}
 
void draw(){
  //background(100,200,10);
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
  fill(random(100));
  textSize(random(30));
  text("electric", width/50, height/50);
  angle += 0.01;
  popMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
  fill(random(255));  
  textSize(6);
  text("asphalt", width/20, height/20);
  angle -= 0.5;
}

