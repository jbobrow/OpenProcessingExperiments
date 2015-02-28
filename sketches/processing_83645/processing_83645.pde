
void setup()
{
  size(500,500);
  smooth();
  
  background(255);
  
}

void draw()
{
  //boucle longueur du rectangle
  for(int L=10; L<=500; L=L+30)
  //position en X
  for(int X=100; X<=400; X=X+20)
  
  {
  rectMode(CENTER);
  
  noStroke();
  fill(240,199,65,20);
  rect(X,height/2,10,L);
  }
  
  //boucle hauteur du rectangle
  for(int H=10; H<=500; H=H+30)
  //position en Y
  for(int Y=100; Y<=400; Y=Y+20)
  
  {
  rectMode(CENTER);
  
  noStroke();
  fill(240,199,65,20);
  rect(width/2,Y,H,10);
  }
  
  noLoop();
}


