
// Variables
float r = 130;
float g = 220;
float b = 240;
float t = 180;
float m = 0;
float m1 = 0;
float blink = 0;

PFont f;
PImage mcg;

ArrayList particles;

void setup()
{
  size(800,720);
  println("Produced by Kye");
  smooth();
  strokeCap(ROUND);
  strokeJoin(BEVEL);
  ellipseMode(CENTER);
  
  particles = new ArrayList();
  
  f = loadFont( "ArialMT-48.vlw" );
  mcg = loadImage("MCG logo.jpg");
}

void particleSnow()
{
  // A new Particle object is added to the ArrayList every cycle through draw().
  particles.add(new Particle()); 

  // Iterate through our ArrayList and get each Particle
  // The ArrayList keeps track of the total number of particles.
  for (int i = 0; i < particles.size(); i++ ) { 
    Particle p = (Particle) particles.get(i);
    p.run();
    p.gravity();
    p.display();
  }

  // If the ArrayList has more than 100 elements in it, we delete the first element, using remove().
  if (particles.size() > 100) {
    particles.remove(0); 
  }
}

void stars()
{
  scale(blink);
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
}
void draw()
{
  //Sky
  background(r,g,b);
  
  //sun
  strokeWeight(2);
  fill(235,155,0);
  ellipse(300,350-m,200,200);
  
  //snow
  fill(255);
  rect(-1,500,810,300);
  
  //moon
  noStroke();
  fill(222,240,0,t);
  ellipse(600,100,80,80);
  
  //stars
  pushMatrix();
  translate(500,200);
  stars();
  popMatrix();
  
  pushMatrix();
  translate(450,150);
  stars();
  popMatrix();
  
  pushMatrix();
  translate(350,250);
  stars();
  popMatrix();
  
  pushMatrix();
  translate(250,150);
  stars();
  popMatrix();
  
  pushMatrix();
  translate(275,50);
  stars();
  popMatrix();
  
  pushMatrix();
  translate(175,70);
  stars();
  popMatrix();

  //Cloud 1
  fill(255,210);
  ellipse(100+m1,150,180,80);
  ellipse(120+m1,130,100,100);
  ellipse(50+m1,130,100,100);
  
  //Cloud 2
  ellipse(400-m1,250,180,80);
  ellipse(420-m1,230,100,100);
  ellipse(350-m1,230,100,100);
  
   //Cloud 3
  ellipse(700-m1,80,180,80);
  ellipse(720-m1,60,100,100);
  ellipse(650-m1,60,100,100); 
  
  //Mountain
  stroke(0);
  strokeWeight(1);
  fill(0,180,0);
  triangle(150,200,0,500,300,500);
  triangle(450,200,300,500,600,500);
  triangle(750,200,600,500,900,500);

  //River
  color(0,0,180);

  //Trees
  strokeWeight(2);
  fill(149,8,8);
  rect(600,300,50,300);
  fill(255);
  triangle(625,300,525,475,725,475);
  triangle(625,250,540,400,710,400);
  triangle(625,200,550,325,700,325);
  triangle(625,150,560,250,690,250);
  
  //Trees decoration
  fill(255,0,0);
  ellipse(625,150,10,10);

  //Snowman Hat
  strokeWeight(4);
  fill(255,0,0);
  triangle(250,300,275,370,300,350);
  
  //Snowman Hands
  fill(0);
  rect(150,475,100,2);
  line(350,475,400,400);
  
  //Snowman Fingers (LEFT)
  line(150,475,125,450);
  line(150,475,120,465);
  line(150,475,130,480);
  
  //Snowman Fingers (RIGHT)
  line(400,400,390,390);
  line(400,400,400,385);
  line(400,400,410,390);

  //Snowman body
  fill(255);
  ellipse(300,400,100,100);
  ellipse(300,525,200,200);

  //Snowman eyes
  fill(0);
  ellipse(275,375,5,5);
  ellipse(325,375,5,5);

  //Snowman mouth
  fill(255);
  arc(300, 400, 40, 30, 0, PI);
  
  //Snowman Noes
  fill(245,130,10);
  strokeWeight(2);
  triangle(300,380,290,400,310,400);

  //Snowman Buttons
  fill(255,255,0);
  ellipse(300,450,8,8);
  ellipse(300,500,8,8);
  ellipse(300,550,8,8);
  
  //display Text
  textFont(f,16); // Step 4: Specify font to be used
  fill(0);        // Step 5: Specify font color
  text("Produced by NIK (2014) - MCG'11", 500, 700);
  
  //display Image
  image(mcg,150,50);
  
  //Flag
  rect(150,50,5,150);
  
  //animation
  blink = blink + 0.01;
  
  if(mouseX > width/2) 
  {
    r = r + 0.5;
    g = g + 0.5;
    b = b + 0.5;
    t = t - 0.5;
    m = m + 0.5;
    m1 = m1 + 0.5;
  }
  
  else 
  {
    r = r - 0.5;
    g = g - 0.5;
    b = b - 0.5;
    t = t + 0.5;
    m = m - 0.5;
    m1 = m1 - 0.5;
  }

  //Reset 
  if (r > 130) {r = 130;} 
  else {  r = 0;  }

  if (m > 250) {m = 250;}
  
  if (blink>0.15) {blink = 0;}
  
  //Snow
  particleSnow();
}






// A simple Particle class
class Particle 
{
  float x;
  float y;
  float xspeed;
  float yspeed;
  
  Particle() {
    x = mouseX;
    y = mouseY;
    xspeed = random(-1,1);
    yspeed = random(-2,0);
  }
  
  void run() 
  {
    x = x + xspeed;
    y = y + yspeed;
  }
  
  void gravity() 
  {
    yspeed += 0.1;
  }
  
  void display() 
  {
    noStroke();
    fill(255);
    ellipse(x,y,10,10);
  }
}


