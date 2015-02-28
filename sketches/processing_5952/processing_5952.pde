
int x;
int y;

void setup(){
  size(600,600);
}

void draw(){
  background(180,70,40);

       
  y = 0;

  while(y < 640){
     x = 0;
    while( x < 640){

      fill(10,240,242);
      ellipse(x,y, 100, 100);
      fill(109,150,155);
      ellipse(x, y, 80, 80);
      fill(180,100,100);
      ellipse(x, y, 40,40);
      x = x + 50;
    }
    y = y + 150;
  }


}



