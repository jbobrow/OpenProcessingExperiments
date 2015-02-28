
float x = random(350);
float y = random(350);
int color_a =(50);
float count = random(200-350);
float num = 500;
int counter = 0;

void setup(){  
  size(300,300);
  background(255);
  stroke(num/3);
  smooth();

}

void draw(){

  while(counter < num){
  counter++;
  float count = random(200-300);
  fill (color_a,50,50,50);
  ellipse(x, y, count, count); 
    x = random(350);
    y = random(350);
    fill (color_a);
}}




