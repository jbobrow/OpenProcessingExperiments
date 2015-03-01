
int dim;

void setup() {
  size(600, 600);  
}

void draw() {

background(230);
noStroke();
translate(width/2-250, height/2-250);
for(int i=0; i<20; i++){
scale(.95);
fill(200-10*i+20,0,(i>=10)?(20*(i-10)):0);
ellipseMode(CENTER);
beginShape();
ellipse(width/2, height/2, 300, 300);
endShape(CLOSE);
}
noLoop();

//if (frameCount%2==0 && frameCount<121) saveFrame("image-###.png");

}



