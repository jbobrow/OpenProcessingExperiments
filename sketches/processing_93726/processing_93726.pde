
int light;
int starh, starw;
int starmoverate;
void setup() {
  size(800, 700);
  smooth();
  strokeWeight(4);
  light = 10;
  starh = 0;
  starw = 0;
  starmoverate = 10;
  }

void draw() {
  background(0);
  fill(255, 228, 0);
  stroke(255, 228, 0);
  for(int light = 10; light < height ; light++){
    float hh = width;
    float offsetA = random(-hh, hh);
    ellipse(offsetA, light , 5, 5);
  }
  if (starw >=width) {
    starw=0;
    starh=0;
  }
  else if (starw<=0) {
    starmoverate = 10;
  }
  starw = starw + starmoverate;
  starh = starh + starmoverate;
  fill(255,94,0);
  stroke(255,94,0);
  ellipse(starw, starh, 20, 20);
  ellipse(starw+400, starh+50, 20, 20);
  ellipse(starw-400, starh+200, 20, 20);
  
  fill(128, 65, 217);
  stroke(30);
  ellipse(320, 200, 30, 80+mouseX/10);
  ellipse(480, 200, 30, 80+mouseX/10);
 // arc(280, 250, 100, 100, PI-QUARTER_PI, PI+QUARTER_PI, PIE);
 // arc(520, 250, 100, 100, PI+HALF_PI+QUARTER_PI, TWO_PI+QUARTER_PI, PIE);
//arc is not working on website so i changed arc to ellipse

 // line(200, 620, 600, 780);
 // line(600, 620, 100, 780);
  rect(200, 620, 400, 20, 7);
  triangle(400, 500, 230, 700, 570, 700);//body

  ellipse(400, 400, 400, 400);//face
  
  point(235, 400);
  point(240, 405);
  point(245, 400);
  point(545, 400);
  point(540, 405);
  point(535, 400);


  fill(50);
  triangle(400, 410, 380, 380, 420, 380); //nose
  line(400, 410, 350, 450);
  line(400, 410, 450, 450);
  
  fill(200, 50, 50);
  quad(400, 410, 375, 430, 400, 460+mouseY/25, 425, 430); //mouth
  
  fill(200);
  stroke(50);
  ellipse(320, 360, 50, 50);
  ellipse(480, 360, 50, 50);
  
  fill(50);
  ellipse(320, 360, 7, 7);
  ellipse(480, 360, 7, 7);
  ellipse(320, 360, mouseX / 20, mouseX / 20);
  ellipse(480, 360, mouseX / 20, mouseX / 20);
  //eyes
  
  line(290, 290+mouseY /20, 330, 290);
  line(460, 290, 500, 290+mouseY /20);
  //eyebrows
  
}
