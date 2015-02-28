
PImage damon;
int i,x,y,w=640,h=279;

void setup() {
  size(640,279);
  noStroke();
  
  damon = loadImage("celebrityyearbook.jpg");
  
}

void draw() {
  
 for(i=0;i++<w*h;)
set((x=i%w)^mouseX,(y=i/w)^mouseY,damon.
get(x,y));

 fill(mouseY, 208, mouseX);
  
  rect(93, 50, 18, 200);
  rect(65, 100, 75, 18);

  rect(516, 50, 18, 200);
  rect(487, 100, 75, 18);
}
  

