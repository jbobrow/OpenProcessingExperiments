
void setup() {
size(600,600);
background(0);
colorMode(HSB);
}
void draw() {

for(int i =700; i>0; i--){
   stroke((i/2)+(mouseY/3),255,255);
   ellipse(38,65,i,i);
   rotate(i);
   }
  }
