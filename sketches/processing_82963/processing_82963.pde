
void setup()
{
  //SIZE
  //La taille en pixel du papier de la fenêtre est largeur= 220 hauteur= 200
  size(500,500);
  
  smooth();
 
  //BACKGROUND
  //Peindre le fond de notre fenetre 
  background(255);
 
}

void draw()
{

  //Dessiné une forme
  noStroke();
  fill(5,247,47,80);
  translate(100, 150);
  for(int i=0; i<360;i+=30){
    rotate(radians(30));
  rect(100,100,80,80);}
 
   //Dessiné une forme
  noStroke();
  fill(8,250,248,80);
  translate(200, 150);
  for(int i=0; i<360;i+=30){
    rotate(radians(30));
  rect(100,100,80,80);}
 
   //Dessiné une forme
  noStroke();
  fill(155,8,255,80);
  translate(200, 150);
  for(int i=0; i<360;i+=30){
    rotate(radians(30));
  rect(100,100,80,80);}

   //Dessiné une forme
  noStroke();
  fill(252,128,3,80);
  translate(50, 100);
  for(int i=0; i<360;i+=30){
    rotate(radians(30));
  rect(100,100,80,80);}

  noLoop();

}


