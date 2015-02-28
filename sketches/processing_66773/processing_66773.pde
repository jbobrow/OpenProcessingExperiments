

int []c = new color [10];

void setup(){
  size(500, 500);
  noStroke();
  background(255);
  
  c[0] = color(86, 116, 185);
  c[1] = color(69, 140, 203);
  c[2] = color(126, 167, 216);
  c[3] = color(132, 147, 202);
  c[4] = color(136, 130, 190);
  c[5] = color(161, 135, 190);
  c[6] = color(244, 154, 194);
  c[7] = color(246, 152, 157);
  c[8] = color(247, 151, 122);
  c[9] = color(249, 173, 129);



}
 
void draw(){

   for (int x = 25; x< width; x += 50) {
     for(int y = 25; y < height; y +=50){
     fill(c[x/50]);
     ellipse(x, y, 50, 50);
     }
  }
 }




