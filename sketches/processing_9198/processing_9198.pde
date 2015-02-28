
void setup () {
  size (500, 500);
  
}



void draw () {
  for (int x=10; x<500; x+=10) {
    for (int y=10; y<500; y+=10){
    float redVal = map(x,0,90,0,255);
    float blueVal = map(y,0,90,0,255);
    /*above statement scales window (0-90) up to (0-255) now shows the entire 
    colour spectrum which is between 0-255*/
    fill(x,y,0);
    quad(x,y, 10,20, 20,30, 30,40);
    }
  }
  
  
}

