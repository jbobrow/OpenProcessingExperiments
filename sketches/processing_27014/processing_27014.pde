
void setup(){
size(600, 600);
smooth();
background(253,60,42);
//138,3,7
//254,166,44
}

void draw(){

strokeWeight(.02);
stroke(35,87,100);
//204,160,1
for(int i = 0; i <600; i +=40) {
  for (int j = 0; j<600; j += 40) {
 noFill();
  ellipse(i, j, 300, 140);
  //fill(0,271,0,.9);
  fill(158,10,207,1);
 ellipse(i,j+5,90,100);

  }
}
}

