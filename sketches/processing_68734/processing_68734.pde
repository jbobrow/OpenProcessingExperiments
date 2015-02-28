
void setup() {
  size(800, 600, P2D);
}

int maxbranch =8;
float ang = 0;
float ang2 = 0;
float distance;

PFont font = createFont("Arial", 20);
float time = 0;
void draw() {
  time += 0.005;
  background(80);
  ang2 = sin(time)*PI/2;
  ang = sin(time*1.5)*PI/2;
  distance = 160;
  pushMatrix();
    translate(400,550);
    branch(0);
  popMatrix();
  infoText();
}

void branch(float incnt){
  float cnt = incnt;
  cnt++;
  //stroke(0,255/(cnt/2));
  stroke(0,0,0,0);
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
  fill(0);
  String txt = "WATCH THE TREE \n" +
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
