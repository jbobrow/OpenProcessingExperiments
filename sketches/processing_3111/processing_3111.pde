


float size = size=.7, x=0, y=0, theta=0,dec=.8,inc=1,velx,vely, po=1;

void setup(){

  size(400,400);
  ellipseMode(CENTER);
  colorMode(HSB,255,255,255,255);
  noStroke();
  smooth();
  noiseDetail(14);
}

void draw(){
fill(0,0,0,2);
rect(-5,-5,width+5,height+5);
theta+=.02;
x= (sin(theta*po)*((width/2-10)*cos(theta)+width/2))*.5+width/2;
y= (cos(theta*3)*((height/2-10)*sin(theta)+height/2))*.5+height/2;
for(int i=1; i<30; i++){
  fill(255*sin(radians(theta)),255,255,122/i);
  ellipse(x,y,size*i,size*i);
}
if(mousePressed){
  po = random(1,4);
}
}



