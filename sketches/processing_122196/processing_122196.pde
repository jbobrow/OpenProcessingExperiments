
PImage bild;
int counter = 0;
float x = 0;
float y = 0;
int cs = 5;
void setup (){
  size (640,480);
  smooth();
  frameRate(1500);
  bild = loadImage("Fantasy-Gesicht-Kunst-480x640.jpg");
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
noStroke();
strokeWeight(5);
fill(100,100,0);
ellipse(i*cs,j*cs,b/60,b/60);
translate(3,0);
b = green(farbe);
fill(0,180,30);
strokeWeight(5);
ellipse(i*cs,j*cs,b/60,b/60);
translate(0,3);
b = blue(farbe);
fill(0,20,200);
strokeWeight(5);
ellipse(i*cs,j*cs,b/50,b/50);
popMatrix();

noStroke();
x = mouseX+sin(frameCount/125.0)*40;
y = mouseY+cos(frameCount/125.0)*40;

noStroke();
//ellipse(x,y,random(1,5),random(1,5));

float x2 = x+sin(frameCount/40.0)*40;
float y2 = y+cos(frameCount/20.0)*40;
 
 fill(bild.get(int(x2),int(y2)),50);
//ellipse(x2,y2,10,10);

float x3 = x2+sin(frameCount/ 2.0)*60;
float y3 = y2+cos(frameCount/9.0)*150;
 
 fill(bild.get(int(x3),int(y3)),100);
 ellipse(x3,y3,2,2);
stroke(bild.get(int(x),int(y)),250);
}
}
 }




