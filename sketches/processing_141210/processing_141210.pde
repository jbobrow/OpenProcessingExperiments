
/*
Konkuk University
SOS iDesign

Name: KIM Sung Uk
ID: KIM Sung Uk

*/

void setup(){
size (600, 600);
// noLoop();
smooth();
}
int value = 0;
void draw(){
  fill(252,136,113);
  noStroke();
  quad(389,168,329,600,463,600,459,600);
  quad(154,369,0,249,0,368,90,512);
  stroke(231,58,25);
  fill(252,136,113);
bezier(412,22,276,50,157,408,71,534);
bezier(412,22,427,48,415,89,391,123);
bezier(388,421,453,366,541,298,600,275);
line(456,561,600,368);
noStroke();
quad(456,561,387,426,600,274,600,368);
quad(412,22,71,534,64,598,322,600);
quad(389,157,270,600,392,600,389,157);
stroke(231,58,25);
line(154,369,0,249);
line(90,512,0,368);
stroke(231,58,25);
noFill();
bezier(391,123,392,201,394,288,418,388);


  stroke(0);
strokeWeight(5);
line(245,178,277,166);
line(277,166,249,188);
line(249,188,277,176);
line(315,179,342,198);
line(315,179,334,207);
line(308,187,334,207);

fill(value);
strokeWeight(3);
ellipse(234,282,80,120);
ellipse(300,282,80,120);

fill(0);
strokeWeight(3);
ellipse(240,280,20,30);
ellipse(290,280,20,30);
noFill();
bezier(191,390,232,435,300,439,354,384);


if(mousePressed){
 
fill(mouseX,100,mouseY,100);  
 bezier(140,183,109,156,99,192,140,255);
 bezier(140,183,171,160,188,219,140,255);
 
  
    float a=random(100);
    float b=random(255);
    float c=random(255);


fill(constrain(mouseX,mouseY,a),b,c);
    strokeWeight(5);
    ellipse(pmouseX,pmouseY,100,100);
 
 

 
}

}
void keyPressed(){
setup();
 
}
void mouseDragged() 
{
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}
void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  println(e);
}
