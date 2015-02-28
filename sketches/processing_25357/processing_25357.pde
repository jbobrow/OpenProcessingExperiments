
size(400,400);
background(0);
smooth();

stroke(255,120);
translate(60,30);

//drawing 75 rect, it wil start at zero, then up to zero
// ++ it adds one, means -> i + 1


for(int i =0; i < 75; i ++){
  
  strokeWeight(i);
  fill(0);
  // when rotating, we are using the radiants value ie. in Pi form (PI)
  rotate(PI/30);
  rect(180,175,14,19);
  
}

for (int i=0; i < 28; i++){
  strokeWeight(8);
  rotate( PI/12);
  rect(25,35,185,105);
 
}

PFont font;
  smooth();
  font = loadFont ("ColonnaMT-48.vlw");
  textFont(font,55);
  fill (0);
  text (" tik tok", 395,350);
  textSize(35);




