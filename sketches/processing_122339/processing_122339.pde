
PImage bild;
int counter = 0;
float x = 0;
float y = 0;
int cs = 5;
void setup (){
  size (566,585);
  smooth();
  frameRate(1500);
  bild = loadImage("bild.jpg");
  background (0);
}
 
void draw (){
 // image(bild,0,0);
 for(int j = 0; j<=height/cs;j++){
for(int i = 0; i<=width/cs;i=i+1){
color farbe = bild.get(i*cs,j*cs);
fill(farbe);
pushMatrix();
 
float b = red(farbe);
strokeWeight(3);
fill(165,042,042);
ellipse(i*cs,j*cs,b/60,b/60);
translate(3,0);
b = green(farbe);
fill(0,100,0);
strokeWeight(3);
ellipse(i*cs,j*cs,b/60,b/60);
translate(0,3);
b = blue(farbe);
fill(000,104,139);
strokeWeight(3);
ellipse(i*cs,j*cs,b/50,b/50);
translate(0,3);

popMatrix();
 
noStroke();
x = mouseX+sin(frameCount/125.0)*40;
y = mouseY+cos(frameCount/125.0)*40;
 
noStroke();
float x2 = x+sin(frameCount/40.0)*50;
float y2 = y+cos(frameCount/20.0)*50; 
 fill(bild.get(int(x2),int(y2)),90);
 
 
float x3 = x2+sin(frameCount/ 2.0)*90;
float y3 = y2+cos(frameCount/9.0)*50;
 fill(bild.get(int(x3),int(y3)),80);
 ellipse(x3,y3,2,2);
stroke(bild.get(int(x),int(y)),50);

 float x4 = x3+sin(frameCount/10.0)*80;
float y4 = y3+cos(frameCount/10.0)*80; 
 fill(bild.get(int(x4),int(y4)),100);
   ellipse(x4,y4,2,2);

  float valueX = x2+brightness(255);
    float valueY = y2+brightness(255);
 fill(bild.get(int(valueX),int(valueY)),60);
 ellipse(valueX,valueY,2,2);

}
}}


