
Cloud cloud1;
Cloud cloud2;
Bird bird1;
Bird bird2;
Bird bird3;
Bird bird4;
Bird bird5;
Bird bird6;
Bird bird7;
Bird bird8;
Bird bird10;
Bird bird9;
float speed = 1;
float fly = 1;
PImage birdbody, wingsdown, wingsup, seed, grass, tree1, tree2, tree3, flowers1, flowers2, fern, fern2, sydney;
   
void setup() {
  size(640,740);
  fill(255, 170);
  noStroke();
  smooth();
  cloud1 = new Cloud(0, 75, 100, random(1,3));
  cloud2 = new Cloud(250, 150, 75, random(1,3));
  // x position, y position, frame count for wings, bird seed position, drop position
  bird1 = new Bird(random(-1500,-100),25,0,-100,250); 
  bird2 = new Bird(random(-1500,-100),50,1,-100,75); 
  bird3 = new Bird(random(-1500,-100),25,2,-100,175); 
  bird4 = new Bird(random(-1500,-100),100,3,-100,225); 
  bird5 = new Bird(random(-1500,-100),75,1,-100,400); 
  bird6 = new Bird(random(-1500,-100),100,2,-100,-15); 
  bird7 = new Bird(random(-1500,-100),50,5,-100,25); 
  bird8 = new Bird(random(-1500,-100),75,4,-100,450); 
  bird10 = new Bird(random(-200,-100),150,5,-100,300); 
  bird9 = new Bird(-2400,150,6,-100,135); 
  birdbody = loadImage("birdbody.png");
  wingsup = loadImage("wingsup.png");
  wingsdown = loadImage("wingsdown.png");
  seed = loadImage("seed.png");
  grass = loadImage("grass.png");
  tree1 = loadImage("tree1.png");
  tree2 = loadImage("tree2.png");
  tree3 = loadImage("tree3.png");
  flowers1 = loadImage("flowers1.png");
  flowers2 = loadImage("flowers2.png");
  fern = loadImage("fern.png");
  fern2 = loadImage("fern2.png");
  sydney = loadImage("sydney.png");
  }

void draw() {
  background(190, 235, 256);
  fill(255,100);
  cloud1.move();
  cloud1.display();
  cloud2.move();
  cloud2.display();
  drawBirds();
  image(grass,0,height-grass.height);
 }
 
 void drawBirds() {
  bird1.drawBird();
  bird2.drawBird();
  bird3.drawBird();
  bird4.drawBird();
  bird5.drawBird();
  bird6.drawBird();
  bird7.drawBird();
  bird8.drawBird();
  bird10.drawBird();
  bird9.drawBird();
 }
 
class Bird {
  // Bird variables
  float b, c, d, e, g, f=15, t=-1,a = random(1,2), i = 0;
  boolean h = false;
  
  // Bird constructor
  Bird(float tempB, float tempC, float tempD, float tempE, float tempG) {
    b = tempB;
    c = tempC;
    d = tempD;
    e = tempE;
    g = tempG;
  }
  
  void drawBird() {
    move();
    display();
    dropseed();
    growtree();
  }
      
  // Move Bird
  void move() {
    // Move cloud across the screen
    b = b + a;
  }
  
  void display() {
      image(birdbody,b,c);  
      if(e < 20) {
      image(wingsup,b+20,c-20);
      e = e + 1;
    }
    else if (e < 40) {
      image(wingsdown,b+20,c+20);
      e = e + 1;
      }
    else if (e < 60){
      e = 0;
     }
  }
  
  void dropseed() {
    if (b < g) {
      image(seed,b+85,c+f);
    }  
    else {
      f = f + 2;
      image(seed,g+85,c+f);
     }
  }
  
  void growtree() {
    if (f >= 780 && d == 0) {
      f = 780;
      image(tree1,g-85,height-tree1.height);
     }
    else if (f >= 780 && d == 1) {
      f = 780;
      image(tree2,g-85,height-tree2.height);
    }
    else if (f >= 780 && d == 2) {
      f = 780;
      image(tree3,g-85,height-tree3.height);
    }
     else if (f >= 780 && d == 3) {
      f = 780;
      image(flowers1,g-85,height-flowers1.height);
    }
     else if (f >= 780 && d == 4) {
      f = 780;
      image(fern,g-85,height-fern.height);
    }
      else if (f >= 780 && d == 5) {
      f = 780;
      image(fern2,g-85,height-fern2.height);
    }
      else if (f >= 780 && d == 6) {
      f = 780;
      image(flowers2,g-85,height-flowers2.height);
      h = true;
    }
    if ( h == true) {
      i = i + 1;    
      fill(190, 235, 256,i);
      rect(0,200,width,600);
      }
      if ( i >= 300) {
      i = i + 1;
      tint(255,i-300);
      image(sydney,0,height-sydney.height);
      }  
      if ( i >= 900) {
      i = i + 1;
      fill(190, 235, 256,i-900);
      rect(0,200,width,600);
      }
      if ( i >= 1200) {
        tint(255,255);
        setup();
        
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
    x = constrain(x,-140,width+150);
    if (x > 740) {
      x = -140;
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


