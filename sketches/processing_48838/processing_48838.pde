
ArrayList Letras = new ArrayList();
char[] letras = {  'n', 'i', 'o', 'n', 'd', 'n', 'n', 'i', 'o', 'n', 'e'};
char[] letras1 = { 'n', 'd', 'e'};
char[] letras2 = {'n', 'n', 'n', 'e', 'd', 'n', 'd', 'i', 'n', 'd', 'i'};
char[] letras3 = {'n', 'e', 'n', 'n', 'd', 'i'};
color[] col;
int la=30, aba=0, lo=10;
void setup()
{
  size(450, 450, P3D);
  stroke(0, 0, 90);
  strokeWeight(20);
  background(0);
  Letras.add(letras3);
  //Letras.add(letras1);
  //Letras.add(letras2);
  //Letras.add(letras3);
  col = new color[Letras.size()];
  smooth();
  lights();
  for (int i=0;i<Letras.size();i++)
    col[i] = color(random(255), random(255), random(255));
}
void draw()
{
  if (frameCount%2==0)
  {
    calcular();
    lo++;
  }
}
void rama(char c, float l, color co)
{
  stroke(255, 100);
  float ang = random(-.1, .1);
  if (l>5)
    switch(c)
    {
    case 'n':
      strokeWeight(l/5);
      rotate(ang*.3);
      line(0, 0, 0, -l);
      translate(0, -l);
      break;
    case 'i':
      pushMatrix();
      rotate(-0.8+ang);
      strokeWeight(l/10);
      l=l/2;
      line(0, 0, 0, -l);
      translate(0, -l, -aba);
      rama('i', l/2, co);
      rama('o', l/2, co);
      rama('n', l/2, co);
      rama('d', l/2, co);
      rama('n', l/2, co);
      popMatrix();
      break;
    case 'd':
      pushMatrix();
      rotate(0.3+ang);
      strokeWeight(l/5);
      line(0, 0, 0, -l);
      translate(0, -l, -aba);
      rama('n', l/2, co);
      rama('n', l/2, co);
      rama('d', l/2, co);
      rama('n', l/2, co);
      rama('e', l*0.75, co);
      rama('o', l/2, co);
      popMatrix();
      break;
    case 'e':
      pushMatrix();
      rotate(-0.6);
      strokeWeight(l/5);
      line(0, 0, 0, -l);
      translate(0, -l, -aba);
      rama('i', l, co);
      rama('d', l/2, co);
      rama('e', l/2, co);
      popMatrix();
      break;
    case 'o':
      pushMatrix();
      rotate(0.6);
      strokeWeight(l/5);
      line(0, 0, 0, -l);
      translate(0, -l, -aba);
      rama('i', l, co);
      rama('d', l/2, co);
      rama('o', l/3, co);
      rama('n', l/2, co);
      rama('e', l/2, co);
      popMatrix();
      break;
    }
  else
    if (l>2)
    {
      noStroke();
      fill(co, 50);
      ellipse(0, 0, l*8, l*5);
    }
}
void mouseReleased()
{
  lo=0;
  calcular();
}
void calcular()
{
  if(lo==0||lo>=150)
  {
    for (int i=0;i<Letras.size();i++)
      col[i] = color(random(255), random(255), random(255));
    if(lo>=150)
      lo=0;
  }
  background(0);
  for (int j=0;j<Letras.size();j++)
  {
    pushMatrix();
    translate((j+1)*width/(Letras.size()+1), height);
    char[] temp = (char[])Letras.get(j);
    la = lo;
    for (int i=0;i<temp.length;i++)
    {
      rama(temp[i], la*0.75, col[j]);
      la-=20;
    }
    popMatrix();
  }
}

