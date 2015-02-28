
int x;
int y;

void setup (){
  size (1200,700);

}


void draw(){
  background(175, 0, 255);

  y = 0;

  while(y < height+100){
    x = 0;
    while (x < width+100){  

      noStroke();

      fill(0, 255, 255);
      rect(x, y, 48, 48);

      fill(0);
      ellipse(x-5,y+5, 25, 25);

      fill(random(255), random(255), random(255));
      ellipse(x,y,25,25);


      x = x + 50;

    }
    y = y + 50;
  }
} 



