
void setup() {
  size(600,500);
  background(255);
}

float trussWidth=40;
float trussHeight=50;
float beamWidth=20;
float beamHeight=30;
int collumnSpacing= 40;

void draw () {
}

void keyPressed() {
  if (key=='w') {
    trussWidth ++;
    Truss();
  }
  if (key=='x') {
    trussWidth --;
    Truss();
  }
  if (key=='l'){
    trussHeight ++;
    Truss();
  }
   if (key=='y'){
    trussHeight --;
    Truss();

  }
}

void Truss () {
stroke(105,105,105);
noFill();
beginShape (TRIANGLE_STRIP);
vertex(20, 100);
vertex(20, 150);
vertex(60, 100);
vertex(60, 150);
vertex(100, 100);
vertex(100, 150);
vertex(140, 100);
vertex(140, 150);
vertex(180, 100);
vertex(180, 150);
vertex(220, 100);
vertex(220, 150);
vertex(260, 100);
vertex(260, 150);
vertex(300, 100);
vertex(300, 150);
vertex(340, 100);
vertex(380, 150);
endShape();// beam of 9 trusses

stroke(1129,118,149);
fill(1129,118,149);
rect(20,150,10,80);
rect(60,150,10,80);
rect(100,150,10,80);
rect(140,150,10,80);
rect(180,150,10,80);
rect(220,150,10,80);
rect(260,150,10,80);
rect(300,150,10,80);
rect(340,150,10,80);
rect(380,150,10,80);
endShape(); // series of collumns

}

  
    

