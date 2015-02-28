
//rectangulos fijos
void setup () {
size (800,600);
background (0);
smooth ();

}

void draw () {


strokeWeight (5);
stroke (random(255),random(255),random(255),15);
for(int i=mouseX; i<800; i+= 1000) {
  for(int j=mouseY; j<800; j+=5000){
strokeWeight(2);
line (i, 600,j, 0);}}


}

