
int circle=275;

void setup () {
size(400,400);
}

void draw () {
background(0,0,0);
if (circle<201) {
fill(0,0,0);
  }
ellipse(200,200,50,50);
ellipse(200,125,50,50);
ellipse(circle,275,50,50);
if (mousePressed && mouseX>300 && mouseY<300) {
circle=circle-3;
  }
if (circle<200) {
circle+=3;
fill(255,115,0);
textSize(30);
text("awesome!",150,200);  
  }
}
