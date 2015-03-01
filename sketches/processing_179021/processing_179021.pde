
int x;
int y;
int compteurPipi = 0;
void setup()
{
  strokeWeight(2);
  int TF=600; //Taille de la fenetre
  size(TF,TF);
}
void draw()
{
  nettoyer();
  
  if (x<=320 && x>=280 && y<=70 && y>=30) // chasse d'eau
  {
    compteurPipi=0;
  }
  
  pipi();
  
  zizi();
  x=mouseX;
  y=mouseY;
}
void nettoyer()
{  
  background(#B3B3B3);
  
  stroke(#080808);
  fill(#FFFFFF);
  //textSize(18);
  //text("© Pipi Production", 430, 580);
  
  ellipse(300,200,350,500);
  ellipse(300,200,290,440);
  rect(100,0,400,110,6);
  
  fill(#7E7E7E);
  ellipse(300,50,40,40);
  
  fill(#000000);
  //rect(110,113,380,15,6);
  
  fill(224,255,(255-compteurPipi));
  rect(255, 200, 90, 110, 15, 15, 30, 30);
}

void zizi() {
  stroke(#BC781E);
  fill(#F2AF56);
  rect(x-20, y-100, 40, 120, 20, 20, 2, 2);
  line(x,y-100,x,y-85);
  line(x-20,y-85,x+20,y-85);
  ellipse(x+20,y+20,50,50);
  ellipse(x-20,y+20,50,50);
}

void pipi() {
  if (mousePressed == true) 
  {
    compteurPipi = compteurPipi + 1;
    stroke(#ECF500);
    
    fill(255,255,0,0);
    strokeWeight(6);
    
    if(x < mouseX)
    {
      arc(x-60, y-100, 120, 200, radians(270), radians(360)); // vers la gauche
    }
    else if (x > mouseX)
    {
      arc(x+60, y-100, 120, 200, radians(180), radians(270)); //vers la droite
    }
    else if (x == mouseX)
    {
      line (x,y-100,x, y-240); // en face
    }
    strokeWeight(2);
  } 
}
