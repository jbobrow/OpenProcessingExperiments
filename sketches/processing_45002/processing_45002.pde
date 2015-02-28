


float[] yTop = new float[4];
char[] post = {'P', '0', 'S', 'T'};
char[] analog = {'A', 'N', 'A', 'L', 'O', 'G'};
char[] gibberish = {'@', '#', '!', '%', '&', '['};
PFont fontA;
float[] roff = new float[5];
float[] roff2 = new float[7];

void setup() {
  size(600, 400);
  smooth();
  ellipseMode(RADIUS);
  colorMode(HSB, 100);
  fontA = loadFont("Klavika-Light-48.vlw");
  textFont(fontA, 48);
  frameRate(10);
  println(post.length);
}

void draw() {
  background(0);
  int mv = int(map(mouseX, 0, width, 0, 5)); // mapped to 1 to 5
  int mv2 = int(map(mouseX, 0, width, 0, 7)); // mapped to 1 to 7
  
  for (int i=0;i<=mv;i++) {
    roff[i] = random(-10, 10);
    if (i<post.length) {
      int temp = int(random(gibberish.length));
      post[i] = gibberish[temp];
    }
    
    if(mv<4){
      post[3] = 'T';
    }
    
    if(mv<3){
      post[2] = 'S';
    }
    
    if(mv<2){
      post[1] = 'O';
    }
    
    if(mv<1){
      post[0] = 'P';
    }
  }
  
  for (int j=0;j<=mv2;j++) {
    roff2[j] = random(-10, 10);
    if (j<analog.length) {
      int temp = int(random(gibberish.length));
      analog[j] = gibberish[temp];
    }
    if(mv2<6){
      analog[5] = 'G';
    }
    if(mv2<5){
      analog[4] = 'O';
    }
    if(mv2<4){
      analog[3] = 'L';
    }
    
    if(mv2<3){
      analog[2] = 'A';
    }
    
    if(mv2<2){
      analog[1] = 'N';
    }
    
    if(mv2<1){
      analog[0] = 'A';
    }
  }
  
  
  drawShape(5);
  
}

void drawShape(int sw) {
  strokeWeight(sw);
  stroke(31, 0, 100);
  pushMatrix();
  translate(0, 150);
  for (int i = 0;i<4;i++) {
    int xpos = 80*(i+1);

    if (i==0) {
      text(post[i], xpos, roff[i+1]);
    }
    else {
      text(post[i], xpos, roff[i+1]);
      line(xpos-50, roff[i], xpos-5, roff[i+1]);
    }
  }
  popMatrix();
  pushMatrix();
  translate(0, 250);
  for (int i = 0;i<6;i++) {
    int xpos = 80*(i+1);

    if (i==0) {
      text(analog[i], xpos, roff2[i+1]);
    }
    else {
      text(analog[i], xpos, roff2[i+1]);
      line(xpos-50, roff2[i], xpos-5, roff2[i+1]);
    }
  }
  popMatrix();
}





