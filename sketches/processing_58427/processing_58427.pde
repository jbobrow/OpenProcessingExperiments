
bouboule bouboules[];
int nbrElement = 6500;
int programmStart, delayCollision, tmpcourant;
boolean useCollision = false;
int numimg=0;
PImage img;
int posxrect=width;
int posyrect=0;
void setup() {
  size(500, 500);
  bouboules = new bouboule[nbrElement];

  img =loadImage("data/"+numimg+".jpg");
  img.resize(width, height);
  for (int i = 0; i< nbrElement; i++) {
    //PVector pos= new PVector (random(0, width), random(0, height));

    PVector pos= new PVector (random(width/2-50, width/2+50), random(height/2-50, height/2+50));
    PVector vit= new PVector (random(-1.25, 1.25), random(-1.25, 1.25));
    //bouboule(PVector _pos, PVector _vit, int _taille)
    bouboules[i] =new bouboule(pos, vit, int(random(4, 12)));
  }
  smooth();
  noStroke();
  programmStart= millis();
  delayCollision = 5000;
  tmpcourant=0;
  background(255);
}

void draw() {
  /*
  fill(255,1);
   rect(0,0,width,height);
   */
    background(255);
  tmpcourant= millis()-programmStart;
  //demarrage de la boucle
  for (int i = 0; i< nbrElement; i++) {
    bouboules[i].draw();
    if (tmpcourant>delayCollision && useCollision) {

      for (int j = 0; j< nbrElement; j++) {
        if (i!=j)
          bouboules[i].checkCollision(bouboules[j]);
      }
    }
  }
}

void mouseClicked() {
   useCollision=!useCollision;
}


void keyPressed() {
  if (keyCode == RIGHT ) {
    numimg++;
 if (numimg ==3){
  int numimg=0;
  print (""+numimg+"");
  }
   
    img =loadImage("data/"+numimg+".jpg");
    img.resize(width, height);
    background(255);
    for (int i = 0; i< nbrElement; i++) {
      //PVector pos= new PVector (random(0, width), random(0, height));

      PVector pos= new PVector (random(width/2-50, width/2+50), random(height/2-50, height/2+50));
      PVector vit= new PVector (random(-1.5, 1.5), random(-1.5, 1.5));
      //bouboule(PVector _pos, PVector _vit, int _taille)
      bouboules[i] =new bouboule(pos, vit, int(random(4, 8)));
    }
  }
  if (keyCode == LEFT ) {

    numimg--;
  if (numimg ==-1){
  int numimg=2;
  }
   
    img =loadImage("data/"+numimg+".jpg");
    img.resize(width, height);
    background(255);
    for (int i = 0; i< nbrElement; i++) {
      //PVector pos= new PVector (random(0, width), random(0, height));

      PVector pos= new PVector (random(width/2-50, width/2+50), random(height/2-50, height/2+50));
      PVector vit= new PVector (random(-1.5, 1.5), random(-1.5, 1.5));
      //bouboule(PVector _pos, PVector _vit, int _taille)
      bouboules[i] =new bouboule(pos, vit, int(random(4, 8)));
    }
  }
}


