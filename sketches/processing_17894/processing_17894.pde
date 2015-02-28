
float x,y,a,i;void setup(){size(800,800);background(150);strokeWeight(0.3);smooth();a=-PI/2;x=y=400;}
void draw(){i=random(-.01,.01);for(int j=1;j<500;j++){x+=cos(a);y+=sin(a);ellipse(x,y,5,5);a+=j*i;}}
void mouseClicked(){setup();}




