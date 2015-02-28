
int x;
int y;

void setup(){
  size(600,600);
}

void draw(){
  background(0,200,20);

       
  y = 0;

  while(y < 640){
     x = 0;
    while( x < 640){

      fill(181,240,242);
      ellipse(x,y, 100, 100);
      fill(119,153,155);
      ellipse(x, y, 80, 80);
      fill(100,200,220,50);
      ellipse(x+20,y+20,200,200);
      x = x + 60;
    }
    y = y + 30;
  }
 
}


