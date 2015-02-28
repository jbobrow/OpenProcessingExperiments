
void setup ()
{
  size (500, 500);
}

void draw()
{ 
  //variables des trois angles du triangle
  int Xun;
  Xun=150;
  
  int Yun;
  Yun=200;
  
  int Xdeux;
  Xdeux=250;
  
  int Ydeux;
  Ydeux=48;
  
  int Xtrois;
  Xtrois= 350;
  
  int Ytrois;
  Ytrois=200;
  
  
  
  background(0);

// contour du triangle toujours avec un contour blanc et rempli de blanc avec une opacité de 90%
  stroke(250);
  strokeWeight(3);
  fill(250, 90);
  
 // premier triangle 
  triangle(Xun, Yun, Xdeux, Ydeux, Xtrois, Ytrois);
 //deuxième triangle reduit et déplacé vers le bas
  translate(125, 200);
  scale(0.5);
  triangle(Xun, Yun, Xdeux, Ydeux, Xtrois, Ytrois);
 // troisième triangle reprend la même taille que le premier
  scale(2);
  translate(375, 150);
  rotate(radians(180));
  triangle(Xun, Yun, Xdeux, Ydeux, Xtrois, Ytrois);
  noLoop();
}


