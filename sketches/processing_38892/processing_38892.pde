
void setup () {
  size (400, 600);
  noStroke ();
}

void draw () {
  for (int X=0; X<400; X=X+10) {
    for (int Y=0; Y<600; Y=Y+10) {
       fill(random(255),random(255));
      rect (X, Y, 10, 10);
     }   
  }
}


