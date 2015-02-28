
//Written by Jonathan Chemla
//Please contact me for non-private use
// jos.chemla@gmail.com ;)


final int WIDTH = 800;
final int HEIGHT = 600;
color backg = color(00);
int FrameRate = 60;

ArrayList balls;
Ball ball_defaut;
PVector[] lim = new PVector[2];
color[] rgb = {color(200, 0, 50), color(0, 120, 200), color(0, 5, 230), color(0, 230, 160), color(80, 160, 90), color(250, 230, 50)};
int clics;

void setup()
{
size(WIDTH, HEIGHT);
smooth();
frameRate(FrameRate);
background(backg);

lim[0] = new PVector(-750, -1); lim[1] = new PVector(750, 1000);
ball_defaut = new Ball(4000, new PVector(0, 0), new PVector(0 , 10), -1, color(200, 0, 50));
balls = new ArrayList();
balls.add(new Ball(4000, new PVector(0, 0), new PVector(0 , 10), -1, color(200, 0, 50))); //ball_defaut);
clics = 0;
}

void draw()
{
noStroke(); fill(00, 10);
rect(0, 0, 2*WIDTH, 2*HEIGHT);

for (int i = 0; i < balls.size(); i++)
{
Ball ball = (Ball) balls.get(i);
ball.actualise();
ball.dessine();
}

//Rajout durée de vie de la particule;
for (int i = 0; i < balls.size(); i++)
{
Ball ball = (Ball) balls.get(i);
if (frameCount > ball.date_mort)
{
if (ball.niveau < 2) {ball.explose();}
balls.remove(i);
}
}
}

void mouseClicked()
{
if (mouseButton == LEFT)
{
float beta = random(PI/2.0 - PI/32.0, PI/2.0 + PI/32.0);
color rgb1 = rgb[(int)random(0, rgb.length)];
Ball b_tiree = new Ball(4000, new PVector(map(mouseX, 0, WIDTH, lim[0].x, lim[1].x), map(mouseY, HEIGHT, 0, lim[0].y, lim[1].y)), new PVector(10*cos(beta) , 10*sin(beta)), -1, rgb1); //ball_defaut;
balls.add(b_tiree);
}
if (mouseButton == RIGHT) {background(backg); balls.clear(); balls.add(new Ball(4000, new PVector(0, 0), new PVector(0 , 10), -1, color(200, 0, 50)));} //ball_defaut);}
}
void keyPressed()
{
if (keyCode == ENTER) {saveFrame();}
}

class Ball //Particle
{
PVector pos; //(~10m)
PVector vit; //(~10m/s = 36km/h)
PVector acc; //(~10g)

float mass; //(~100g);
float ray;
float ray_ecran;
float dt;
color rgb;

int date_naissance;
int date_mort;
int niveau;
boolean explosee;

Ball (float masse,
PVector pos_i,
PVector vit_i,
PVector acc_i,
int niveau_parent,
color couleur)
{
mass = masse;
pos = pos_i;
vit = vit_i;
acc = acc_i;

ray = mass/1000.0;
ray_ecran = abs(map(ray, 0, lim[1].x, 0, WIDTH/2.0));
dt = 1;
rgb = color(255, 0, 100);

niveau = niveau_parent+1;
date_naissance = frameCount;
date_mort = (int)(date_naissance + FrameRate*(1*niveau+1) - FrameRate/4.0 + random(-FrameRate/2, FrameRate/2));
explosee = false;
rgb = couleur;
}

Ball (float masse,
PVector pos_i,
PVector vit_i,
int niveau_parent,
color couleur)
{
this (masse, pos_i, vit_i, new PVector(0, -0.02), niveau_parent, couleur);
}

void dessine()
{
PVector pos_ecran = new PVector(map(pos.x, lim[0].x, lim[1].x, 0, WIDTH), map(pos.y, lim[0].y, lim[1].y, HEIGHT, 0));
if (ray_ecran == 0) {ray_ecran = 2;}
ellipseMode(CENTER);
noStroke(); fill(rgb);
ellipse(pos_ecran.x, pos_ecran.y, 2*ray_ecran, 2*ray_ecran);
}

void actualise()
{
//Aléa
float beta = atan2(vit.y, vit.x);
float alph = random(-PI/512.0, PI/512.0);
float norme = sqrt(sq(vit.x)+sq(vit.y));
vit = new PVector(norme*cos(beta+alph), norme*sin(beta+alph));

//F° vitales
vit = PVector.add(vit, PVector.mult(acc, dt));
pos = PVector.add(pos, PVector.mult(vit, dt));
}

void explose()
{
explosee = true;
int Nfragments = (int) random(20, 30) - 5*niveau;

float beta = atan2(vit.y, vit.x);
float norme = sqrt(sq(vit.x)+sq(vit.y));

for (int i = 0; i < Nfragments; i++)
{
PVector pos_fragment = pos;
float alph = random(-PI, PI);
PVector vit_fragment = new PVector(norme*cos(beta+alph)/10, norme*sin(beta+alph)/10);
vit_fragment.mult(Nfragments/5);
int masse_fragment = (int) (mass/2.0);
Ball b_inter = new Ball (masse_fragment, pos_fragment, vit_fragment, niveau, rgb);
balls.add(b_inter);
}
}
} 

