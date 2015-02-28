

 Nodule[] nodules = new Nodule[2];
void setup(){
 size(800,600);colorMode(HSB,100);
 for (int i = 0; i<= nodules.length-1; i++)
 { nodules[i] = new Nodule(); }
            }
            
  void draw(){
   frameRate(12);
   background(100);
for(int i = 0;i <= nodules.length-1; i++)
{  nodules[i].nodules(); }
              }
class Nodule{
  float rd = random(-4,4);
  float x = noise(10)*5; float y = noise(10)*10;
  void nodules(){
  for(int i = 100; i <= width-100; i+=100){
  for(int j = 80; j <= height-60; j +=100){
    int rep = floor(random(1,12));
    float alph = map(rep,1,12,100,50);
    color c =color(random(100),alph*2,alph,alph);
    noFill();stroke(c);
    //mulltiplier par quelque chose pour que alpha - quand rep +
    strokeWeight(rep);
beginShape();
curveVertex(i-rd,j-rd);
curveVertex(i-rd,j-rd);
curveVertex(i+random(-90,90),j+random(-50,40)+rd);
curveVertex(i-10,j+100);
curveVertex(i-10,j+100);
endShape();
}}}}

