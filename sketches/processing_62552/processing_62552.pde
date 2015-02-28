
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;


void setup() {
 
  
  img = loadImage ("insel.jpg");
  
   size(615,301);

 img2 = loadImage ("Moewe.png");
 img3 = loadImage ("sonne Kopie Kopie.png");
 img4 = loadImage ("segelboot.png");
 img5=  loadImage ("regenwolke.png");
  
}

void draw (){
  
  noCursor();
  image(img,0,0);
  
  
  if(mousePressed) {
  
    tint(105,105,105);
  image(img5,450,10,150,150);
  image(img2,200,110,100,100);
  }else{
    noTint();
    image(img3,450,10,150,150);
    image(img4,mouseX,150,150,150);
}

}


