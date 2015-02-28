
void setup() {
  size(400, 400);
}
 
int maxbranch =5;
float ang = 0;
float ang2 = 0;
float distance;
 
PFont font = createFont("Arial", 20);
 
void draw() {
  background(80);
  //stroke(0);
  ang2 = map(mouseX, 0, width, 0, 2*PI);
  ang = map(mouseY, 0, 600, -PI, 0);
  distance = 100;
  pushMatrix();
    translate(200,380);
    branch(0);
  popMatrix();
  infoText();
}
 
void branch(float incnt){
  float cnt = incnt;
  cnt++;
  stroke(0,255/(cnt/2));
  fill(255,255,0,255/(cnt/2));
  quad(-15/cnt,0,15/cnt,0,15/(cnt+1),-distance/(cnt),-15/(cnt+1),-distance/(cnt));
  ellipseMode(CENTER);
  if (cnt>1) ellipse(0,0,30/cnt,30/cnt);
  if (cnt < maxbranch){
    pushMatrix();
      translate(0,-distance/(cnt));
      rotate(ang+ang2);
      branch(cnt);
    popMatrix();
    pushMatrix();
      translate(0,-distance/(cnt));
      rotate(-ang+ang2);
      branch(cnt);
    popMatrix();
  }
}
 
void infoText(){
  stroke(0);
  fill(255,0,0);
  String txt = "PLAY THE TREE \n" +
               "Move mouse around and see what happens \n" +
               "LMB = increase branches \n" + "RMB = decrease branches \n" +
               "Number of branches = " + (maxbranch);
  text(txt,20,40);
}
 
void mouseReleased(){
  if (mouseButton == LEFT){
    if (maxbranch < 12) maxbranch++;
  }
  if (mouseButton == RIGHT){
    if (maxbranch > 1) maxbranch--;
  }
}

