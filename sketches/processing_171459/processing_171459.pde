
int R;

void setup(){
    size(600,300);
    background(#900090);
    frameRate(5);//

colorMode(RGB);
fill(255,0,255,25);
int diameter,x;
noStroke();
diameter = 200;
for(x=0; x<16; x++){
    ellipse(150,150,diameter,diameter);
    diameter = diameter - 7;
}


}


void draw(){
  fill(random(255),random(255),random(255));
  rect(300,0,600,300);



fill(#9400d3);

     beginShape();
for (int i = 0; i < 4; i++) {
if (i % 2 == 0) {
R = 40;
}
else {
R = 80;
}
vertex(width/2+R*cos(radians(90*i)), height/2+R*sin(radians(90*i)));
}
endShape(CLOSE);

colorMode(RGB);
fill(255,0,255,25);
int diameter,x;
noStroke();
diameter = 100;
for(x=0; x<16; x++){
    ellipse(450,150,diameter,diameter);
    diameter = diameter - 7;
}
}


