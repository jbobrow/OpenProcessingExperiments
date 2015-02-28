
//Aufgabe 1 ==================================================

//void setup() {
//  size(600, 600);
//  background(255);
//  drawKreise();
//}
//void keyPressed(){
//  background(255);
//  drawKreise();
//}
//void draw() {
//}
//
//void drawKreise() {
//  for (int i=0; i<30; i++) {
//    float x = random(width/3);
//    fill((int)random(255), (int)random(255), (int)random(255));
//    ellipse(random(width), random(height), x, x);
//  }
//}


//Aufgabe 2 ===========================================================
//float x; 
//float y;
//float previousX;  
//float previousY; 
//
//
//void setup(){
//  size(600,600);
//  x=width/2;
//  y=height/2;
//  background(255);
//}
//
//void draw(){
//  drawLine();
//}
//
//void drawLine(){
//  previousX = x;
//  previousY = y;
//  x = x+random(-10,10);
//  y = y+random(-10,10);
//  line(x,y,previousX,previousY);
//}


// Aufgabe3 =========================================================
RandomWalker[] rw = new RandomWalker[20];

void setup() {
  size (500, 500);
  for (int i=0; i<rw.length; i++){
    rw[i] = new RandomWalker();
  }
}

void draw() {
  background(255);  
  for (int i=0; i<rw.length; i++){ 
    rw[i].step();
  }
}


//Zusatz ===========

class RandomWalker {
  float x = random(500);
  float y = random(500);
  float xSpeed = random(4);
  float ySpeed = random(4);
  float a = 0;
  float blau = random(255);

  void step() {
    a+=0.01;
    float r = 50+noise(a)*100; 
    fill(0,0,blau);
    ellipse(x, y, r, r);
    x = x + xSpeed;
    y = y + ySpeed;

    if (x > width || x < 0) {
      xSpeed = -xSpeed;
    }

    if ((ySpeed > 0 && y > height) || (ySpeed<0 && y < 0)) {
      ySpeed = -ySpeed;
    }
  }
}



// AUfgabe 4 ===================================================
//
//size (600,400) ;
//
//float noiseScale = 0.02;
//   for (int y=0; y< height ; y++) {
//      for (int x=0; x< width ; x++) {
//// 2D noise Wert aus Koordinaten berechnen
//          float noiseVal = noise (x* noiseScale , y* noiseScale ) ;
//// skalieren zu Grauwert zwischen 0 und 255
//          noiseVal = noiseVal *255;
//// Strichfarbe setzen
//          stroke ( noiseVal ) ;
//// Punkt malen
//          point (x,y) ;
//        }
//     }
     
     
//Aufgabe 5 =====================================================   
//  2 unterschidliche Kreise bewegen sich zufällig
//  sobal diese sich berühren werden sie elastisch zu Ellipsen gedrückt
//  
  
  
//RandomWalker[] rw = new RandomWalker[2];
//
//void setup() {
//  size (500, 500);
//  for (int i=0; i<rw.length; i++){
//    rw[i] = new RandomWalker();
//  }
//}
//
//void draw() {
//  background(255);  
//  for (int i=0; i<rw.length; i++){ 
//    rw[i].step();
//  }
//  if(dist(rw[1].x,rw[1].y,rw[0].x,rw[0].y)<(rw[0].r+rw[1].r)){
//   float alpha = Math.acos((rw[1].x+(rw[1].x-rw[0].x)/2)/(rw[1].x+r);
//   println(alpha);
// }
//}
//
//
////Zusatz ===========
//
//class RandomWalker {
//  float x = random(500);
//  float y = random(500);
//  float xSpeed = random(4);
//  float ySpeed = random(4);
//  float blau = random(255);
//  float r = 50;
//  void step() {
//    fill(0,0,blau);
//    ellipse(x, y, r, r);
//    x = x + xSpeed;
//    y = y + ySpeed;
//
//    if (x > width || x < 0) {
//      xSpeed = -xSpeed;
//    }
//
//    if ((ySpeed > 0 && y > height) || (ySpeed<0 && y < 0)) {
//      ySpeed = -ySpeed;
//    }
//  }
//}
//







