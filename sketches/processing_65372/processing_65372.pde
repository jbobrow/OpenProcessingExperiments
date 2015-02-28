
class Layer{
  PGraphics pg;
  PGraphics masklayer;
  color couleur;
  int dia;
  float mindia;
  float maxdia;
  float count;
  float speed;
  float currentdia;
  //constructor
  Layer(color Couleur,int Dia){
    couleur=Couleur;
    dia=Dia;
    count=0;
    speed=random(.2);
    mindia=random(5);
    maxdia=random(50);
    pg=createGraphics(width,height,P2D);
    masklayer=createGraphics(width,height,P2D);
    masklayer.background(255); 
  }
  void display(){
    
    pg.beginDraw();
    pg.background(255);
    pg.noStroke();
    pg.fill(couleur);
    pg.rect(0,0,width,height);
    pg.endDraw();
    if((mousePressed)&&(mouseButton==LEFT)){
    count+=speed;
    currentdia=dia*(1-sin(count));
      masklayer.beginDraw();
    masklayer.noStroke();
    masklayer.fill(0,20);
    //masklayer.ellipse(mouseX,mouseY,dia,dia);
    masklayer.ellipse(mouseX,mouseY,currentdia,currentdia);
    masklayer.ellipse(width-mouseX,mouseY,currentdia,currentdia);
    //masklayer.ellipse(mouseX,height-mouseY,currentdia,currentdia);
    //masklayer.ellipse(width-mouseX,height-mouseY,currentdia,currentdia);
    masklayer.endDraw();
    }
    pg.mask(masklayer);  
    image(pg,0,0);
  }

}


