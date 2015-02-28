
PFont font;

void setup (){
size (250, 250);
background (0);
smooth ();
noStroke ();

font=loadFont ("MarkerFelt-Thin-48.vlw");
textFont (font);

strokeWeight(1);
    
stroke(250,100);
for(
int a=0; a<280; a+=5)
for(
int b=0; b<280; b+=5)
{
  line(a, b, a + random (1, 5), b+5);
  line(a, b, a + random (1, 5), b+5);
  //random lines for texture
}


for(int y=0; y<=height-10; y+=30) {
  for(int x=0; x<=width-10; x+=30) {
    fill (random (y), 130,x, 100);
    ellipse (x, y, 40, 40);
    //circles for pattern using random colors
  }
  }
}

void draw (){
  
  float weight= dist(mouseX, mouseY, pmouseX, pmouseY);
  //draw following the mouse
  if (mousePressed){
textSize (random(5,50));
fill (random(0,100), random (50,100));
text ("5K8",pmouseX, pmouseY);
//change when mouse pressed
  }else{
    textSize (random(5,50));
fill (random (0,100),random(50, 100));
text ("L1C", pmouseX, pmouseY);
//change upon mouse release
}}
  


