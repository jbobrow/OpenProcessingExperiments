
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
  fill(0,36,255,80);
  translate(100, 100);
  for(int i=0; i<360;i+=30){
    rotate(radians(30));
  quad(0, 0, 20, 10, 75, 66, 15, 80);}
  
  //Dessiné une forme
  noStroke();
  fill(247,10,232,80);
  translate(150, 150);
  for(int i=0; i<360;i+=30){
    rotate(radians(30));
  quad(0, 0, 20, 10, 75, 66, 15, 80);}
  
  //Dessiné une forme
  noStroke();
  fill(5,247,47,80);
  translate(150, 150);
  for(int i=0; i<360;i+=30){
    rotate(radians(30));
  quad(0, 0, 20, 10, 75, 66, 15, 80);}
 
 
  noLoop();

}


