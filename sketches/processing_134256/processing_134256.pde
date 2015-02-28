
int nbImages = 4;
//int l = 120; 
//int h= 150;
PImage tete[] = new PImage[nbImages];
PImage yeux[] = new PImage[nbImages];
PImage nez[] = new PImage[nbImages];
PImage bouche[] = new PImage[nbImages];


void setup(){
  size(800,600);

  for(int i=0; i<nbImages; i++){
    
    tete[i] = loadImage ("tete0"+i+".png"); //écris le nom "tete0" et ajoute "i" puis écris ".png" 
    nez[i] = loadImage ("nez0"+i+".png");
    bouche[i] = loadImage ("bouche0"+i+".png");
    yeux[i] = loadImage ("yeux0"+i+".png");
    }
    /*bouche[i].resize(l,h);
    yeux[i].resize(l,h);
    nez[i].resize(l,h);
    tete[i].resize(l,h);*/
    

  noLoop();
  imageMode(CENTER);
}

void draw(){
  
  background(30,227,153);
     
    image(tete[int(random(nbImages))], width/2, height/2);
    image(nez[int(random(nbImages))], width/2, height/2);
    image(bouche[int(random(nbImages))], width/2+3, height/2);
    image(yeux[int(random(nbImages))], width/2, height/2);

}

void keyPressed(){
  redraw();
}


