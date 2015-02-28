
float pct[] = {.07,.06,.36,.36,.35};
void setup (){
  background(0);
  size(800,800);
  smooth();
}

void draw (){
  background (0);
  float position= 0;
  for(int i = 0; i < pct.length; i++){
    float nextPos = position + 360 * pct[i];
    arc(width/2,height/2,300,300, radians(position), radians(nextPos));
    position = nextPos;
  }
}
