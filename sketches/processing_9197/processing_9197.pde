
void setup () {
  size (500, 500);
}



void draw () {
  
  
  
}
void mousePressed () {
  
  for (int x=10; x<500; x+=10) {
    for (int y=10; y<500; y+=10){
    fill(x,y,0);
    quad(x,y, 10,20, 20,30, 30,40);
    }
  }
}

