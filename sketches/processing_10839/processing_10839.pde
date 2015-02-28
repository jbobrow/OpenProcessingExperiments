
int mode;

int WIDTH = 800;
int HEIGHT = 800;
import processing.opengl.*;

int col, lig;
int pas;
int imax;
int jmax;
int tay_i, ampl;

void setup()
{
  size(WIDTH, HEIGHT, OPENGL);
  smooth();
  
  mode = 1;
  pas = 50;
  ray = 800;
  teta = 0;
  tay_i = 150;
  ampl = 10;

  camera(WIDTH/2, HEIGHT/2, 1000,     WIDTH/2, HEIGHT/2, 00,       0, 01, 00);
  init_grille();
  for(int i = 0; i < imax; i++)
  {
    for(int j = jmax-1; j >= 0; j--)
      {tabl[i][j] = 0; tay[i][j] = 100;} //{tabl[i][j] = (int)random(0, 1.8);}
  }
  //SAUVEGARDE
  //-----------------------------
  trace_grille();
  epicen = new ArrayList();
  println(imax + ", " + jmax + ", " + pas + ", ");
}

void keyPressed()
{
  if (key == 'm') {mode = mode + 1;}
  if (key == 'l') {mode = mode - 1;}
  
  if (mode > 3) {mode = 0;}
  if (mode < 0) {mode = 3;}
  println("mode : " + mode);
  
  if (key == 'p') {pas += 2;}
  if ((key == 'o')&&(pas > 2)) {pas -= 2;}
  //init_grille();
  
  if (key == 'w') {ampl --;}
  if (key == 'x') {ampl ++;}
  if (key == 'b') {tay_i --;}
  if (key == 'n') {tay_i ++;}
  
  if (key == 's') {export_grille();}
  
  if (keyCode == ENTER) {saveFrame();}
}

void draw()
{
  switch(mode)
  {
    case 0:
    camera(WIDTH/2, HEIGHT/2, 1000,     WIDTH/2, HEIGHT/2, 00,       0, 01, 00);
    trace_grille();
    break;
    
    case 1:
    edit_grille();
    break;
    
    case 2:
    mouv_grille();
    edit_tay();
    break;
    
    case 3:
    mouv_grille2();
    edit_tay();
    break;
    
    default:
    break;
  }
}

int[][] tabl;
void init_grille()
{
  imax = (int)(WIDTH/pas);
  jmax = (int)(HEIGHT/pas);
  
  tabl = new int[imax][jmax];
  tay = new int[imax][jmax];
}

void trace_grille()
{
  background(0);
  stroke(255);
  for(int i = 0; i < imax; i++)
  {
    for(int j = jmax-1; j >= 0; j--)
    {
      if (tabl[i][j] == 0) {fill(0);}
      if (tabl[i][j] == 1) {fill(255);}
      if (tabl[i][j] == 2) {fill(50, 150, 250);}
      rect(i*pas, j*pas, pas, pas);
    }
  }
}

void edit_grille()
{
  camera(WIDTH/2, HEIGHT/2, 700,     WIDTH/2, HEIGHT/2, 00,       0, 01, 00);
  trace_grille();
  int i = (int)mouseX/pas;
  int j = (int)mouseY/pas;
  if (mousePressed) 
  {
    if (mouseButton == LEFT) {tabl[i][j] = 1;}
    if (mouseButton == RIGHT) {tabl[i][j] = 0;}
  }
  if ((keyPressed)&&(key == 'a')) {tabl[i][j] = 2;
                                   epicen.add(new PVector(i, j));}
}

int ray;
float teta;
int[][] tay;
void mouv_grille()
{
  background(0);
  float dplcmt_x = map(mouseX, 0, WIDTH,  -0.05, +0.05);
  teta += dplcmt_x;
  camera(WIDTH/2 + ray*cos(teta), HEIGHT/2 + ray*sin(teta), 1000,     WIDTH/2, HEIGHT/2, 00,       00, 00, -01);
  
  for(int i = 0; i < imax; i++)
  {
    for(int j = jmax-1; j >= 0; j--)
    {
      if (tabl[i][j] != 0)
      {
        stroke(255);
        beginShape();
        vertex(i*pas + pas/2, j*pas + pas/2, 0);
        vertex(i*pas + pas/2, j*pas + pas/2, tay[i][j]);
        endShape();
      }
    }
  }
}

