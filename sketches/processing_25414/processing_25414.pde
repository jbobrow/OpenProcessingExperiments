
PFont font;
float angle = 0.0;

void setup(){
size(400,400);
smooth();
font = loadFont("AppleGothic-48.vlw");
textFont(font);
}

void draw(){
  //background(204);
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
  fill(000);
  textSize(16);
  text("Circulate", width/50, height/50);
  angle += 0.01;
  popMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
  fill(#333555);
  textSize(6);
  text("Spin", width/20, height/20);
  angle -= 0.5;
}

                
                                
