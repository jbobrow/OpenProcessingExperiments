
void setup(){
  size(600,600);
}

void draw(){
  float s = map(second(), 0, 60, 0,600);
  float m = map(minute(), 0, 60, 0,600);
  int x = minute() % 10;
  int y = x * 100 - 100;
  int l = y + 100;
  if (x == 1)
  {
     stroke (124,53,71);
     strokeWeight (2);
     line (s, y, s,l);
     stroke (124,253,71);
     strokeWeight (2);
     line (m, y, m,l);
  }else if (x == 2){
     stroke (124,53,71);
     strokeWeight (2);
     line (s, y, s,l);
     stroke (124,253,71);
     strokeWeight (2);
     line (m, y, m,l);
  }else if (x == 3){
     stroke (124,53,71);
     strokeWeight (2);
     line (s, y, s,l);
     stroke (124,253,71);
     strokeWeight (2);
     line (m, y, m,l);
  }else if (x == 4){
     stroke (124,53,71);
     strokeWeight (2);
     line (s, y, s,l);
     stroke (124,253,71);
     strokeWeight (2);
     line (m, y, m,l);
  }else if (x == 5){
     stroke (124,53,71);
     strokeWeight (2);
     line (s, y, s,l);
     stroke (124,253,71);
     strokeWeight (2);
     line (m, y, m,l);
  }else if (x == 6){
     stroke (124,53,71);
     strokeWeight (2);
     line (s, y, s,l);
     stroke (124,253,71);
     strokeWeight (2);
     line (m, y, m,l);
  }
}




