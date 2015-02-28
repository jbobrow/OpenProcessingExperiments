
ArrayList Letras = new ArrayList();
char[] letras,letras1,letras2;
int la=30, aba=0, lo=10,div=5,atras=1;
public void setup() {
  //do not change, this is fixed for LED screens.
  size(512, 160); 
  //do not change, this is the refresh rate of LEDs.
  frameRate(8);  
  strokeWeight(20); 
  letras = generar_arbol();
  letras1 = generar_arbol();
  letras2 = generar_arbol();
  Letras.add(letras);
  Letras.add(letras1);
  Letras.add(letras2);
  smooth();

}
 
void draw() {
  background(0); //keep background black (LEDs are brightness based)
  stroke(255,0,0); //LEDs are on the scale of red
  fill(255,0,0);   //LEDs are on the scale of red   
  calcular();
  lo+=atras;

}
void rama(char c, float l)
{
  float ang = random(-.05, .05);
  if (l>3)
    switch(c)
    {
    case 'n':
      strokeWeight(l/div);
      l/=2;
      rotate(ang*.3);
      line(0, 0, 0, -l);
      translate(0, -l);
      break;
    case 'i':
      pushMatrix();
      rotate(-0.8+ang);
      strokeWeight(l/div);
      line(0, 0, 0, -l);
      translate(0, -l, -aba);
      rama('e', l/2);
      //rama('n', l/2);
      rama('d', l/2);
      popMatrix();
      break;
    case 'd':
      pushMatrix();
      rotate(0.3+ang);
      strokeWeight(l/div);
      line(0, 0, 0, -l);
      translate(0, -l, -aba);
      rama('n', l/2);
      rama('d', l/2);
      rama('n', l/2);
      rama('e', l/2);
      rama('o', l/2);
      popMatrix();
      break;
    case 'e':
      pushMatrix();
      rotate(-0.6);
      strokeWeight(l/div);
      line(0, 0, 0, -l);
      translate(0, -l, -aba);
      rama('o', l/2);
      rama('d', l/2);
      rama('e', l/2);
      popMatrix();
      break;
    case 'o':
      pushMatrix();
      rotate(0.8);
      strokeWeight(l/div);
      line(0, 0, 0, -l);
      translate(0, -l, -aba);
      rama('i', l/2);
      rama('d', l/2);
      rama('o', l/2);
      rama('n', l/2);
      rama('e', l/2);
      popMatrix();
      break;
    }
}
void calcular()
{
  if(lo==0||lo>=100)
  {
    atras*=-1;
    if(lo==0)
    {
      Letras.clear();
      letras = generar_arbol();
      letras1 = generar_arbol();
      letras2 = generar_arbol();
      Letras.add(letras);
      Letras.add(letras1);
      Letras.add(letras2);
    }
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
      rama(temp[i], la*0.75);
      la-=4;
    }
    popMatrix();
  }
}
char[] generar_arbol()
{
    int n_ramas = 4;
    char[] temp = new char[n_ramas];
        int switcher = int(random(-0.8,9.9));
        switch(switcher)
        {
            case 0:
                temp[0] = 'n';
                temp[1] = 'd';
                temp[2] = 'n';
                temp[3] = 'e';
            break;
            case 1:
                temp[0] = 'n';
                temp[1] = 'i';
                temp[2] = 'n';
                temp[3] = 'd';
            break;
            case 2:
                temp[0] = 'd';
                temp[1] = 'e';
                temp[2] = 'n';
                temp[3] = 'o';
            break;
            case 3:
                temp[0] = 'o';
                temp[1] = 'n';
                temp[2] = 'i';
                temp[3] = 'd';
            break;
            case 4:
                temp[0] = 'n';
                temp[1] = 'i';
                temp[3] = 'n';
                temp[2] = 'd';
            break;
            case 5:
                temp[0] = 'e';
                temp[1] = 'n';
                temp[2] = 'o';
                temp[3] = 'e';
            break;
            case 6:
                temp[0] = 'n';
                temp[1] = 'n';
                temp[3] = 'i';
                temp[2] = 'o';
            break;
            case 7:
                temp[0] = 'o';
                temp[1] = 'n';
                temp[2] = 'd';
                temp[3] = 'i';
            break;
            case 8:
                temp[0] = 'n';
                temp[1] = 'n';
                temp[3] = 'i';
                temp[2] = 'i';
            break;
            case 9:
                temp[0] = 'o';
                temp[1] = 'n';
                temp[2] = 'd';
                temp[3] = 'i';
            break;
                
      
    }
    return temp;
}               
