

void setup(){
size(800,768);
background(0,0,25);
ellipse(400,50,50,50);
fill(33,35,70);
beginShape();
curveVertex(-300,600);
curveVertex(0,300);
curveVertex(400,80);
curveVertex(800,300);
curveVertex(1100,600);
endShape();
endRecord();
fill(33,75,60);
beginShape();
curveVertex(-200,600);
curveVertex(0,300);
curveVertex(300,80);
curveVertex(700,300);
curveVertex(1100,10);
endShape();
endRecord();
fill(0,0,40);
rect(0,300,800,500);

}
void draw(){
for (int y=300;y<height;y=y+25){
  fill(255);
  rect(375,y,35,5);
}}

