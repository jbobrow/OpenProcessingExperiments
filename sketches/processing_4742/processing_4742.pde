
float ang=0;int mx,my;

void setup(){
  size(500,500);
  mx=width/2;my=height/2;
  background(0);
  strokeWeight(5);
  fill(0,50);
}

void draw(){ 
  noStroke();
  rect(0,0,width,height);
  stroke(255,100); 
  float ray=2;
  ang-=5.1;
  for(int i=0;i<650;i++){ 
    ray*=1.0022;
    ray+=0.16;
    float maxray=ray*2.5;
    float a=radians(ang+i);
    point(mx+ cos(a)*random(ray,maxray),my+sin(a)*random(ray,maxray)); 
  }
}


