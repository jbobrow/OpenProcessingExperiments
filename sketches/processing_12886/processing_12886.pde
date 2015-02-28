
Cloud cloud1;
Cloud cloud2;
Bird bird;
float speed = 1;
float a = 0, b = 0, c = 0, d = 0, e = 0, f = 0, g = 0, h = 0, i = 0, j = 0, k = 0, l = 0;
PImage grass, city1, city2, city3, city4, city5, city6, city7, city8, city9, city10, operahouse, harbourbridge, tree1, tree2, tree3, tree4, fern1, fern2, flowers1, flowers2, birdbody, wingsup, wingsdown;

void setup() {
  size(800,450);
  fill(255,170);
  noStroke();
  smooth();
  grass = loadImage("grass.png");
  city1 = loadImage("city1.png");
  city2 = loadImage("city2.png");
  city3 = loadImage("city3.png");
  city4 = loadImage("city4.png");
  city5 = loadImage("city5.png");
  city6 = loadImage("city6.png");
  city7 = loadImage("city7.png");
  city8 = loadImage("city8.png");
  city9 = loadImage("city9.png");
  city10 = loadImage("city10.png");
  operahouse = loadImage("operahouse.png");
  harbourbridge = loadImage("harbourbridge.png");
  tree1 = loadImage("tree1.png");
  tree2 = loadImage("tree2.png");
  tree3= loadImage("tree3.png");
  tree4= loadImage("tree4.png");
  fern1= loadImage("fern1.png");
  fern2= loadImage("fern2.png");
  flowers1= loadImage("flowers1.png");
  flowers2= loadImage("flowers2.png");
  birdbody= loadImage("birdbody.png");
  wingsup= loadImage("wingsup.png");
  wingsdown= loadImage("wingsdown.png");
  cloud1 = new Cloud(0, 75, 100, random(1,3));
  cloud2 = new Cloud(-150, 150, 75, random(1,3));
  bird = new Bird(random(-1500,-100),50,-100); 
}

void draw() {
  background(190,235,256);
  fill(255,100);
  cloud1.move();
  cloud1.display();
  cloud2.move();
  cloud2.display();
  building();
  plants();
  image(grass,width-grass.width,height-grass.height);
  bird.drawBird();
}

void building() {
  if ( mousePressed && mouseButton == LEFT && mouseX > 0 && mouseX < 70 && mouseY > height-city1.height-100 && mouseY < height-100 ) {
    a = 1;
  }
  if ( mousePressed && mouseButton == LEFT && mouseX > 70 && mouseX < 145 && mouseY > height-city2.height-100 && mouseY < height-100 ) {
    b = 1;
  }
  if ( mousePressed && mouseButton == LEFT && mouseX > 145 && mouseX < 200 && mouseY > height-city3.height-100 && mouseY < height-100 ) {
    c = 1;
  }
  if ( mousePressed && mouseButton == LEFT && mouseX > 200 && mouseX < 285 && mouseY > height-city4.height-100 && mouseY < height-100 ) {
    d = 1;
  }
  if ( mousePressed && mouseButton == LEFT && mouseX > 285 && mouseX < 360 && mouseY > height-city5.height-100 && mouseY < height-100 ) {
    e = 1;
  }
  if ( mousePressed && mouseButton == LEFT && mouseX > 360 && mouseX < 430 && mouseY > height-city6.height-100 && mouseY < height-100 ) {
    f = 1;
  }
  if ( mousePressed && mouseButton == LEFT && mouseX > 430 && mouseX < 520 && mouseY > height-city7.height-100 && mouseY < height-100 ) {
    g = 1;
  }
  if ( mousePressed && mouseButton == LEFT && mouseX > 520 && mouseX < 590 && mouseY > height-city8.height-100 && mouseY < height-100 ) {
    h = 1;
  }
  if ( mousePressed && mouseButton == LEFT && mouseX > 590 && mouseX < 685 && mouseY > height-city9.height-100 && mouseY < height-100 ) {
    i = 1;
  }
  if ( mousePressed && mouseButton == LEFT && mouseX > 685 && mouseX < width && mouseY > height-city10.height-100 && mouseY < height-100 ) {
    j = 1;
  }
  if ( mousePressed && mouseButton == LEFT && mouseX > 400 && mouseX < width && mouseY > height-operahouse.height && mouseY < height ) {
    k = 1;
  }
  if ( mousePressed && mouseButton == LEFT && mouseX > 0 && mouseX < 400 && mouseY > height-harbourbridge.height && mouseY < height ) {
    l = 1;
  }
  if ( a == 1) {
    image(city1, 0, height-city1.height);
  }
  if ( f == 1) {
    image(city6, 351, height-city6.height);
  }
  if ( e == 1) {
    image(city5, 271, height-city5.height);
  }
  if ( d == 1) {
    image(city4, 179, height-city4.height);
  }
  if ( c == 1) {
    image(city3, 125, height-city3.height);
  }
  if ( b == 1) {
    image(city2, 70, height-city2.height);
  }
  if ( g == 1) {
    image(city7, 430, height-city7.height);
  }
  if ( i == 1) {
    image(city9, 587, height-city9.height);
  }
  if ( h == 1) {
    image(city8, 522, height-city8.height);
  }
  if ( j == 1) {
    image(city10, 685, height-city10.height);
  }
  if ( l == 1) {
    image(harbourbridge, 0, height-harbourbridge.height);
  }
  if ( k == 1) {
    image(operahouse, 400, height-operahouse.height);
  }
 }

