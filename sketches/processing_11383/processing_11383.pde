
int N_el = 50;
Element[] elements;
int Ray = 100;

void setup()
{
  size(600, 600);
  frameRate(200);
  smooth();
  
  elements = new Element[N_el];
  for (int i = 0; i < N_el; i++)
    {elements[i] = new Element();}
}

void draw()
{
  background(0);
  for (int i = 0; i < N_el; i++)
    {verif_voisins(i);}
  for (int i = 0; i < N_el; i++)
    {elements[i].actu();}
}

void verif_voisins(int i)
{
  for (int j = i+1; j < N_el; j++)
  {
    float dist_ij = sqrt(sq(elements[j].pos.x - elements[i].pos.x) + sq(elements[j].pos.y - elements[i].pos.y));
    if (sq(dist_ij) < sq(Ray)) //and i!=j
    {
      stroke(255, map(dist_ij, 0, Ray, 255, 0));
      line(elements[i].pos.x, elements[i].pos.y, elements[j].pos.x, elements[j].pos.y);
    }
  }
}
  
class Element
{
  PVector pos;
  float ori;
  float vit;
  
  Element(PVector pos_i, float ori_i, float vit_i)
  {
    pos = pos_i;
    ori = ori_i;
    vit = vit_i;
  }
  Element()
  {
    this(new PVector((int)random(0, width), (int)random(0, height)), random(0, TWO_PI), random(3, 3.5));
  }
  
  void actu()
  {
    stroke(255);
    point(pos.x, pos.y);
    
    pos = new PVector(pos.x + vit*cos(ori), pos.y + vit*sin(ori));
    ori += random(-PI/16, PI/16);
    vit += random(-1/100, 1/100);
    
    if (pos.x < 0) {pos.x = width;}
    if (pos.y < 0) {pos.y = height;}
    if (pos.x > width) {pos.x = 0;}
    if (pos.y > height) {pos.y = 0;}
  }
}

void keyPressed()
{
  if (keyCode == ENTER) {saveFrame();}
}

