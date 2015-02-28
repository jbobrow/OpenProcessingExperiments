
PImage comb;
PImage OldMan;
PVector combPos;

void setup() {
  size(600,600);
  comb = loadImage("comb.png");
  OldMan = loadImage("oldMan.jpg");
  combPos = new PVector(width/2, height/2);
  smooth();
  noStroke();
}

void draw () {
  background(OldMan);
  image(comb, combPos.x, combPos.y, 104,45);
}

void keyPressed() {
  println(keyCode) ;

  switch(keyCode) {
    case 38:
    combPos.y = combPos.y - 15;
    println("UP") ; 
    break; 
    
    case 39: 
    combPos.x = combPos.x + 15;
    println("RIGHT") ;
    break ;
    
    case 40:
    combPos.y = combPos.y + 15;
    println("DOWN") ; 
    break; 
    
    case 37:
    combPos.x = combPos.x - 15;
    println("LEFT") ; 
    break ;
  }
}


