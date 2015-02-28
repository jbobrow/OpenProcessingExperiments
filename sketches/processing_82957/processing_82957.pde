
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
  fill(255,125,3,80);
  translate(300,200);
  for(int i=0; i<700;i+=20){
    rotate(radians(13));
  ellipse(100,100,80,80);}
  
  //Dessiné une forme
  noStroke();
  fill(5,255,19,80);
  translate(100,150);
  for(int i=0; i<700;i+=20){
    rotate(radians(13));
  ellipse(100,100,80,80);}
  
  //Dessiné une forme
  noStroke();
  fill(5,249,255,80);
  translate(10,150);
  for(int i=0; i<700;i+=20){
    rotate(radians(13));
  ellipse(100,100,80,80);}  
  
   
  //Dessiné une forme
  noStroke();
  fill(250,8,255,80);
  translate(30,200);
  for(int i=0; i<700;i+=20){
    rotate(radians(13));
  ellipse(100,100,80,80);}
  
    //Dessiné une forme
  noStroke();
  fill(255,23,132,80);
  translate(10,150);
  for(int i=0; i<700;i+=20){
    rotate(radians(13));
  ellipse(100,100,80,80);}  
  
  
  noLoop();

}


