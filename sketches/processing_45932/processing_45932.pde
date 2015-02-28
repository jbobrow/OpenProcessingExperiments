
PImage damon;
int i,x,y,w=450,h=608;

void setup() {
  size(450,608);
  noStroke();
  
  damon = loadImage("HollywoodYearbook.jpg");
  
}

void draw() {
  
 for(i=0;i++<w*h;)
set((x=i%w)^mouseX,(y=i/w)^mouseY,damon.
get(x,y));

 fill(mouseY, 208, mouseX);
  rect(350, 350, 18, 200);
  rect(312, 400, 95, 18);
  
  rect(50, 50, 18, 200);
  rect(12, 100, 95, 18);
}
  

