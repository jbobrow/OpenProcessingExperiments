
class Brush extends PImage{
  color couleur;
  int dia;
  float count;
  float speed=random(.1);
  float currentdia;    
  float mouseIX;
  float mouseIY;
  float ecart;
  float ecartMax;
    
  //constructor
  Brush(color Couleur,int Dia){
    couleur=Couleur;
    dia=Dia;
    ecartMax=0;
    brushImage=loadImage("sbrush.png");
    imageMode(CENTER);
  }
  void display(){
    ecart=sqrt(pow(mouseX-mouseIX,2)+pow(mouseY-mouseIY,2));
    if(ecart>ecartMax){
      mouseIX=mouseX;
      mouseIY=mouseY;
    }
     if((mousePressed)&&(mouseButton==LEFT)&&(ecart>ecartMax)){      
    try{
      angle+=rotSpeed;
      pushMatrix();
      translate(mouseX,mouseY);
      rotate(angle);
    image(brushImage,0,0,dia,dia);
    popMatrix();
    }
    catch(Exception e){
      update();
    } 
    }
  }
  
  void update(){
    brushImage=loadImage("sbrush.png");
  }

}



