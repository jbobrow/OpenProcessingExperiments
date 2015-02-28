
PImage e;
PImage a;
PImage b;
PImage c;
PImage d;

int pic = 0;
int x = 119;
int y = 0;
int z = 255;
int imagen = 0;

void setup () {
  size (714,696); 
  background (z);
}


void draw () {

  // BOTON ADD
  if ( mouseX > 0 && mouseX <119 && mouseY > 0 && mouseY < 174) {
    a = loadImage ("addneg.jpg");
  }
  else {
    a = loadImage ("add.jpg");
  }
  // BOTON RESET
  if ( mouseX > 0 && mouseX <119 && mouseY > 174 && mouseY < 348) {
    b = loadImage ("resetneg.jpg");
  }
  else {
    b = loadImage ("reset.jpg");
  }

  // BOTON ADD PACK
    if ( mouseX > 0 && mouseX <119 && mouseY > 348 && mouseY < 522) {
   c = loadImage ("packneg.jpg");
    }else{
       c = loadImage ("pack.jpg");
    }
    
  // BOTON IMGUR
  if ( mouseX > 0 && mouseX <119 && mouseY > 522 && mouseY < 696) {
      d = loadImage ("imgurneg.jpg");
  }else{
      d = loadImage ("imgur.jpg");
  }
  
  image(a, 0,0,119,174);
  image(b, 0,174,119,174);
  image(c, 0,348,119,174);
  image(d, 0,522,119,174);

  println(imagen);
  println(z);
}
void mousePressed () {

  //BOTON ADD CARD
  if ( mouseX > 0 && mouseX <119 && mouseY > 0 && mouseY < 174) {
    imagen = round (random (1,220));
    e = loadImage (imagen+".jpg");
    image(e, x, y, 119, 174);
    x= x+119;
    if (x>=714) {
      y= y+174;
      x= 119;
    }
  }

  //BOTON RESET

  if ( mouseX > 0 && mouseX <119 && mouseY > 174 && mouseY < 348) {
    background (z);
    x= 119;
    y= 0;
    imagen = 0;
  }

  //BOTON ADD BOOSTER

  if ( mouseX > 0 && mouseX <119 && mouseY > 348 && mouseY < 522) {
      imagen = round (random (221,282));
    e = loadImage (imagen+".jpg");
    image(e, x, y, 119, 174);
    x= x+119;
    if (x>=714) {
      y= y+174;
      x= 119;
    }
  }

  //BOTON IMGUR
  if ( mouseX > 0 && mouseX <119 && mouseY > 522 && mouseY < 696) {
    link("http://imgur.com/", "_new");
  }
}


