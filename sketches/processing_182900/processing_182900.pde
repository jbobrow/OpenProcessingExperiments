
//     *MEGAMAN*

//imatges
PImage fons;
PImage megamanQuiet;
PImage megamanSaltant;
PImage suzy;
PImage bunby;
PImage mambu;

//variables
float balaX = 50;
float balaY = 50;
float velocitatBalaX = 5;
float velocitatBalaY = 5;
float MMmidaX = 133.5;
float MMmidaY = 137.25;
int midaBala = 20;

void setup () {
  size (600, 400);
  fons = loadImage ("airman_stage.png");
  megamanQuiet = loadImage ("megaman_quiet.png");
  megamanSaltant = loadImage ("megaman_saltant.gif");
  bunby = loadImage ("Bunby_Heli_8-bit.png");
  mambu = loadImage ("Mambu_8-bit.png");
  suzy = loadImage ("Suzy_8-bit.png");
}

void draw () {
  background (0); 

  imageMode (CENTER);

//fons
image (fons,width/2, height/2,width,height);

  //megaman  
  image (megamanSaltant, width/4/*mouseX*/, mouseY/*height*2/4*/, MMmidaX+10, MMmidaY+10);


  //Velocitat

  balaX = balaX + velocitatBalaX;
  balaY = balaY + velocitatBalaY;

  //bala
  ellipse (balaX, balaY, midaBala, midaBala);

  //rebot paret X
  if (balaX + midaBala/2 >= width || balaX - midaBala/2 <=0) {
    velocitatBalaX = -velocitatBalaX;
  }

  //rebot paret y
  if (balaY + midaBala/2 >= height || balaY -midaBala/2 <=0) {
    velocitatBalaY = -velocitatBalaY;
  }

  // bunby

  if (!(balaX >= width/4+300 && balaX <= width/4+400 && balaY >= height/4-50 && balaY <= height/4+20)) {
    image (bunby, width/4+300, height/4-50, 126/2, 154/2);
  }

  //suzy
  if (!(balaX >= width/4+400 && balaX <= width/4+500  && balaY >= height/4+50 && balaY <= height/4+100 )) {
    image (suzy, width/4+400, height/4+50, 126/2, 126/2);
  }

  //mambu
  if (! (balaX >= width/4+300  && balaX <= width/4+450  && balaY >= height*3/4 && balaY <= height*3/4+50  )) {
    image (mambu, width/4+300, height*3/4, 133/2, 161/2);
  }
}

//funcions ratolí
void mousePressed () {

  //moviment bala
  velocitatBalaX= random (3, 10);
  balaX= width/4+80;//mouseX+80;
  balaY = mouseY-20; //height*2/4;

  //color
  stroke (random (255), random (255), random (255) );
  fill ( random (255), random (255), random (255) );
}







