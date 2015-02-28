
float bpm = 128;

float rotatex,rotatey;

float zoom = 0;

ArrayList<Ring> rings;

void setup() {

  size(600, 400, P3D);

  colorMode(HSB);

  frameRate(30);

  rings = new ArrayList<Ring>();

  for(int i=0;i<30;i++){

    rings.add(new Ring());

  }

}

void draw() {

  background(0);

   camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0)+zoom, width/2.0, height/2.0, 0, 0, 1, 0);

  noStroke();

  translate(width/2, height/2);

  rotateY(rotatey);

  rotateX(rotatex);
  zoom = sin(radians(frameCount)*3)*200 - 300;

  lights();

  directionalLight(0, 255, 200, 1, 1, 0);
  directionalLight(0, 255, 50, -1, -1, 0);

  for(Ring ring : rings){

    ring.render(frameCount);

  }

  saveFrame("fr/####.png");

}

void mouseMoved(){

  rotatey = radians(mouseX);

  rotatex = radians(mouseY);

}

void mouseClicked() {

}

void keyPressed() {

  if (key == 'z') {//splash

    zoom+=5;

  }

  else if(key == 'x'){

    zoom-=5;

  }

}

class Ring {

  float r = random(50);
  color c =color(200,150,200,200);

  Ring () {

  }

  void render(int frameCount){

      pushMatrix();
      //translate(r, y, 0);

      fill(c);
      sphere(r);
      fill(color(200,150,200,100));
      sphere(r+20);
      fill(color(200,150,200,50));
      sphere(r+50);
      popMatrix();
  }

}



