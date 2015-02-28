
class rouge1 
{
  float  ypos, rouge, vert, bleu;
  rouge1 (float y, float r, float v, float b)  
  {
    ypos = y ;
    rouge = r ;
    vert = v ;
    bleu = b ;
  }
  void affichage() 
  {
  stroke(rouge,vert,bleu,10);
  for  (int i = 0 ; i < steps; i++)
  {
  ellipse ((width/steps) * i+(mouseX-(width/2)), ypos+ random(-rand, rand), rand, rand) ;
  rand += random(-nn, nn);
  }
  }

}

class jaune2 
{
  float  ypos, rouge, vert, bleu;
  jaune2 (float y, float r, float v, float b)  
  {
    ypos = y ;
    rouge = r ;
    vert = v ;
    bleu = b ;
  }
  void affichage() 
  {
  stroke(rouge,vert,bleu,10);
  for  (int i = 0; i < steps; i++)
  {
  ellipse ((width/steps) * i+(mouseX-(width/2)), ypos+ random(-deuz, deuz), deuz, deuz) ;
  deuz += random(-mm, mm);
  }
  }

}

class marron3 
{
  float  ypos, rouge, vert, bleu;
  marron3 (float y, float r, float v, float b)  
  {
    ypos = y ;
    rouge = r ;
    vert = v ;
    bleu = b ;
  }
  void affichage() 
  {
  stroke(rouge,vert,bleu,10);
  for  (int i = 0; i < steps; i++)
  {
  ellipse ((width/steps) * i+(mouseX-(width/2)), ypos+ random(-troiz, troiz), troiz, troiz) ;
  troiz += random(-oo, oo);
  }
  }

}

