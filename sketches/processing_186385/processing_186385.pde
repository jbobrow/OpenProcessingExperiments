
void setup(){
  size(600,600);
colorMode(HSB);
}

void draw (){
for(int i=0; i<(mouseX); i=i+10) {
//println(i);

noStroke();
fill (0, i, 200);
//fill (random(1-255),255,i/10);

float algo = (mouseX-(width/2))*0.01;

ellipse(300, 300, width/algo, width+i++);

}
}

