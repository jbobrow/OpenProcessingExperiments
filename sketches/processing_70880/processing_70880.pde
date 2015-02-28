
float angle1 = PI;
float angle2 = PI*2;
float orig1 = angle1;
float orig2 = angle2;
float dx = 0.5;

void setup(){
  size(500,500);
  smooth();
  noStroke();
  background(0);
}

void draw(){
  background(0);
  dx += 0.2; //speed
  for(int i = 0; i < 11; i++){
    for(int j = 0; j < 11; j++){
      angle1 += (j+i)*0.3;
      angle2 += (j+i)*0.3;
      arc(50+j*40,50+i*40,30,30,angle1+dx,angle2+dx);
      angle1 = orig1;// + 0.001;
      angle2 = orig2;// + 0.001;
    }
  }
}
