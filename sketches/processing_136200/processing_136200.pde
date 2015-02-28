
int myState = 0 ;
int myCounter = 120 ;
 
PImage parrots;
PImage cabana;
PImage path;
PImage rocks;
PImage pirate;
PImage sisters;
PImage hotel;
PImage water;
PImage hut;
PImage pool;
PImage homes;
 
void setup() { 
  size(800, 325);
 
  parrots = loadImage("parrots.jpg");
  cabana = loadImage("cabana.jpg");
  path = loadImage("path.jpg");
  rocks = loadImage("rocks.jpg");
  pirate = loadImage("pirate.jpg");
  sisters = loadImage("sisters.jpg");
  hotel = loadImage("hotel.jpg");
  hut = loadImage("hut.jpg");
  water = loadImage("water.jpg");
  pool = loadImage("pool.jpg");
  homes = loadImage("homes.jpg");
}
 
void draw() {
  myCounter = myCounter - 1 ;
  if (myCounter < 0) {
    myState = myState + 1 ;
    if (myState > 10) {
      myState = 0 ;
    }
    myCounter = 120 ;
  }

  background(255);
  switch(myState) {
  case 0:
    image(water, 0, 0);
    break;
 
  case 1:
    image(cabana, 0, 0) ;
    break;
 
  case 2:
    image(path, 0, 0) ;
    break;
 
  case 3:
    image(rocks, 0, 0) ;
    break;
 
  case 4:
    image(pirate, 0, 0) ;
    break;
    
  case 5:
  image(sisters, 0, 0);
  break;
  
  case 6:
  image(hotel, 0, 0);
  break;
  
  case 7:
  image(hut, 0, 0);
  break;
  
  case 8:
  image(parrots, 0, 0);
  break;
  
  case 9:
  image(pool, 0, 0);
  break;
  
  case 10:
  image(homes, 0, 0);
  break;
  }
}



