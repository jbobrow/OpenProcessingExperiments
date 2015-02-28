
int y = 10;   
int x = 50;      
int spacing = 10;   
int len = 20;




void setup () {
  size (200,200);
}
void draw () {
  
  while (y<height) {
    //loop!
    rect(x,y,100,10);
    y=y+20;
  }
}

