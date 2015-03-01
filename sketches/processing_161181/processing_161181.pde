
size(400,700);

//SLIME!!
background(0);

//for(float x = 0; x<width;x+=0.0825){
//  float y = cos(x*.1) * 135 + height/2;
//  stroke(0,200,0,50);
//  strokeWeight(1.5);
//  line(x,y,x-1,0);
//  stroke(67,0,180,50);
//  line(x-10,y-10,x-1,0);
//  stroke(167,0,60,50);
//  line(x-20,y-20,x-1,0);
//  stroke(167,255,60,10);
//  line(x-30,y-30,x-1,0);
//}

for(float x = 0; x<width;x+=0.1){
  float y = cos(x*.1) * 118 + height/1.8 + 150;
  stroke(0,200,0,10);
  strokeWeight(1.5);
  line(x,y,x-1,0);
  stroke(67,0,180,20);
  line(x-10,y-10,x-1,0);
  stroke(167,85,60,20);
  line(x-20,y-20,x-1,0);
  stroke(167,255,160,10);
  line(x-30,y-30,x-1,0);
}
PFont avenir = loadFont("AvenirNext-UltraLight-48.vlw");
textFont(avenir);
textSize(20);
textAlign(CENTER);
text("Wavy Gravy", 200, 680);


