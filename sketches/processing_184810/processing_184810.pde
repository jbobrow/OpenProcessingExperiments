
//"MY COLORFUL BRAZILIAN FLAG!"
//Logo Assignment Week 2
//Rafael Gaia
//DMS110

int background_r = 0;
int background_b = 0;
int background_y = 0;

int triangle_r = 0;
int triangle_b = 0;
int trianble_y = 0;

void setup(){
size(800,500);
frameRate(4);
}

void draw(){
   
    background_r=(int)random(256, 10000)%255;
    background_b=(int)random(256,10000)%255;
    background_y=(int)random(256,10000)%255;
      background(background_r,background_b,background_y);
  
    triangle_r=(int)random(256, 10000)%255;
    triangle_b=(int)random(256,10000)%255;
    trianble_y=(int)random(256,10000)%255;
      fill(triangle_r,triangle_b,trianble_y);
      triangle(400,100,400,400,150,250);
      fill(triangle_r,triangle_b,trianble_y);
      triangle(400,100,400,400,650,250);

fill((triangle_r%150),(background_b%150),(background_y%150));
ellipse(400,250,160,160);
}
