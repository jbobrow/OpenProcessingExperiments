
Pacman pacman;
PImage blankMap;
PImage pacMan;

//pX = pacman.get(x);

void setup(){
  size(640,480);
  smooth();
  pacMan = loadImage("pacman_LEFT_open.png");
  pacman = new Pacman(318,254);
  blankMap = loadImage("pacman_blankmap.png");
  imageMode(CENTER);
  //frameRate(8);
  
  
  
}

void draw(){
  image(blankMap,width/2,height/2);
  image(pacMan,318,254);
  //pacman.display();
  pacman.ColMap();
  pacman.update();
  if(keyCode==LEFT){
      image(blankMap,width/2,height/2);
       pacman.displayL();
     }
  if(keyCode==RIGHT){
      image(blankMap,width/2,height/2);
       pacman.displayR();
     }
  if(keyCode==UP){
      image(blankMap,width/2,height/2);
       pacman.displayU();
     }
  if(keyCode==DOWN){
      image(blankMap,width/2,height/2);
       pacman.displayD();
     }

}

