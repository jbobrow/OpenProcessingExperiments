
Egg egg;
Speck[] specks; 
Sperm sperm;



void setup() {
  size(640, 480);
  
 
  specks= new Speck [18];
  for (int i=0; i < specks.length; i++) {
    specks [i] = new Speck (color(119, 136, 119), random(width), random(height), random(13));
  }

  
  egg= new Egg();
  sperm= new Sperm();
  frameRate(55);
  
}

void collision() {
  
  if ((abs(sperm.spermPosition.x - egg.eggPosition.x) < 15)
  && (abs(sperm.spermPosition.y - egg.eggPosition.y) < 15))
  {
    egg.eggSizeX+=150;
    egg.eggSizeY+=150;
    egg.mideggSizeX+=75;
    egg.mideggSizeY+=75;
  }
  else {
    println("NO");
  }
}


void draw() {
  background(238, 180, 180);
    for (int i = 0; i < specks.length; i++) {
    specks[i].speckMove();
    specks[i].display();
  }
  
  collision();
  
  egg.update();
  egg.checkPos();
  egg.display();
  
  
  sperm.checkPos();
  sperm.draw();
  sperm.keyPressed();
  sperm.update();
  sperm.display();
  
  
  
}



  
  

  
  

  
  

