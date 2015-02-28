
/*David Palomar Cros
Informatica 
seminari 3
GEDI Grup 03

El joc consisteix en tres mosquits que volten tranquilament per la oscuritat, quan de repent l'encen la llum i els atrau cap a ella. 
Són uns mosquits que els van creixent i disminuint els ulls depenen de la posició en la que es troben, al igual que el color, que varia
segons la posició del ratolí.
*/
//defineixo les variables que utilitzaré, com a nombres enters. la posició i velicitat de cada un dels mosquits.

int posX;
int posY;
int posX2;
int posY2;
int posX3;
int posY3;
int velX;
int velY;
int velX2;
int velY2;
int velX3;
int velY3;
// mesura dels ulls, que canviarè en funció a la posició.
int sz;

// a
void setup() 
//defineixo el fons de la finestra on es mostraran els mosquits. 

{
  background(0);
  size(600,600);
  //dono valor a les variables
  posX=0;
  posY=0;
  posX2=600;
  posY2=600;
  posX3=0;
  posY3=0;
  velX=15;
  velY=6;
  velX2=-8;
  velY2=-5;
  velX3=4;
  velY3=9;
  sz=20;
  noCursor();
}
  
void draw()
{
  //faig el primer mosquit
  background(82,82,82);
//amb la funció "if" consegueixo donar una condició al ordinador.

  if (mousePressed){
    
  //faig que la llum s'escengui al clicar el botó esquerre del mouse
  background(220,240,64);
  
  
  //cambio la posició dels mosquits en funció de la posició del ratolí, així els mosquits es veuen atretes per la llum
  //faig que el primer mosquit segueixi la llum al clicar el ratolí
  
  
   posX=mouseX+25;
   posY=mouseY+25;
  // ala 1 
   stroke(0);
   fill(97,220,240);
   beginShape();
   vertex(posX-20,posY-10);
   vertex(posX-30,posY-30);
   vertex(posX-20,posY-45);
   vertex(posX-10,posY-35);
   vertex(posX-5,posY-10);
   endShape(); 
   //ala 2
    beginShape();
   vertex(posX+10,posY-10);
   vertex(posX+20,posY-30);
   vertex(posX+10,posY-45);
   vertex(posX,posY-35);
   vertex(posX-5,posY-10);
   endShape(); 
   
   //faig el cos del primer mosquit
  fill(35,35,35);
  
  ellipse(posX,posY,40,40);
  //els ulls, cambiaran de color amb el moviment del ratolí
  
  fill(mouseX,mouseY,20); 
  ellipse(posX+10,posY-10,sz,sz);
  ellipse(posX-5,posY-10,sz,sz);
  fill(0);
  ellipse(posX+12,posY-10,5,5);
  ellipse(posX-6,posY-10,5,5);
  beginShape();
  vertex(posX+12,posY+12);
  vertex(posX+20,posY+20);
  endShape();
     
    
  //faig que el segon mosquit segueixi la llum al clicar el ratolí
  
  posX2=mouseX-45;
  posY2=mouseY-45;
  //ala 1
  stroke(0);
   fill(97,220,240);
   beginShape();
   vertex(posX2-20,posY2-10);
   vertex(posX2-30,posY2-30);
   vertex(posX2-20,posY2-45);
   vertex(posX2-10,posY2-35);
   vertex(posX2-5,posY2-10);
   endShape(); 
   //ala2
   beginShape();
   vertex(posX2+10,posY2-10);
   vertex(posX2+20,posY2-30);
   vertex(posX2+10,posY2-45);
   vertex(posX2,posY2-35);
   vertex(posX2-5,posY2-10);
   endShape(); 
   
   //faig el cos del mosquit 2
  fill(35,35,35);
  ellipse(posX2,posY2,40,40);
  
  //els ulls canviaran de color amb el moviment del ratolí
  fill(mouseX,mouseY,20); 
  ellipse(posX2+10,posY2-10,sz,sz);
  ellipse(posX2-5,posY2-10,sz,sz);
  fill(0);
  ellipse(posX2+12,posY2-10,5,5);
  ellipse(posX2-6,posY2-10,5,5);
  beginShape();
  vertex(posX2+12,posY2+12);
  vertex(posX2+20,posY2+20);
  endShape();
  
  //faig que el tercer mosquit segueixi la llum al clicar el ratolí
    posX3=mouseX+25;
  posY3=mouseY-40;
  //ala 1
   stroke(0);
   fill(97,220,240);
   beginShape();
   vertex(posX3-20,posY3-10);
   vertex(posX3-30,posY3-30);
   vertex(posX3-20,posY3-45);
   vertex(posX3-10,posY3-35);
   vertex(posX3-5,posY3-10);
   endShape(); 
   //ala2
    beginShape();
   vertex(posX3+10,posY3-10);
   vertex(posX3+20,posY3-30);
   vertex(posX3+10,posY3-45);
   vertex(posX3,posY3-35);
   vertex(posX3-5,posY3-10);
   endShape(); 
   
   //faig el cos del mosquit tres
  fill(35,35,35);
  ellipse(posX3,posY3,40,40);
  //els ulls
  fill(mouseX,mouseY,20); 
  ellipse(posX3+10,posY3-10,sz,sz);
  ellipse(posX3-5,posY3-10,sz,sz);
  fill(0);
  ellipse(posX3+12,posY3-10,5,5);
  ellipse(posX3-6,posY3-10,5,5);
  beginShape();
  vertex(posX3+12,posY3+12);
  vertex(posX3+20,posY3+20);
  endShape();
  
   //faig la llum que els mosquits seguiran
   //els rajos de llum, que seguiran la posició del mouse
   
   stroke(242,192,24);
   strokeWeight(10);
   line(mouseX,mouseY,mouseX+50,mouseY+50);
   line(mouseX,mouseY,mouseX+50,mouseY-50);
   line(mouseX,mouseY,mouseX-50,mouseY+50);
   line(mouseX,mouseY,mouseX-50,mouseY-50);
   line(mouseX,mouseY,mouseX,mouseY-70);
   
   line(mouseX,mouseY,mouseX-70,mouseY);
   line(mouseX,mouseY,mouseX+70,mouseY);
   
   //la ombra que fa la llum, que augmenta o disminueix depenent d'on es col·loca la llum
   fill(82,82,82);
   noStroke();
   beginShape();
   vertex(0,height);
   vertex(mouseX-20,mouseY+25);
   vertex(mouseX+20,mouseY+25);
   vertex(width,height);
   endShape();
   
   //la bombeta
   fill(242,192,24);
   stroke(242,192,24);
   strokeWeight(3);
   ellipse(mouseX,mouseY,50,50);
   noStroke();
   fill(0);
   rect(mouseX-20,mouseY+15,40,40);
     
  }
  
  else{
    //amb la funció else, dono les ordres que seguiran els objectes quan no estigui apretat el mouse
   //els mosquits seguiran una altre direcció quan el ratolí no estigui apretat
   
   //ala 1
   stroke(0);
   fill(97,220,240);
   beginShape();
   vertex(posX-20,posY-10);
   vertex(posX-30,posY-30);
   vertex(posX-20,posY-45);
   vertex(posX-10,posY-35);
   vertex(posX-5,posY-10);
   endShape(); 
   //ala2
    beginShape();
   vertex(posX+10,posY-10);
   vertex(posX+20,posY-30);
   vertex(posX+10,posY-45);
   vertex(posX,posY-35);
   vertex(posX-5,posY-10);
   endShape(); 
   
   //faig el cos del mosquit 1
  fill(35,35,35);
  
  ellipse(posX,posY,40,40);
  fill(mouseX,mouseY,20); 
  
  
  //els ulls variaran el tamany segons la posició del mosquit
  // poso la condició necessària per que es compleixi la equació, quan la posició varia el tamany també.
  if (posX<=0){
    
    sz=sz+30;}
     if (posX>=width){
    
    sz=sz-30;}
    
  if (posY<=0){
    
    sz=sz-30;}
   if  (posY>=height){
     sz=sz+30;}
    
  ellipse(posX+10,posY-10,sz,sz);
  ellipse(posX-5,posY-10,sz,sz);
  fill(0);
  ellipse(posX+12,posY-10,5,5);
  ellipse(posX-6,posY-10,5,5);
  beginShape();
  vertex(posX+12,posY+12);
  vertex(posX+20,posY+20);
  endShape();
  
  //amb les seguents funcions faré que els mosquits es vagin movent per tota la pantalla, rebotant per les parets de la finestra.
   
  posX=posX+velX;
  posY=posY+velY;
  
  //quan arribi a 0 o a la ampitud o altura máximes canviaran la seva direcció
  
    if ((posX<=0)||(posX>=width)){
    
    velX=-velX;}
    
    if ((posY<=0)||(posY>=height)){
    
    velY=-velY;}
    
    //faig el segon mosquit
    //ala 1
   stroke(0);
   fill(97,220,240);
   beginShape();
   vertex(posX2-20,posY2-10);
   vertex(posX2-30,posY2-30);
   vertex(posX2-20,posY2-45);
   vertex(posX2-10,posY2-35);
   vertex(posX2-5,posY2-10);
   endShape(); 
   //ala2
   beginShape();
   vertex(posX2+10,posY2-10);
   vertex(posX2+20,posY2-30);
   vertex(posX2+10,posY2-45);
   vertex(posX2,posY2-35);
   vertex(posX2-5,posY2-10);
   endShape();
   
  //cos mosquit 2 
  fill(35,35,35);
  ellipse(posX2,posY2,40,40);
  fill(mouseX,mouseY,200); 
  
   //els ulls variaran el tamany segons la posició del mosquit
   if (posX2<=0){
    
    sz=sz+30;}
     if (posX2>=width){
    
    sz=sz-30;}
    
  if (posY2<=0){
    
    sz=sz-30;}
   if  (posY2>=height){
     sz=sz+30;}
     
  ellipse(posX2+10,posY2-10,sz,sz);
  ellipse(posX2-5,posY2-10,sz,sz);
  fill(0);
  ellipse(posX2+12,posY2-10,5,5);
  ellipse(posX2-6,posY2-10,5,5);
  beginShape();
  vertex(posX2+12,posY2+12);
  vertex(posX2+20,posY2+20);
  endShape();
  
  //amb les seguents funcions faré que els mosquits es vagin movent per tota la pantalla, rebotant per les parets de la finestra.
   
  posX2=posX2+velX2;
  posY2=posY2+velY2;
  
  
    if ((posX2>=width)||(posX2<=0)){
    
    velX2=-velX2;}
    
    if ((posY2<=0)||(posY2>=height)){
    
    velY2=-velY2;}
    
    //faig el tercer mosquit
    //ala 1
   stroke(0);
   fill(97,220,240);
   beginShape();
   vertex(posX3-20,posY3-10);
   vertex(posX3-30,posY3-30);
   vertex(posX3-20,posY3-45);
   vertex(posX3-10,posY3-35);
   vertex(posX3-5,posY3-10);
   endShape(); 
   //ala2
   beginShape();
   vertex(posX3+10,posY3-10);
   vertex(posX3+20,posY3-30);
   vertex(posX3+10,posY3-45);
   vertex(posX3,posY3-35);
   vertex(posX3-5,posY3-10);
   endShape();
   
  //cos mosquit 3
  fill(35,35,35);
  ellipse(posX3,posY3,40,40);
  fill(mouseX,mouseY,200); 
  
  //els ulls variaran el tamany segons la posició del mosquit
  if (posX3<=0){
    
    sz=sz+30;}
     if (posX3>=width){
    
    sz=sz-30;}
    
  if (posY3<=0){
    
    sz=sz-30;}
   if  (posY3>=height){
     sz=sz+30;}
  ellipse(posX3+10,posY3-10,sz,sz);
  ellipse(posX3-5,posY3-10,sz,sz);
  fill(0);
  ellipse(posX3+12,posY3-10,5,5);
  ellipse(posX3-6,posY3-10,5,5);
  beginShape();
  vertex(posX3+12,posY3+12);
  vertex(posX3+20,posY3+20);
  endShape();
  
  //amb les seguents funcions faré que els mosquits es vagin movent per tota la pantalla, rebotant per les parets de la finestra.
   
  posX3=posX3+velX3;
  posY3=posY3+velY3;
  
  
    if ((posX3>=width)||(posX3<=0)){
    
    velX3=-velX3;}
    
    if ((posY3<=0)||(posY3>=height)){
    
    velY3=-velY3;}
    
    //faig la llum que els mosquits seguiran quan s'encengui
    
  fill(255);
  stroke(242,192,24);
  strokeWeight(3);
  ellipse(mouseX,mouseY,50,50);
  noStroke();
  fill(0);
  rect(mouseX-20,mouseY+15,40,40);
  }
}
      


