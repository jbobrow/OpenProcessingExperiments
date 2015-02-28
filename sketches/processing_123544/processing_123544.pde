
Rain r1;


int numDrops = 40;
Rain[] drops = new Rain[numDrops]; // Declare and create the array

void setup() { 
  size (1000, 600);
  background (255);
  background(255);
  smooth();
  noStroke();
  //Loop through array to create each object
  for (int i = 0; i < drops.length; i++) {

    drops[i] = new Rain(); // Create each object
    r1 = new Rain();
  }
}


void draw() {

  fill(255, 80);
  rect(0, 0, 1000, 1000);
  drawBackground();
  //Loop through array to use objects.
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
  }
}

void drawBackground() {
  stroke(0);
  fill(#C4CDD1);
  rect(20, 200, 70, 225);

  line(0, 350, 1000, 350);
  rect(135, 315, 770, -315);
  fill(#90ADB9);
  rect(150, 300, 740, -300);

//rug
fill(#85BCB8);

  line (100, 600, 150, 450);
  line (900, 600, 850, 450);
  line (150, 450, 850, 450);
  line (100, 600, 900, 600);
  line (115, 600, 160, 460);
  line (885, 600, 840, 460);
  line (160, 460, 840, 460);
  
//buildings
  fill(50);
  rect (200, 300, 18, -115);
  rect (375, 300, 18, -40);
  rect (185, 300, 20, -45);
  rect (185, 300, 20, -45);
  rect (500, 300, 25, -200);
  rect (450, 300, 20, -150);
  rect (415, 300, 23, -140);
  rect (400, 300, 18, -125);
  rect (360, 300, 15, -90);
  rect (325, 300, 25, -75);
  rect (295, 300, 17, -80);
  rect (267, 300, 20, -60);
  rect (245, 300, 22, -100);
  rect (220, 300, 19, -73);
  rect (185, 300, 16, -45);
  rect (162, 300, 18, -56);
  rect (185, 300, 20, -45);

  rect (530, 300, 25, -190);
  rect (550, 300, 20, -150);
  rect (585, 300, 23, -140);
  rect (600, 300, 18, -125);
  rect (640, 300, 15, -90);
  rect (675, 300, 25, -75);
  rect (705, 300, 17, -80);
  rect (733, 300, 20, -60);
  rect (755, 300, 22, -100);
  rect (780, 300, 19, -73);
  rect (815, 300, 16, -45);
  rect (838, 300, 18, -56);
  rect (862, 300, 20, -45);

  line(0, 390, 1000, 390);
}





void lightning() { 
  int a = round(random(150, 875));    //x-co for starting point
  int b = 50;    //x-co for ending point
  int c = 0;    //y-co for starting point
  int d = 0;    //y-co for ending point

  //max length of bolt
  while (d < 275) {

    b = (a-50) + round(random(80));    //direction of lines
    stroke (255);
    line (a, c, b, d);
    c = d;   
    d += round(random(50));   
    a = b;
  }
} 

void mousePressed() {
  lightning();
  lightning();
  lightning();
  loop();
  noStroke();
}

//void mouseReleased() {
//  noStroke();
//  rect(150, 0, 740, 300);
//  fill(255);
//}



class Rain {
  float r = random(150, 875);
  float y = random(-height);

  void fall() {
    y = y + 10;
    fill(0, 10, 200, 180);
    ellipse(r, y, 2, 2);

    if (y>290) {
      r = random(150, 875);
      y = random(-200);
    }
  }
}







