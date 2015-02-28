
//Written by Jonathan Chemla
//Please contact me for non-private use
// jos.chemla@gmail.com ;)

final int WIDTH = 800;
final int HEIGHT = 600;
color backg = color(200);

Ball[] balls;
Ball ball;
PVector[] lim = new PVector[2];
int clics;

void setup()
{
  size(800, 600);
  smooth();
  frameRate(60);
  ellipseMode(CENTER);
  background(backg);
  
  lim[0] = new PVector(-10, -1); lim[1] = new PVector(10, 5);
  ball = new Ball(4000, new PVector(0.5, 2), new PVector(0.01 , 0.01)); //new PVector(random(-0.05, 0.05), random(-0.05, 0.05)));
  balls = new Ball[1];
  balls[0] = ball;
  clics = 0;
}

void draw()
{
  //background(backg);
  noStroke(); fill(200, 30);
  rect(0, 0, 2*WIDTH, 2*HEIGHT);
  for (int i = 0; i < balls.length; i++) 
  {
    balls[i].actualise();
    balls[i].dessine();
  }
}

void mouseClicked()
{
  if (mouseButton == LEFT)  {int n_balls = balls.length; for (int j = 0; j < n_balls; j++) {balls[j].explose(); println("explosion de "+j);}}
  if (mouseButton == RIGHT) {background(backg); balls = new Ball[1]; balls[0] = ball;}
}
void keyPressed()
{
  if (keyCode == ENTER) {saveFrame();}
}

float dt = 1;

class Ball //Particle
{
  PVector pos;  //(~10m)
  PVector vit;  //(~10m/s = 36km/h)
  PVector acc;
  
  float mass;      //(~100g);
  float ray;
  float ray_ecran;
  boolean explosee;
  color c1;
  PVector pos_p;

  Ball (float masse,
        PVector pos_i,
        PVector vit_i,
        PVector acc_i)
  {
    mass = masse;
    pos = pos_i;
    vit = vit_i;
    acc = acc_i;
    
    //ray_ecran = (int) (mass/100.0);
    ray = mass/1000.0;
    ray_ecran = abs(map(ray, 0, lim[1].x, 0, WIDTH/2.0));
    explosee = false;
    c1 = color(255);
    pos_p = pos_i;
  }
  
  Ball (float masse,
        PVector pos_i,
        PVector vit_i)
  {
    this (masse, pos_i, vit_i, new PVector(0, 0));
  }
  
  void dessine()
  {
    //if (!explosee) 
    {
      PVector pos_ecran = new PVector(map(pos.x, lim[0].x, lim[1].x, 0, WIDTH), map(pos.y, lim[0].y, lim[1].y, HEIGHT, 0));
      if (ray_ecran <= 0.5) {ray_ecran = 0.5;}
      //noStroke(); fill(backg); ellipse(map(pos_p.x, lim[0].x, lim[1].x, 0, WIDTH), map(pos_p.y, lim[0].y, lim[1].y, HEIGHT, 0), 2*ray, 2*ray);
      stroke(0); fill(c1);
      ellipse(pos_ecran.x, pos_ecran.y, 2*ray_ecran, 2*ray_ecran);
    }
  }
  
  void actualise()
  {
    //Aléa
    float beta = atan2(vit.y, vit.x);
    float alph = random(-PI/16.0, PI/16.0);
    float norme = sqrt(sq(vit.x)+sq(vit.y));
    vit = new PVector(norme*cos(beta+alph), norme*sin(beta+alph));
    
    //Rebond
    //if ((pos.x + ray/2.0 >= lim[1].x)||(pos.x - ray/2.0 <= lim[0].x)) {vit.x *= -1;}
    //if ((pos.y + ray/2.0 >= lim[1].y)||(pos.y - ray/2.0 <= lim[0].y)) {vit.y *= -1;}
    //pos_p = pos;
    if ((map(pos.x, lim[0].x, lim[1].x, 0, WIDTH) + ray_ecran >= WIDTH)||(map(pos.x, lim[0].x, lim[1].x, 0, WIDTH) - ray_ecran <= 0))    {vit.x *= -1;}
    if ((map(pos.y, lim[0].y, lim[1].y, HEIGHT, 0) + ray_ecran >= HEIGHT)||(map(pos.y, lim[0].y, lim[1].y, HEIGHT, 0) - ray_ecran <= 0)) {vit.y *= -1;}
    
    //F° vitales
    vit = PVector.add(vit, PVector.mult(acc, dt));
    pos = PVector.add(pos, PVector.mult(vit, dt));
  }

  void explose()
  {
    if (!explosee) //A mettre en commentaire aussi :)
    {
      explosee = true;
      int Nfragments = (int) random(4, 8);
      for (int i = 0; i < Nfragments; i++)
      {
        PVector pos_fragment = pos;
        PVector vit_fragment = new PVector(random(-0.1/sqrt(2), 0.1/sqrt(2)), random(-0.1/sqrt(2), 0.1/sqrt(2))); //0,1m/s environ de moyenne att valeurs réelles / norme(vit) = comp*sqrt(2) --> si on v a 10m/s, on a comp v = v/sqrt(2)
        PVector acc_fragment = new PVector(0, 0);         //(~10g = 10m/s² pour l'accelerat° générée par le champ de pesanteur terrestre)
        float delta = mass/10;
        int masse_fragment = (int) random(mass/Nfragments - delta/2.0, mass/Nfragments + delta/2.0);
        
        balls = (Ball[])append(balls, new Ball (masse_fragment, pos_fragment, vit_fragment, acc_fragment));
        println("taille = "+balls.length);
      }
    }
  }
}
