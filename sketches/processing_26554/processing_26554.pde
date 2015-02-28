
void setup() {
  size(600,600);
    background(43,64,42,40);
}

void draw() {

  
  for(int i=0; i<600; i=i+10){
    for(int j=0; j<600; j = j+30) {
 
    textSize(35);
    fill(0,0,0,200);
    text("C", i, j);
    fill(25,0,0,10);
    ellipse(i,j,30,30);
    fill(81,152,92,8);
    triangle(0,i,600,300,0,600);
    fill(157,28,8,8);
    triangle(0,i,0,300,0,0);

  }}}
  
  

