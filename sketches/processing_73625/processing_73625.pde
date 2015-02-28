
class Mouche {

  float x;
  float y;
  float etatMouche;

  //############################################
  //Constructeur
  //############################################
  Mouche(float x, float y) {
    this.x=x;
    this.y=y;
    etatMouche=0;
  }
//#################################################################
  //Declaration d'une methode de la classe
  void moucheVie () {
    
   x = x + random(-5,5);
   y = y + random(-5,5);
   
   if(x>=width-30)
     x=width-30;
   if(x<=30)
     x=30;
   if(y>=height-30)
      y=height-30;
   if(y<=30)
      y=30; 
 
    
    if (etatMouche<=3) 
    {
      fill(255);
      stroke(0);
      strokeWeight(1);
      ellipse(x, y-6, 3, 10);
      ellipse(x, y-6, 3, 9);
      etatMouche++;
    }
    if (etatMouche > 3) 
    {
      fill(255);
      stroke(0);
      strokeWeight(1);
      ellipse(x+5, y-6, 3, 10);
      ellipse(x-5, y-6, 3, 9);
      etatMouche++;
      if (etatMouche == 7)
      {
        etatMouche =0;
      }
    }
    fill(0);
    strokeWeight(3);
    ellipse(x, y, 8, 8);
    strokeWeight(1);
    line(x, y-2, x-10, y+3);
    line(x, y-2, x+10, y+3);
    line(x-2, y, x-2, y+10);
    line(x+2, y, x+2, y+10);
    fill(255);
    ellipse(x-2, y-2, 4, 4);
    ellipse(x+2, y-2, 4, 4);    
  }

}