void plants() {
  if ( mousePressed && mouseButton == RIGHT && mouseX > 0 && mouseX < 70 && mouseY > height-tree1.height-100 && mouseY < height-100 ) {
    a = 0;
  }
  if ( mousePressed && mouseButton == RIGHT && mouseX > 70 && mouseX < 145 && mouseY > height-city2.height-100 && mouseY < height-100 ) {
    b = 0;
  }
  if ( mousePressed && mouseButton == RIGHT  && mouseX > 145 && mouseX < 200 && mouseY > height-city3.height-100 && mouseY < height-100 ) {
    c = 0;
  }
  if ( mousePressed && mouseButton == RIGHT  && mouseX > 200 && mouseX < 285 && mouseY > height-city4.height-100 && mouseY < height-100 ) {
    d = 0;
  }
  if ( mousePressed && mouseButton == RIGHT  && mouseX > 285 && mouseX < 360 && mouseY > height-city5.height-100 && mouseY < height-100 ) {
    e = 0;
  }
  if ( mousePressed && mouseButton == RIGHT  && mouseX > 360 && mouseX < 430 && mouseY > height-city6.height-100 && mouseY < height-100 ) {
    f = 0;
  }
  if ( mousePressed && mouseButton == RIGHT  && mouseX > 430 && mouseX < 520 && mouseY > height-city7.height-100 && mouseY < height-100 ) {
    g = 0;
  }
  if ( mousePressed && mouseButton == RIGHT  && mouseX > 520 && mouseX < 590 && mouseY > height-city8.height-100 && mouseY < height-100 ) {
    h = 0;
  }
  if ( mousePressed && mouseButton == RIGHT  && mouseX > 590 && mouseX < 685 && mouseY > height-city9.height-100 && mouseY < height-100 ) {
    i = 0;
  }
  if ( mousePressed && mouseButton == RIGHT  && mouseX > 685 && mouseX < width && mouseY > height-city10.height-100 && mouseY < height-100 ) {
    j = 0;
  }
  if ( mousePressed && mouseButton == RIGHT  && mouseX > 400 && mouseX < width && mouseY > height-operahouse.height && mouseY < height ) {
    k = 0;
  }
  if ( mousePressed && mouseButton == RIGHT  && mouseX > 0 && mouseX < 400 && mouseY > height-harbourbridge.height && mouseY < height ) {
    l = 0;
  }
  if ( a == 0 ) {
     image(tree1, -50, height-tree1.height);
  }
  if ( b == 0 ) {
     image(tree2, 30, height-tree2.height);
  }
  if ( c == 0 ) {
     image(tree3, 110, height-tree3.height);
  }
  if ( d == 0 ) {
     image(tree2, 150, height-tree2.height);
  }
  if ( e == 0 ) {
     image(tree4, 240, height-tree4.height);
  }
  if ( f == 0 ) {
     image(tree4, 320, height-tree4.height);
  }
  if ( g == 0 ) {
     image(tree2, 400, height-tree2.height);
  }
  if ( h == 0 ) {
     image(tree3, 500, height-tree3.height);
  }
  if ( i == 0 ) {
     image(tree4, 550, height-tree4.height);
  }
  if ( j == 0 ) {
     image(tree1, 640, height-tree1.height);
  }
  if ( k == 0 ) {
     image(fern1, 420, height-fern1.height);
  }
  if ( l == 0 ) {
     image(fern2, 0, height-fern2.height);
     image(fern2, 125, height-fern2.height);
     image(fern2, 325, height-fern2.height);
     image(flowers2, 0, height-flowers2.height);
     image(flowers1, 70, height-flowers1.height);
     image(flowers2, 150, height-flowers2.height);
     image(flowers1, 250, height-flowers1.height);
     image(flowers2, 350, height-flowers2.height);
     image(flowers1, 300, height-flowers1.height);
  }
 }


