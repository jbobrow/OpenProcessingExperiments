
// Guillaume LUNG TUNG
// Robot Snake

  color default_color = color(255,90,90);
  color c = color(0,0,0);
  int taille_tete = 100;
  int teteX = 600;
  int teteY = 200;
  
  int longueurCorps = 500;
  int hauteurCorps = 50;
  int nbCorps = 12;
  
  int piedX = 100;
  int piedY = 300;
  int largeurPied = 50;

  float x;
  float easing = 0.1;
  

void setup()
{
  size(800, 600);
  background(170,255,90);
  smooth();

  
}

void draw()
{
  teteX += (mouseX-teteX) * easing;
  teteY += (mouseY-teteY) * easing;
  
  background(170,255,90);

  strokeJoin(ROUND);
  strokeWeight(10);
  strokeCap(SQUARE);

  //line(200,125,200,200);
//  ellipse(200,100,50,50);



  strokeWeight(1);
  line(teteX,teteY,teteX-20,teteY-taille_tete);
  line(teteX,teteY,teteX+20,teteY-taille_tete);
  
  fill(c);
  float weight = dist(mouseX,mouseY,pmouseX,pmouseY);
  text(weight, 10, 10);
  strokeWeight(10);
  arc(teteX,teteY,taille_tete,taille_tete,QUARTER_PI, PI+HALF_PI+QUARTER_PI);


  strokeWeight(5);
  noFill();
  beginShape();
  vertex(teteX-taille_tete/2,teteY);
  for (int i = 2; i < nbCorps; i++)
  {
    int multi;
    if (i%2 == 1)
      multi = 1;
    else
      multi = -1;
    vertex(teteX - i*(teteX-piedX)/nbCorps, teteY-i*(teteY-piedY)/nbCorps + hauteurCorps * multi);  
  }
  //vertex( teteX - nbCorps*(teteX-piedX)/nbCorps , teteY);
  vertex(piedX,piedY);
  endShape();
  
  fill(0);
  rect(piedX-largeurPied,piedY-largeurPied/2,largeurPied,largeurPied);
}



void mousePressed()
{
  if (c == default_color)
    c = color(0,0,0);
  else
    c = default_color;
}               
