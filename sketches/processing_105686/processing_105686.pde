
int rectX[] = new int[100];
color rectColors[] = new color[100];

void setup(){
  size(1000, 100);

  for(int i = 0; i < 100; i++){
    rectX[i] = 0 + 10*i;
    rectColors[i] = color(i*10, 0, 0);
  }
}
void draw(){
  background(255, 255, 0);

  for(int i = 0; i < 100; i++){
    fill(rectColors[i]);
    rect(rectX[i], height/3, 10, 30);
    
  }  
}