class Bird {
  // Bird variables
  float b, c, e, a = random(1,2);
  boolean h = false;
  
  // Bird constructor
  Bird(float tempB, float tempC, float tempE) {
    b = tempB;
    c = tempC;
    e = tempE;
  }
  
  void drawBird() {
    move();
    display();
  }
      
  // Move Bird
  void move() {
    // Move cloud across the screen
    b = b + a;
    
    // Constrain Cloud
    b = constrain(b,-140,width+150);
    if (b > 850) {
      b = -140;
      bird = new Bird(random(-1500,-100),50,-100); 
    }
  }

  
  void display() {
      image(birdbody,b,c);  
      if(e < 20) {
      image(wingsup,b+15,c-15);
      e = e + 1;
    }
    else if (e < 40) {
      image(wingsdown,b+15,c+15);
      e = e + 1;
      }
    else if (e < 60){
      e = 0;
     }
  }
}

class Cloud {
  // Cloud variables
  float x, y, s, a;
  float[][] cloudbits = new float[20][2]; 
  
  // Cloud constructor
  Cloud(float tempX, float tempY, float tempS, float tempA) {
    for(int i = 0; i < 20; i++){  // set up array of cloudbits
     cloudbits[i][0] = x; //  + (i*5) 5 pixels 
     cloudbits[i][1] = y;
    }
    x = tempX;
    y = tempY;
    s = tempS;
    a = tempA;
  }
  
  // Move Cloud
  void move() {
    // Move cloud across the screen
    x = x + speed/a;
    
    // Constrain Cloud
    x = constrain(x,150-width,width+200);
    if (x > 840) {
      x = -150;
    }
    for(int i = 0; i < 20; i++){  // set up array of cloudbits
     cloudbits[i][0] = x+(i*5); //  + (i*5) 5 pixels 
    }
  }
  
  // Display Cloud
    void display  () {
      for(int i = 0; i < 20; i++){
        cloudbits[i][0] = ((cloudbits[i][0]*5) + (x+(i*5)+random(s/3))) /6;
        cloudbits[i][1] = ((cloudbits[i][1]*5) + (y+random(s/5)-s/10)) / 6;        //ellipse(x+random(s)-s/2, y+random(s/5)-s/10, s, s*.8);
        ellipse(cloudbits[i][0],cloudbits[i][1], s, s*.8);
      }
    }
 }

