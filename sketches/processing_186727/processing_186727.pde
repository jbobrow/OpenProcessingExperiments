
PImage tierra;
PImage meteorit;
PImage cometa;
PImage sol;
PImage espai;

int conjunt = 100;
float[] posx = new float[conjunt];
float[] posy = new float[conjunt];
float[] velx = new float[conjunt];
float[] vely = new float[conjunt];
float[] sz = new float[conjunt];


void setup(){
  size(650,600);
  strokeWeight(3);
  tierra=loadImage("tierra.png");
  meteorit=loadImage("meteorit.png");
  cometa=loadImage("cometa.png");
  sol=loadImage("sol.png");
  espai=loadImage("espai.png");
  
  //estrelles
  for (int i=0; i<conjunt; i++) {
    sz[i] = 2;
    posx[i] = random(sz[i]/2, width-sz[i]/2);
    posy[i] = random(sz[i]/2, height-sz[i]/2);
    velx[i] = random(-7, 7);
    vely[i] = random(-7, 7);
  }

}

void draw() {
  background(0);
  image(espai,-350,-350,1000,1350);
  
    
  
  int segons=second();
  int minuts=minute();
  int hores=hour();
  stroke(13,129,85);
  fill(22,228,150);
  image(cometa,100,150,segons*4,segons*4);
  //image(meteorit,150,250,segons*4,segons*4);
  //image(tierra,150,250,segons*3,segons*3);
  //ellipse(150,300,segons*3,segons*3);
  stroke(12,34,104);
  fill(25,73,225);
  image(tierra,350,300,minuts*3,minuts*3);
  //ellipse(350,300,minuts*3,minuts*3);
  stroke(85,37,76);
  fill(175,75,156);
  image(sol,500,300,hores*5,hores*5);
  //ellipse(550,300,hores*3,hores*3);
  
  //estrelles
  for (int i=0; i<conjunt; i++) {
    posx[i] = posx[i] + velx[i];
    posy[i] = posy[i] + vely[i];
    
    if ((posx[i]>=width - conjunt/2) || (posx[i]<= 0 + conjunt/2)) {
      velx[i] = -velx[i];
    }
    if ((posy[i]>=height - conjunt/2) || (posy[i]<= 0 + conjunt/2)) {
      vely[i] = -vely[i];
    }
 
   
   
    fill(242,242,242);
    stroke(242,242,242);
    ellipse(posx[i], posy[i], sz[i], sz[i]);
  }
}
 
void mousePressed() {
  for (int i=0; i<conjunt; i++) {
    posx[i] = mouseX;
    posy[i] = mouseY;
  }
}