void mouv_grille2()
{
  background(0);
  float dplcmt_x = map(mouseX, 0, WIDTH,  -0.05, +0.05);
  teta += dplcmt_x;
  camera(WIDTH/2 + ray*cos(teta), HEIGHT/2 + ray*sin(teta), 1000,     WIDTH/2, HEIGHT/2, 00,       00, 00, -01);
  
  for(int i = 0; i < imax; i++)
  {
    for(int j = jmax-1; j >= 0; j--)
    {
      stroke(255);
      if (tabl[i][j] != 0) {cube(i, j);}
    }
  }
}

ArrayList epicen;
void edit_tay()
{
  for(int i = 0; i < imax; i++)
  {
    for(int j = jmax-1; j >= 0; j--)
    {
      tay[i][j] = tay_i;
      for (int k = 0; k < epicen.size(); k++)
        {tay[i][j] += ampl*sin(sqrt(sq((i - ((PVector)epicen.get(k)).x)*pas) + sq((j - ((PVector)epicen.get(k)).y)*pas))/pas - frameCount/20.0);}
    }
  }
}

void cube(int i, int j)
{
  stroke(0);
  fill(255);
  beginShape();
  vertex(i*pas, j*pas, 0); vertex(i*pas, (j+1)*pas, 0); vertex((i+1)*pas, (j+1)*pas, 0); vertex((i+1)*pas, j*pas, 0);
  endShape(CLOSE);
  beginShape();
  vertex(i*pas, j*pas, tay[i][j]); vertex(i*pas, (j+1)*pas, tay[i][j]); vertex((i+1)*pas, (j+1)*pas, tay[i][j]); vertex((i+1)*pas, j*pas, tay[i][j]);
  endShape(CLOSE);
  beginShape();
  vertex(i*pas, j*pas, 0); vertex(i*pas, (j+1)*pas, 0); vertex(i*pas, (j+1)*pas, tay[i][j]); vertex(i*pas, j*pas, tay[i][j]);
  endShape(CLOSE);
  beginShape();
  vertex(i*pas, j*pas, 0); vertex((i+1)*pas, j*pas, 0); vertex((i+1)*pas, j*pas, tay[i][j]); vertex(i*pas, j*pas, tay[i][j]);
  endShape(CLOSE);
  beginShape();
  vertex((i+1)*pas, (j+1)*pas, 0); vertex(i*pas, (j+1)*pas, 0); vertex(i*pas, (j+1)*pas, tay[i][j]); vertex((i+1)*pas, (j+1)*pas, tay[i][j]);
  endShape(CLOSE);
  beginShape();
  vertex((i+1)*pas, (j+1)*pas, 0); vertex((i+1)*pas, j*pas, 0); vertex((i+1)*pas, j*pas, tay[i][j]); vertex((i+1)*pas, (j+1)*pas, tay[i][j]);
  endShape(CLOSE);
}

void export_grille()
{
  PrintWriter out;
  out = createWriter("grille.txt");
  out.print("grille = { ");
  for(int i = 0; i < imax; i++)
  {
    out.print("{");
    for(int j = 0; j < jmax-1; j++)
    {
      out.print(tabl[i][j] + ", ");
    }
    out.print(tabl[i][jmax-1] + "}" + '\n');
  }
  out.print("};" + '\n');
  
  out.flush();
  out.close();
  
  println("grille_exportee");
  
  //Export pour lecture auto.
  PrintWriter out_auto;
  out_auto = createWriter("grille_auto.txt");
  for(int i = 0; i < imax; i++)
  {
    for(int j = 0; j < jmax-1; j++)
    {
      out_auto.print(tabl[i][j] + " ");
    }
    out_auto.println();
  }
  
  out_auto.flush();
  out_auto.close();
  
  println("grille_auto_exportee");
}

