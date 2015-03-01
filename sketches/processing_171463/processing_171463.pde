
int amount= 600;
 
int[] x = new int[amount];
int[] y = new int[amount];
int[] z = new int[amount];

void setup() {
  size(620, 620, P3D);
  background(0);
}
  
  void scene1 () {
  noFill();
  stroke(255);
  strokeWeight(25);
  for(int i = 0; i<amount; i=i+4) {
    x[i] = int(random(-240, 200));
    y[i] = int(random(-240, 200));
    z[i] = int(random(-240, 200));
  }
}

void scene2 () {
   
 strokeWeight(8);
  for(int i = 0; i<amount; i++) {
    x[i] = int(random(-150, 150));
    y[i] = int(random(-150, 150));
    z[i] = int(random(-150, 150));
  }
}

void scene3 (){
   noFill();
  stroke(255);
  strokeWeight(2.5);
  for(int i = 0; i<amount; i++) {
    x[i] = int(random(-150, 150));
    y[i] = int(random(-150, 150));
    z[i] = int(random(-150, 150));
  }
}
  
  
  
   void draw() {
  background(0);
  
  translate(width/2, height/2);
  
  rotateY(frameCount / 100.0);
  
  box(300);
  for(int i = 0; i<amount; i++) { 
    point(x[i], y[i], z[i]);
  }
  int m = millis();
  if(m < 4000) {
    scene1();
  } else if(m < 8000) {
    scene2();
  } else if(m < 12000) {
    scene3();
  }  
}

