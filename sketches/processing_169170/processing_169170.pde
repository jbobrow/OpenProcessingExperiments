
float y = 0;
float x= 0;
float speedx = 2;
float speedy = 2;
PImage wow ;
PImage Keule;
int score;
PFont f;
PFont g;
int timer = 60;

void setup() {
  size (500, 500);
  noStroke();
  f = createFont( "Arial", 50, true);
  g = createFont ( "Arial", 25, true);
  wow = loadImage ("https://pbs.twimg.com/profile_images/378800000822867536/3f5a00acf72df93528b6bb7cd0a4fd0c.jpeg");
  Keule = loadImage ("https://fbcdn-sphotos-f-a.akamaihd.net/hphotos-ak-xap1/v/t1.0-9/s720x720/10415550_10152361204482105_8389107320360689817_n.jpg?oh=7796904b4748d9f4809f3ac033b35d22&oe=54F8C677&__gda__=1424959436_a9135d2e3bc3d22340b093f0ce41b2c8");
}


void draw() {
  background (0);
  imageMode(CENTER);
  image ( Keule, width/2, height/2);
  
  rectMode(CENTER);
  // && == UND
  // || == Oder
  x= x+ speedx;
  y= y+ speedy;

  rect (0+5, height/3, 10, 10);
  rect (0+5, height*2/3, 10, 10);
  fill (#587434) ;
  ellipse (x, y, 20, 20);
  fill (#3E0712);
  rect (mouseX, mouseY, 50, 100);

  if (x >  mouseX - 25 && (y > mouseY-50 && y < mouseY + 50)) {
    speedx = -5;
  }

  if (x >  mouseX + 25 && (y > mouseY-50 && y < mouseY + 50)) {
    speedx = 5;
  }

  if (x > width -10) {
    speedx =-5;
  }

  if (x < 10 ) {
    speedx = 10;
  }
  if (y > height -10) {
    speedy =-5;
  }

  if ( y < 10) {
    speedy = 10;
  }
  if (x <= 10 && ( y > height/3 && y < height * 2/3)) { 
     score++;
    timer = 0;
  }
  timer = timer + 1;
  if(timer < 60){
    background ( random(255), random(50),0);
    imageMode(CENTER);
    image ( wow, 250, 250);
    fill(255);
    textFont(f);
    text ( "MUCH SKILL", 250, 350);
     text ( "SUCH PONG", 250, 450);
    
   
    
  }
  textFont(g);
  fill (255);
  textAlign(CENTER);
  text("Score = "+score, width/2, 60); 
  println("x: " + x + " timer:" + timer);
}
