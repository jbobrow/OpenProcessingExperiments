
float angle = 0.0; 
float offset = 300; 
float scalar = 50; 
float speed = 1; 
PFont font; 
int mx = 300;
int my = 300;
int radius = 40;
int redText = 0;
int blueText = 255;
int greenText = 255;

void setup(){
 
size(600, 600);
background(0);
smooth();
font = loadFont("ArialRoundedMTBold-120.vlw");
textFont(font); 
}

void draw(){
speed = map(mouseX,0,width,0.0,1);
scalar = map(mouseY, 0, height, 0, 100);

   background(255);
  for (int i = 2; i < 400; i += 8) { 
    stroke(230,0,0);
//strokeWeight(5);
smooth();

noFill();
strokeWeight(1);
//line(0,350,700,350);
//line(350,0,350,700);
  float x = offset + cos(angle) * scalar; 
  float y = offset - sin(angle) * scalar; 
  ellipse( x, y, i, i); 
  angle += speed; 
 // scalar += speed; 
} 

textSize(75);
text("SCHEINING",83,325);
 float d = dist(mouseX, mouseY, mx, my);
  if (d < radius) { 
     float sinval = sin(angle); 
     float gray = map(sinval, -1, 1, 0, 255); 
fill(230,0,0,gray);
  } else{
  fill(255);
}
/*if(d < radius && mousePressed == true ){
  link("http://www.scheiningmusic.com", "_new"); 

  } else{
  fill(255);
//stroke(255);


}*/
}


