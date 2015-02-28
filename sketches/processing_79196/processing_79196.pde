
int marches=22;
float cours=11.3;
int pied=42;
int px=0;
int py=0;

void setup () {
size(500,500);
background(255);
strokeWeight(10);
marches=50+pied;
rect(220,170,100,marches);
strokeWeight(1);
rect(200,150,100,50);
frameRate(2);

}
void draw () {
  //if(mousePressed){
  background(255);
  rect(mouseX,mouseY,100,50);
  //}
  px=mouseX;
  py=mouseY;
}








