
float x=0, y, angle,radius, a,b,c;

void setup(){
  size(700,700);
  x += 0.9;
  y= 80;
  angle =0;
  smooth();
  noStroke();
 
  
}
void draw(){
  

  x = cos(radians(angle)) * radius +width/2;
  y = sin(radians(angle)) * radius + height/2;
  
  angle++;
radius = radius + .28;
for (int i = 0; i <260; i += 40) {
  for (int j = 0; j < 260; j += 50) {
    float begin = 150+ (sin(angle) * radians(j));
    float end = begin +  PI - HALF_PI;
    arc(330,330,j,i, begin, end);
    ellipse(cos(radians(i + j)) * x, sin(radians(i + j)) * y,10,10);
    fill(y,x,j,i);
    
    if (mousePressed){
      fill(x,i,y);
      ellipse(cos(radians(y-x)) * y, cos(radians(10*angle))*x,50,50);
        x = cos(radians(angle)) * j + 50;
  y = sin(radians(angle)) * i +50;
    }
  }


}
}

