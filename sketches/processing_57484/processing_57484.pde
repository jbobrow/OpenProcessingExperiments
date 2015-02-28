
float tras = 2.0;
PGraphics frame;
float rx = 0;
float ry = 0;
float ra = 0;
float rb = 0;
float z = 100;

void setup() {
  size(650, 366, P3D);
  fill(0);
  frameRate(20);
  noStroke();
  loadPixels();

  frame = createGraphics(width+20, height+20, P2D);
  frame.beginDraw();

  frame.stroke(0, 120);
  frame.noFill();
  frame.strokeWeight(20);

  frame.stroke(0, 40);
  frame.rect(0, 0, width, height);
  frame.filter(BLUR, 10);

  frame.stroke(0, 120);
  frame.rect(0, 0, width, height);
  frame.filter(BLUR, 2);

  frame.endDraw();

  smooth();
}

void draw() {
  background(255);
  pre();
  post();
 
  
}


void pre() {

  beginShape(QUADS);
  fill(0);
  vertex(random(650), random(366));
  vertex(random(650), random(366));
  fill(255);
  vertex(random(650), random(366));
  vertex(random(650), random(366));
  endShape(CLOSE);


  pushMatrix();
}

void post() {

   
  popMatrix();

  //resetMatrix();
  image(frame, -random(2), -random(2));
  for (int i =0;i<pixels.length;i++)
    pixels[i] = color(brightness(pixels[i])+random(-80, 80));
  filter(BLUR, 0.50);
  
  }
  void keyReleased(){
     int d = day(); //recupère le jour en valeur entière
  int m = month();
  int y = year(); 
  int he = hour(); 
  int mi = minute();
  int se = second(); 
  String _d = nf(d, 2);//converti d'une valeur entière en chaine de caratère 
  String _m = nf(m, 2);
  String _y = nf(y, 4);
  String _he = nf(he, 2);
  String _mi = nf(mi, 2);
  String _se = nf(se, 2);
  if(key == 's'){
  save(_y+_m+_d+_he+_mi+_se);
  }
 
}






