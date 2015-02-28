
void setup()
{
  size(500, 500);
  smooth();
}
 
void draw()
{
  background(0);
  Ciclo co = new Ciclo("ea", 9, 1);
}
 
class Ciclo
{
  //Initialization
  String w = "";
  //The variables used the transformation
  
  String p1a = "a", p1b = "eb";
  String p2a = "e", p2b = "da";
  String p3a = "b", p3b = "a";
  String p4a = "d", p4b = "e";
  //g0 is the current postion, g1 is the final postion.
  String g0, g1 = "";
  int n, l;
  //Variables for design:
  int posX, posY; float posG;
  int lung; float grad;
   
  Ciclo(String _w, int _n, int _l)
  {
    w = _w; n = _n; l = _l;
    //The initiator for the primary(current) postion is w.
    g0 = w;
    posX = mouseX; //width / 2;
    posY = height / 2;
    posG = 0;
     
    //This circle is completed in the desired number of times given by the variable n.
    for (int i= 0; i < n; i++)
    {
      lung = 15; //int(map(abs(mouseX - (width / 2)), 0, width / 2, 10, 50));
      grad = map(mouseY, 0, height, 125, 55);
      
      stringa();
    }
  }
   
  private void stringa()
  {
    //Current Postion is g0.
    //i represents the number of iterations required.
    for (int i = 0; i <= g0.length() - l; i = i + l)
    {
     
      //string (s) to the point defined by the length of the desired segment (i + l).
      String c = g0.substring(i, i + l);
      //Here transformations take place based on the variables pN * to create the next postion.
      if (c.equals(p1a) == true)
      {
        g1 = g1 + p1b;
        linea(lung, true, grad);
      }
      else if (c.equals(p2a) == true)
      {
        g1 = g1 + p2b;
        linea(lung, true, grad);
      }
      else if (c.equals(p3a) == true)
      {
        g1 = g1 + p3b;
        linea(lung, false, grad);
      }
      else if (c.equals(p4a) == true)
      {
        g1 = g1 + p4b;
        linea(lung, false, grad);
      }
    }
    //println(g0);
    //The new position becomes old, and reset g1 to repeat the cycle.
    g0 = g1;
    g1 = "";
  }
   
  private void linea(int lunghezza, boolean destra, float gradi)
  {
    if (destra == false)
    {
      gradi = 360 - gradi;
    }
    float nposG = posG + gradi;
    int nposX = posX + int((cos(radians(nposG))) * lunghezza);
    int nposY = posY + int((sin(radians(nposG))) * lunghezza);
    stroke(0x80558877); strokeWeight(6);
    line(posX, posY, nposX, nposY);
    posX = nposX;
    posY = nposY;
    posG = nposG;
  }
}
