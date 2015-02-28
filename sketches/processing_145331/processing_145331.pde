
// Victor sarroca. P3a). Automòbil (Pick up) que rebota en els límits.

float posx, posy, velx, vely; //Definim paràmetres de posició i velictat

void setup(){
  size(600,600);

  //noCursor();
  posx=width/2; //Determinem l'inici del moviment en el centre
  posy=height/2;
  velx=3;
  vely=3;
}
void draw(){
  background(150,250,245);

// Rodes
strokeWeight(4);
fill(180,180,180);
ellipse(posx-2*45,posy+45,45,45);
ellipse(posx+1.5*45,posy+45,45,45);

//cos principal
strokeWeight(2); 
stroke(0);
fill(posx,227,posy);
rectMode(CENTER);
rect(posx,posy,6*45,1*45);

rect(posx-0.5*45,posy-0.1*45,2*45,0.75*45); //porta
line(posx,posy-0.25*45,posx+0.25*45,posy-0.25*45); //mànec porta

fill(210,250,240); //cabina
rectMode(CENTER);
rect(posx-0.5*45,posy-45,2*45,1*45);

triangle(posx-1.5*45,posy-0.5*45,posx-2*45,posy-0.5*45,posx-1.5*45,posy-1.46*45); //finestra

line(posx+1.5*45,posy-0.5*45,posx+0.5*45,posy-1.5*45); 

fill(250,135,18); //llums
rectMode(CENTER);
rect(posx-2.85*45,posy-0.35*45,0.25*45,0.25*45);
 
 posx=posx+velx; //posició respecte velocitat
 posy=posy+vely;

//condicions
  if(posx+130>width||posx-130<0){
    velx = -velx;
  }
   
if(posy+60 > height || posy-65<0){
    vely = -vely;
}
} 
void mousePressed(){ //Iniciar el moviment en posició central si es clica el ratolí
  posx=width/2;
  posy=height/2;

}
