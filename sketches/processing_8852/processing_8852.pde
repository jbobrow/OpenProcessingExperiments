
//Written by Jonathan Chemla
//Please contact me for non-private use ;)
//jos.chemla@gmail.com

class Triangl
{
  //---Triangles Equilateraux, positionnables et orientables---\\
  PVector pos;
  float h;
  float ori;
  
  boolean respire;
  float rd; //variable alÃ©atoire, pour random
  float amp;
  
  color trait = color(0);
  color surb = color(255);
  color rempl = color(brightness(surb), 50);
  
  /*Par dÃ©faut*/
  Triangl () {
               pos = new PVector(300,300);
               h = 100;
               ori = PI;
               
               rd = random(0,PI);
               amp = random(0,5);
             }
  
  Triangl (PVector pos_i, //i pour initiale
           float h_i,      
           float ori_i)
  {pos = pos_i;
   h = h_i;
   ori = ori_i;
   
   rd = random(0,PI);
   amp = random(0,5);}
  
  float cote() 
    {return((float)(2*h/(sqrt(3))));}
    
  void affiche()
  {
    translate(pos.x, pos.y);
    rotate(ori);
    stroke(trait);
    fill(rempl);
    if (isSelected() == true) {fill(surb);}
    ellipseMode(CENTER);
    
    //Dessiner le triangle
    beginShape();
    vertex (-(int)(cote()/2.0), (int)(-1.0/3.0*h));
    vertex (+(int)(cote()/2.0), (int)(-1.0/3.0*h));
    vertex (0, (int)(+2/3.0*h));
    endShape(CLOSE);
    ellipse(0,0, 2/3.0*h, 2/3.0*h);
    //triangle(-(int)(cote()/2.0), (int)(-1.0/3.0*h), +(int)(cote()/2.0), (int)(-1.0/3.0*h), 0, (int)(+2/3.0*h));
    
    rotate(-ori);
    translate(-pos.x, -pos.y);
  }
   
  boolean isSelected()
    {return((sq(mouseX-pos.x)+sq(mouseY-pos.y))<sq(1/3.0*h));}
  
  void respire()
    {if (respire) {h += amp*cos((frameCount/4)+rd);}}
}

int Nmax = 10;
Triangl[] trois = new Triangl[Nmax];
Triangl defaut;
color backg = color(200);
int i_cur = 0; //Compteur courant du nombre de triangles Ã  gÃ©rer

void setup()
{
  size(1024, 740); //P2D?
  frameRate(100);
  smooth();
  background(backg);
  
  defaut = new Triangl(new PVector(100,100), 100, PI);
  
  for (int i = 0; i < Nmax; i++) {trois[i] = new Triangl();}

  trois[0] = new Triangl(defaut.pos, defaut.h, defaut.ori);
  trois[0].affiche();
}

void draw()
{
  background(backg);
  for (int i = 0; i < i_cur+1; i++)
    {
      trois[i].affiche(); 
      trois[i].respire();
      //if (trois[i].isSelected()) {trois[i].h += 30;}
    }
}

void mouseDragged()
{
  for (int i = 0; i < i_cur+1; i++)
    {if (trois[i].isSelected()) {trois[i].pos = new PVector(trois[i].pos.x+(mouseX-pmouseX), trois[i].pos.y+(mouseY-pmouseY));}}
}

void mousePressed()
{
  if ((mouseButton == RIGHT)&&(i_cur < Nmax-1)) 
  {
    i_cur ++;
    trois[i_cur].pos = new PVector(defaut.pos.x, defaut.pos.y+50*i_cur); //new PVector(mouseX, mouseY);
    trois[i_cur].h = defaut.h ;
    trois[i_cur].ori = defaut.ori;
  }
}

void keyPressed()
{
  for (int i = 0; i < i_cur+1; i++)
    {
      if (trois[i].isSelected()) 
      {
        if (keyCode == LEFT)  {trois[i].ori -= PI/12;}
        if (keyCode == RIGHT) {trois[i].ori += PI/12;}
        if (keyCode == UP)    {trois[i].h += 10;}
        if (keyCode == DOWN)  {trois[i].h -= 10;}
        if (key == 'r')       {trois[i].respire = !(trois[i].respire);}
        
      }
    }
  if (keyCode == ENTER) 
  {
    for (int i = 0; i < i_cur+1; i++)
      {if ((i>=0)&&(i<11))  {trois[i].pos = new PVector(75*(i+1), 100);}
       if ((i>=11)&&(i<11)) {trois[i].pos = new PVector(75*((i-6)+1), 250);}
       trois[i].ori = PI;}

  }
}



