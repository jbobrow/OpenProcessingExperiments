
//Written By Jonathan Chemla, 
//Please contact me for non-private use ;)
//jos.chemla@gmail.com

/*Qques bonnes configs : Pour Wallpaper
                         Width = 1400;
                         Height = 960;
                         float myray = random(5, 100)
                         Groupe geo = new Groupe(100);
                         
                         Pour Header
                         Width = 1150;
                         Height = 100;
                         float myray = random(5, 40)
                         Groupe geo = new Groupe(100);
*/                     
                     
int Width = 600;
int Height = 600;

class Rond
{
  float ray;
  color co;
  PVector pos;
  PVector vit;
  
  float pas = 1;
  float vmin = -0.3;
  float vmax = 0.3;
  
  Rond(float rayon, 
       color couleur)
  {
    ray = rayon;
    co = couleur;
    
    pos = new PVector(random(0+ray, Width-ray), random(0+ray, Height-ray));
    vit = new PVector(random(vmin, vmax), random(vmin, vmax));
  }

  void actualise()
  {
    if (pos.x <= ray) {vit.x = -vit.x;}
    if (pos.x >= width-(ray)) {vit.x = -vit.x;}
    if (pos.y <= ray) {vit.y = -vit.y;}
    if (pos.y >= height-(ray)) {vit.y = -vit.y;}
    
    change_v();

    pos = PVector.add(pos, PVector.mult(vit, pas));

    
    if (mousePressed == true ) 
    {
      if ((sq(mouseX - pos.x) + sq(mouseY - pos.y) < (sq(ray)) + 100)) 
      {
        pos.x = mouseX; pos.y = mouseY;
        vit.x = (mouseX - pmouseX)/3; vit.y = (mouseY - pmouseY)/3;
      }
    }
  }
  
  void affiche()
  {
    ellipseMode(RADIUS);
    rectMode(CENTER);
    
    noStroke();
    fill(co);
    ellipse(pos.x, pos.y, ray, ray);
    fill(0);
    rect(pos.x, pos.y, ray/10.0, ray/10.0);
  }
  
  void change_v()
  {
    float alp = atan2(vit.y, vit.x);
    float mod = vit.mag();
    float tet = random(-PI/64.0, PI/64.0); 
    
    vit.x = mod * cos(alp + tet);  
    vit.y = mod * sin(alp + tet);
    //print(cos(alp+tet) + ", " + sin(alp+tet) + "\n");
  }
}

class Groupe
{
  int Nmax;
  Rond[] elements;
  
  Groupe(int nb_elements)
  {
    Nmax = nb_elements;
    elements = new Rond[Nmax];
    
    color[] couleurs = {color(20, 50, 200, 100), color(255, 200), color(49, 105, 162, 100), color(78, 128, 180, 100), color(50, 80, 240, 100)};
    for (int i = 0; i < Nmax; i++)
    {
      color myco = couleurs[2];
      float myray = random(5, 40);
      elements[i] = new Rond (myray, myco);
    }
  }
  
  void affiche()
  {  
    for (int i = 0; i < Nmax; i++)
    {
      //fill(255, 100);noStroke();ellipse(elements[i].pos.x, elements[i].pos.y, elements[i].ray, elements[i].ray);
      
      elements[i].actualise();
      elements[i].affiche();
      
      colorMode(RGB); stroke(20, 200, 150, 75); strokeWeight(1);
      line(elements[i % Nmax].pos.x, elements[i % Nmax].pos.y, elements[(i+1) % Nmax].pos.x, elements[(i+1) % Nmax].pos.y);
    }
  }
}

//Written By Jonathan Chemla, 
//Please contact me for non-private use
//jos.chemla@gmail.com

int n_max = 5;

Rond[] part = new Rond[n_max];
color[] backg = {color(200, 10), color(0)};
PImage fond;

Groupe geo = new Groupe(50);

void setup()
{
  size(Width, Height);
  background(backg[1]);
  smooth();
  
  for (int i = 0; i < n_max; i++)
  {
    color myco = color(20, 50, 200, random(70,80));
    float myray = random(10, 40);
    part[i] = new Rond (myray, myco);
  }
  
  //dessiner_fond();
}

void draw()
{
  background(backg[1]); //pas mal Ã  enlever
  //fill(backg[0]); noStroke();
  //rect(0, 0, 2*width, 2*height);
  //image(fond, 0, 0, width, height);
  
  for (int i = 0; i < n_max; i++)
  {
    //part[i].actualise();
    //part[i].affiche();
  }
  
  geo.affiche();
}

void dessiner_fond()
{
  colorMode(HSB, 255);
  for (int i = 0; i < width; i ++)
  {
    for (int j = 0; j < height; j++)
    {
      int etage = 100;
      int range = 50;
      int etageb = 200;
      int rangeb = 50;
      int h = (int)map(i, 10, width, 140, 170);  //(int)map(i, 10, width, 140, 180);
      int s = (int)map(j, 15, height-20, 60, 160);  //(int)map(j, 0, height, 0, 255);
      int b = (int)map(j, 10, height-20, 200, 0);  //(int)map(j, 0, height, 0, 255);
      stroke(h, s, b);
      point(i, j);
    }
  }
  saveFrame("fond.png");
  fond = loadImage("fond.png");
}

void keyPressed()
{
  if (keyCode == ENTER) {saveFrame();}//saveFrame("Img.png");}
}



