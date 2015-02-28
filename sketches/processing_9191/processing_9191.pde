
int xPos = 10;

void setup () {
  
}



void draw () {
  while (xPos < 100) {
    println(xPos);
    line(xPos,10,xPos,90);
    xPos+=10;
  }
  
  println("continuing");
}

