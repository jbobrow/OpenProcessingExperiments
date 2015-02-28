
int num = 50; 
float dropSize = 75;
float x1, x2, y1, y2;

Rain[] myRain = new Rain[num];//sets first array for Rain

color[] myColors = new color[2]; //sets second array for drop color

void setup() {

  size(300, 300);
  x1 = random(150, 270);
  y1 = random(250, 1430);
  x2 = random(150, 1350);
  y2 = random(150, 250);


  myColors[0] = color(120, 130, 124, 45);//sets colors to alternate between
  myColors[1] = color(0, 168, 255, 75);


  for (int i=0;i<myRain.length;i++) {
    myRain[i] = new Rain();
  }

  noStroke();
  smooth();
}

void draw() {
  frameRate(5);//slows down spastic frame speed
  background(0);

  x1 = x1 + random(-1, 1);
  y1 = y1 + random(-1, 1);
  x2 = x2 + random(-1, 1);
  y2 = y2 + random(-1, num);

  for (int i=0; i < myRain.length; i++) {
    myRain[i].update();
    myRain[i].draw();
  }
}


class Rain {

  float xpos = random(0, width-num);
  float ypos = random(10, height*num);
  float speed = random(10, 1000);//creates speed range
  color col = myColors[floor(random(0, 2))];


  Rain() {
  }

  void update() {

    ypos = xpos + speed;
  }

  void draw() {
    fill(col);
    noStroke();
    ellipse(random(width), random(height), 1, random(height));//sets thin ellipses=rain


    stroke(random(0, 10));//these ellipses make the slower drops that twinkle on the screen
    strokeWeight(4);
    ellipse(x1, ypos/2, random(dropSize/8), random(num/2));
    ellipse(x1*width, random(ypos/height), random(dropSize/5), random(height/2));
    ellipse(height/num*x1, random(ypos/height), random(dropSize/5), random(dropSize/2));
  }
}


