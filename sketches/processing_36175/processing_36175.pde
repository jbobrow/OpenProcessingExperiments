
size(700,1000);
background(#000033);

smooth();


for (int i = 0 ; i<height; i++){
  float water = map (i, 0, 700, 20, 255);
  strokeWeight(1);
  stroke(0, 0, water);
  line (0,i+700,width, i+700);

}
noStroke();
//Stars
for (int star = 0 ; star < 60 ; star++) {
  
  //Star Properties
  float starSize = random (1,4);
  float starX = random (0, width);
  float starY = random (0, height-400);
  float starBright = map (star, 1, height, 100, 255);
  float starGlow = random (50, 200);

  //Draw Stars
    fill (255, 255, 255, starGlow);
  ellipse (starX,starY,starSize,starSize);

  float reflection = map (star, 0, 600, 750,2000);
  fill (255, 255, 255, starGlow/3);
  ellipse (starX,reflection, starSize,starSize);

}

//Moon
//Moon Axis
float moonR = random (PI , TWO_PI);

//Moon Location
float moonX = random (50, width+100*cos(moonR));
float moonY = random (100, (height-600)+100*sin(moonR));
//Shadow Location
float moonS = random (moonX-100, moonX+100);
float moonSY = random (moonY-100, moonY+100);

//Draw Moon
fill(#FFFFCC);
ellipse (moonX, moonY, 100, 100);
fill(#000033);
ellipse (moonS, moonSY, 100, 100);

for (int moon1 = 0 ; moon1 < 1 ; moon1++) {
  

  
  float moonRY = map (moon1, 0, 600, 800, 1200);
  float moonTY = map (moon1, 0, 600, 780, 1220);
  fill (255, 255, 255, 80);
  ellipse (moonX,moonRY, 100,50);
  fill(0,0, 40);
  ellipse (moonS,moonTY, 100,50);
}               
