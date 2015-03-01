

float [] py = new float [5000];
float [] px= new float [5000];
void setup() {
size(500,500);

  
  for(int L=0; L<5000 ; L++) {
  
 px[L]= random(500);
  py[L]= random (500);
}
}
void draw(){
  for(int L=0; L<5000 ; L++) {
    point(px[L],py[L]);
    px[L]++;
  }
}
