
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Hong Jiyae
// ID: 201420117

boolean switchFill1 = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;

// ==========================================
void setup() {
  size(600, 600);
  smooth();
  //noLoop();
}
void draw() { 
  noStroke();
  if (backGround) fill(0, 100);
  if (!backGround) fill(#eeeeee, 100);
  rect(0, 0, width, height);
  fill(#F16D95, 100);
  bezier(80, 80, mouseX, mouseY, pmouseX, pmouseY, 520, 520); 
  bezier(80, 520, mouseX, mouseY, pmouseX, pmouseY, 520, 80); 
  bezier(300, 600, mouseX, mouseY, pmouseX, pmouseY, 300, 0); 
  bezier(600, 300, mouseX, mouseY, pmouseX, pmouseY, 0, 300); 
  fill(#F13C73, 150);
  ellipse(mouseX, mouseY, 100, 100);

  title();
}
// ==========================================
void keyPressed() {
  if (key==' ') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) noLoop();
  if (key=='1') switchFill1 = !switchFill1;
  if (keyCode==TAB) backGround = !backGround;
}
void title() { 
  fill(127);
  textAlign(RIGHT);
  text("HONG Jiyae, interactive Drawing with mouse, Dynamic Media, 2014", width-50, height-20);
}

