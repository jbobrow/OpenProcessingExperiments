

int circleX[]= new int [100];
color circleColors[] = new color[100];
 
void setup(){
  size(600, 600);
 
  for(int i = 0; i < 100; i++){
    circleX[i] =10+ 20*i;
    circleColors[i] = color(i*20, i*10, i*9, 40);
  }
}
void draw(){
  background(247, 230, 244);
  noStroke();
  for(int i = 0; i < 100; i++){
    fill(circleColors[i]);
    ellipse(circleX[i],i, 30, 30);
    ellipse(circleX[i],i, 20, 20);
    ellipse(i,circleX[i], 30, 30);
    ellipse(i,circleX[i], 20, 20);
    ellipse(circleX[i],circleX[i], 30, 30);
    ellipse(circleX[i],circleX[i], 20, 20);
  } 
}



