
//Berta Aracil López - Informàtica P2_b - Grup 02 GEDI


//declaració de variables
int movX;
int posX,posY,velX,velY;
int sz1,sz2;
int u1,u2;
boolean mides,mides2;

//configuració de la pàgina
void setup()
{
  size(800,500);
  movX=width;
  posX=width/2;
  posY=height/2;
  velX=int(random(2,7));
  velY=int(random(1,2));
  sz1=50;sz2=40;
  u1=20;u2=10;
}


//funcions del dibuix
void draw()
{
  background(120,210,255); //color de fons
  
  //núvol
  fill(9,50,120,90);
  movX=movX-2; //equació de moviment del núvol (el núvol tornarà a aperèixer un cop hagi sortit de la pàgina)
  if(movX+40<0){
  movX=width;
  }
  
  ellipse(movX,height/5,70,40);
  ellipse(movX+20,height/6,70,40);
  ellipse(movX-20,height/6,70,40);
  ellipse(movX-40,height/5,70,40);
  ellipse(movX+40,height/5,70,40);
  
  
  //tiges
  stroke(43,155,20);strokeWeight(3);
  line(width/5,height/1.5,width/5,height);
  line(width*4/5,height/1.5,width*4/5,height);
  line(width/2,height/1.8,width/2,height);
  
  
  //flors
  noStroke();
  fill(150+posY,20+posX,15+posY); //el color de les flors variarà segons la posició (posX i posY)
  
  ellipse(width/5,height/1.5,30,30);
  ellipse(width/2,height/1.8,50,50);
  ellipse(width*4/5,height/1.5,30,30);
  
  //pètals
  fill(150+posY,20-posX,15+posY,80); //color dels pètals en transperent (quarta variable)
  ellipse(width/5,height/1.5,70,70);
  ellipse(width/2,height/1.8,100,100);
  ellipse(width*4/5,height/1.5,70,70);
  
  ellipse(width/5,height/1.5,90,90);
  ellipse(width/2,height/1.8,120,120);
  ellipse(width*4/5,height/1.5,90,90);
  
  ellipse(width/5,height/1.5,110,110);
  ellipse(width/2,height/1.8,140,140);
  ellipse(width*4/5,height/1.5,110,110);
  
  //moviment de l'abella
  posX=posX+velX;
  posY=posY+velY;
    //comprovem la posició de la X perquè no surti de la pàgina
    if((posX<=sz1)||(posX>width-sz1)){
    velX=-velX;
  }
    //comprovem posició de la Y perquè no surti de la pàgina
    if((posY<=sz2)||(posY>height-sz2)){
    velY=-velY;
  }
  //dibuix de l'abella
  noStroke();fill(250,255,25);
  ellipse(posX,posY,sz1,sz2);
  
    //ulls
    stroke(0);strokeWeight(2); fill(255);
    ellipse(posX-20,posY-10,u1,u1); ellipse(posX-20,posY+10,u1,u1);
    noStroke(); fill(0);
    ellipse(posX-20,posY-10,u2,u2); ellipse(posX-20,posY+10,u2,u2);
    
    //cos
    stroke(0);
    line(posX,posY+16,posX,posY-16);
    line(posX+5,posY+16,posX+5,posY-16);
    line(posX+10,posY+14,posX+10,posY-14);
    line(posX+15,posY+12,posX+15,posY-12);
    triangle(posX+25,posY+5,posX+25,posY-5,posX+30,posY);
    
    //ales
    fill(10,60,150,80); noStroke();
    ellipse(posX+15,posY+10,45,25);ellipse(posX+15,posY-10,45,25);
}

//Acció quan es cliqui el ratolí: els ulls de l'abella augmentaran. Un cop es torni a clicar, els ulls recuperaran el tamany original.
void mousePressed(){
  mides=mides==false;
  if(mides){
    u1=u1+10;
    fill(255,130,10);ellipse(posX,posY,30,30);
  }
  else{
    u1=u1-10;
  }
  mides2=mides2==false;
  if(mides2){
    u2=u2+5;
  }
  else{
    u2=u2-5;
  }
}



