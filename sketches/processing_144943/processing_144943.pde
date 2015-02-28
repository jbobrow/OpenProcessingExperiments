
int timer = 0;

PImage H;
PImage T;
PImage D;
PImage A;
PImage HTDA;

void setup() {  // this is run once.   

  size(500, 500); 

  H = loadImage("http://i.imgur.com/bT6zfTO.png");
  T = loadImage("http://i.imgur.com/1ra0a6v.png");
  D = loadImage("http://i.imgur.com/HcTVNt2.png");
  A = loadImage("http://i.imgur.com/SwA7RRr.png");
  HTDA = loadImage("http://i.imgur.com/H0zx71k.png");
} 

void draw() {  // this is run repeatedly. 
  timer += 1;
  //println(timer); 

  background(0, 0, 0);

  if (timer != 0 && timer < 200)
  {
    stroke(random(40), random(180), random(255));
    fill(random(52), random(72), random(70));
    quad(random(380), random(310), random(386), random(200), random(369), random(363), random(303), random(376));
    image(H, random(-5, 5), random(-5, 5), 500, 500);
  }
  else if (timer >= 200 && timer < 400) {
    stroke(random(40), random(180), random(255));
    strokeWeight(3);
    fill(random(52), random(72), random(70));
    ellipse(random(380), random(310), random(386), random(376));
    image(T, random(-5, 5), random(-5, 5), 500, 500);
  }
  else if (timer >= 400 && timer < 600) {
    stroke(random(40), random(180), random(255));
    strokeWeight(3);
    fill(random(52), random(72), random(70));
    rect(random(250, 300), random(250, 300), 50, 50);
    image(D, random(-5, 5), random(-5, 5), 500, 500);
  }
  else if (timer >= 600 && timer < 800) {
    stroke(random(40), random(180), random(255));
    strokeWeight(3);
    fill(random(52), random(72), random(70));
    image(A, random(-5, 5), random(-5, 5), 500, 500);
  }
  else if (timer >= 800 && timer < 1000) {
    stroke(random(40), random(180), random(255));
    strokeWeight(3);
    fill(random(52), random(72), random(70));
    image(H, random(-5, 5), random(-5, 5), 500, 500);
    image(T, random(-5, 5), random(-5, 5), 500, 500);
    image(D, random(-5, 5), random(-5, 5), 500, 500);
    image(A, random(-5, 5), random(-5, 5), 500, 500);
    image(HTDA, random(-5, 5), random(-5, 5), 500, 500);
  }
  else if (timer >= 1000 && timer < 1050) {
    


    stroke(random(40), random(180), random(255));
    strokeWeight(3);
    fill(random(52), random(72), random(70));
    rect(random(250, 300), random(250, 300), 50, 50); 
    image(H, random(-5, 5), random(-5, 5), 500, 500);
    image(T, random(-5, 5), random(-5, 5), 500, 500);
    image(D, random(-5, 5), random(-5, 5), 500, 500);
    image(A, random(-5, 5), random(-5, 5), 500, 500);
  }
  else if (timer >= 1050 && timer < 1100) {
    

    
    stroke(random(40), random(180), random(255));
    strokeWeight(3);
    fill(random(52), random(72), random(70));
    rect(random(250, 300), random(250, 300), 50, 50); 
    image(H, random(-5, 5), random(-5, 5), 500, 500);
    image(T, random(-5, 5), random(-5, 5), 500, 500);
    image(D, random(-5, 5), random(-5, 5), 500, 500);
  }
  else if (timer >= 1100 && timer < 1150) {
    

    
    image(H, random(-5, 5), random(-5, 5), 500, 500);
    image(T, random(-5, 5), random(-5, 5), 500, 500);
  }
  else if (timer >= 1150 && timer < 1200) {
    
    
    
    image(H, random(-5, 5), random(-5, 5), 500, 500);
  }
  else {
    ellipse(50, 50, 50, 50);
  }
  if (timer >= 1200)
  {
    timer = 0;
  }
}



