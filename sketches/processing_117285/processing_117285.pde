
/* @pjs preload="background.jpg", "nudebase.png", "clothing01.png", "clothing02.png", "clothing03.png", "face01.png", "face01.png", "face02.png", "face03.png", "hair01.png", "hair02.png", "hair03.png";*/

int hairstate = 0, clothstate = 0, facestate = 0;
PImage back, base, cloth01, cloth02, cloth03, face01, face02, face03, hair01, hair02, hair03, facef, faceb, hairf, hairb, clothf, clothb;



void setup() {
  size (706, 800);
  //load images
  back= loadImage("background.jpg");
  base = loadImage("nudebase.png");
  cloth01 = loadImage("clothing01.png");
  cloth02 = loadImage("clothing02.png");
  cloth03 = loadImage("clothing03.png");

  face01 = loadImage("face01.png");
  face02 = loadImage("face02.png");
  face03 = loadImage("face03.png");

  hair01 = loadImage("hair01.png");
  hair02 = loadImage("hair02.png");
  hair03 = loadImage("hair03.png");
}

void draw() {
  background(100);
  noStroke();
  
  //core images
  image(back, 0, 0);
  image(base, 0, 0);

 
 switch(hairstate) { //HAIR
    
    case 0:
    image(hair01, 0, 0);
    break;
    
    case 1:
    image(hair02, 0, 0);
    break;
    
    case 2:
    image(hair03, 0, 0);
    break;
}
    
switch(facestate) { //FACE
    
    case 0:
    image(face01, 0, 0);
    break;
    
    case 1:
    image(face02, 0, 0);
    break;
    
    case 2:
    image(face03, 0, 0);
    break;  
}
switch(clothstate) { //CLOTH
    
    case 0:
    image(cloth01, 0, 0);
    break;
    
    case 1:
    image(cloth02, 0, 0);
    break;
    
    case 2:
    image(cloth03, 0, 0);
    break;  
  }
}

  void keyPressed() {
    if(keyCode == 72){ 
    hairstate = hairstate +1;
      if(hairstate>2){
        hairstate = 0;
    }}
    if(keyCode == 70){
    facestate = facestate +1;
      if(facestate>2){
        facestate = 0;
    }}
    if(keyCode == 67){
    clothstate = clothstate +1;
      if(clothstate>2){
        clothstate = 0;
    }}
}



