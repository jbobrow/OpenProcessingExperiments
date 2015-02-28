
float aumenta = 0;
void setup() {
  size(600, 600);
  frameRate(1000);
}
void draw() {
  background(255, 255, 255);
  aumenta=aumenta+0.01;
  float seno = 500*sin(aumenta);
  noStroke();
  fill(255, 142, 195);
  ellipse(width/2, height/2, seno, seno);


  if (mouseX<=seno) {
    if (mouseY<=seno)
    {
    textSize(100);
    fill(255, 255, 255);
    loadFont("ScriptMTBold-48.vlw");
    text("SOS", (width/5)*1.65, (height/7)*4);
  }
  }
}
