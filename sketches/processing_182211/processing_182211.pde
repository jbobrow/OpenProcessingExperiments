

PImage[] photo = new PImage[4];
PImage[] photo1 = new PImage[4];
PImage[] photo2 = new PImage[4];
PImage img; //pour les titres
PImage titre;

int lastTime=0;
int intervalle=50;

boolean etat= false;

void setup(){
  photo[0]  = loadImage("01.png");
  photo[1]  = loadImage("02.png"); 
  photo[2]  = loadImage("03.png");
  photo[3]  = loadImage("04.png");
  
  photo1[0]  = loadImage("05.png");
  photo1[1]  = loadImage("06.png"); 
  photo1[2]  = loadImage("07.png");
  photo1[3]  = loadImage("08.png");
  
  photo2[0]  = loadImage("09.png");
  photo2[1]  = loadImage("10.png"); 
  photo2[2]  = loadImage("11.png");
  photo2[3]  = loadImage("12.png");
  
  img = loadImage("faire le.png"); // pour les titres
  titre = loadImage("titre.png");
  
  //pour les mots

  
  
  size(600,300);
  background(255);
  frameRate (30);

}

void draw()
{ 

//répétition
for (int i=0; i<20; i=i+1)
{
  if(millis()-lastTime>=intervalle)
  {
  image(photo1[int(random(4))], width/2-50,height/2-45); 
  image(photo[int(random(4))], width/2-190, height/2-44);
  image(photo2[int(random(4))], width/2+90, height/2-45);
 lastTime = millis();
  } 
}
  //phrase
image(img, width/2-260, height/2+65); //pour les titres 
image(titre, width/2-150, height/2-120);
// carrés jaunes
stroke(255,255,0);
noFill();
strokeWeight(3); 
rect(width/2-60, height/2-60, 120, 120, 7);
rect(width/2-200, height/2-60, 120, 120, 7);
rect(width/2+80, height/2-60, 120, 120, 7);

}

void mouseReleased() {
  etat = !etat;
  if (etat == false) {
    noLoop();  // Releasing the mouse stops looping draw()
  } else {
    loop();
  }
}




