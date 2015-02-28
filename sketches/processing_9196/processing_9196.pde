
void setup () {
  
}



void draw () {
  for (int x=10; x<100; x+=10) {
    for (int y=10; y<100; y+=10){
    fill(x,y,0);
    quad(x,y, 10,20, 20,30, 30,40);
    }
  }
  
  
}

