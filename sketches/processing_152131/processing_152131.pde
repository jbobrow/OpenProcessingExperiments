
/*
 * Creative Coding excercise
 * Michal Huller June 18 2014
 */
 
ArrayList<Flower> allFlowers;


void setup() {
  size(800, 600);

  allFlowers = new ArrayList<Flower>();
  /*allFlowers.add(new Flower(float(width/2), float(height/2), 0.2, 
    float(100), color(#ff0080), color(#ff20a0)));
  */
  background(0);
  noLoop();
  strokeWeight(0.6);
}


void draw() {
  background(0);
  for (int i = 0; i < allFlowers.size(); i++) {
    allFlowers.get(i).draw();
  }
}

void mouseClicked() {
  allFlowers.add(new Flower(float(mouseX), float(mouseY), random(0,TWO_PI), random(20,100), 
  color(int(random(200,256)), int(random(0,30)), 
  int(random(100,220))), 
  color(int(random(200,256)), int(random(20,80)), 
  int(random(0,80)))));
  redraw();
}

void keyPressed() {
  if (key == ' ') {
    while (allFlowers.size ()> 0)
      allFlowers.remove(0);
    redraw();
  }
}

class Flower {

  float steps = 0.012;
  PVector cent;
  float handAng;
  float handLen;
  color handCol;
  color petalCol;
  int petalsNum;
  
   Flower(float cx, float cy, float ha, float hl, color hc, color pc) {
    cent = new PVector(cx, cy);
    handAng = ha;
    handLen = hl;
    handCol = hc;
    petalCol = pc;
    petalsNum = int(random(3,8));
  }

   void draw() {
   float changHand = handLen;
    float x = cent.x;
    float y = cent.y;
    
    for (float circAng = handAng; circAng < TWO_PI+handAng; circAng += steps) {
      stroke(handCol, 200);
      changHand = handLen * (0.1 + sqrt(abs(sin(circAng*petalsNum))));
      x = cent.x + changHand *cos(circAng);
      y = cent.y + changHand *sin(circAng);
      line(cent.x, cent.y, x, y);
      stroke(petalCol, 200);
      ellipse(x, y, 2, 2);            
    }
        handCol = color(red(handCol), constrain(green(handCol) + int(random(3,10)), 0, 255),
    blue(handCol));

  }
 
}



