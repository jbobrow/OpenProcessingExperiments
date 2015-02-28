
/*
Konkuk University
SOS iDesign

Name: Gwang il
ID: 201420094

*/
PImage img;
void setup(){
  setupAudio();
size (600, 600);
// noLoop();
smooth();
colorMode (RGB, 600);

}

void draw(){
println(mouseX + " : " + mouseY);

// here you add your code with all shapes and colors. 
strokeWeight(10);
fill(117.5,260,456);
ellipse(297.5,331,553.14,421.72);

strokeWeight(10);
fill(600,600,600);
ellipse(185.89,137.89,146,146);
   
float mx1= constrain(mouseX,162,214);
float mx2= constrain(mouseX,301,357);
float my1= constrain(mouseY,106,172);
float my2= constrain(mouseY,77,144);
fill(0,0,0);
ellipse(mx1,my1,58,58);

strokeWeight(10);
fill(600,600,600);
ellipse(330.47,109.53,146,146);

fill(0,0,0);
ellipse(mx2,my2,58,58);

getVolume();
float Y = map(volume, 0, 200, 2, 100); 
float X = map(volume, 0, 200, 2, 200);

fill(600,0,0);
bezier(99,331,120,Y,541,Y,514,329);

if (mousePressed){
  fill(458.25,274.95,96.35);
  ellipse(mouseX,mouseY,240,240);
  noStroke();
  stroke(1);
  fill(0,0,0);
  ellipse(mouseX+10,mouseY+10,50,50);
  fill(0,0,0);
  ellipse(mouseX+70,mouseY+50,20,20);
  ellipse(mouseX+10,mouseY-70,30,30);
ellipse(mouseX-60,mouseY-50,10,10);
ellipse(mouseX+50,mouseY-90,5,5);
ellipse(mouseX+50,mouseY-30,15,15);
ellipse(mouseX-60,mouseY+30,20,20);
ellipse(mouseX+10,mouseY+80,20,20);
}
}
