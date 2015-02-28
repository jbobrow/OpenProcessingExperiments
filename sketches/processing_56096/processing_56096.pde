
Rain r1;

int numDrops = 1;
Rain[] drops = new Rain[numDrops]; 

void setup() {
  size(600,600);
  background(255);
  smooth();
  noStroke();
  for (int i = 0; i < drops.length; i++) {

    drops[i] = new Rain(); 
    r1 = new Rain();
  }
}

void draw(){
  fill(0,30);
  rect(0,0,600,600);
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
  }

}

class Rain {
  float r = random(600);
  float y = random(-height);

  void fall() {
   y = y + 7;
    fill(random(255), random(0), random(255), random(255));
    ellipse(r, y, 15, 15);

   if(mousePressed){
   r = random(600);
   y = random(-200);
   }

  }
}

