
boolean mouseIsDown = false;
boolean visible = false;
String[] firstLine = {
  "Life", "Love", "Marriage", "Carnegie Mellon University", "Hate", "Jealousy", "Prejudice", "Dizzyness", "Memory", "Dream", "A 12hour flight"
};
String[] secondLine = {
  "a weird concept", "a strange place to be", "not so cool", "a long flight back home", "not cool", "deep", "too long", "real"
};
int x = 50;

void setup () {
  size (750, 500);
  mouseIsDown = false;
  background(255, 255, 255);
  smooth();
}

void draw () {
  fill(0, 0, 0);  
  if (mouseIsDown == true) {
    if (visible == false) {   

      textFont(createFont("Helvetica", 40));
      float rndfirstFloat = random(10);
      int rndfirst = round(rndfirstFloat);
      text(firstLine[rndfirst], x, 200);

      textFont(createFont("Helvetica", 30));
      text("is", x, 250);

      textFont(createFont("Helvetica", 55));
      float rndSecondFloat = random(7);
      int rndSecond = round(rndSecondFloat);
      text(secondLine[rndSecond], x, 300);
      visible = true;
    }
  }
  if (mouseIsDown == false)
  {
    background(255, 255, 255);
    visible = false;
  }
}

void mousePressed() {
  mouseIsDown = true;
}

void mouseReleased()
{
  println("derp");
  mouseIsDown = false;
}
