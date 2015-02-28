
float[] x = new float[3000];
PImage a, b, c, d,e,f;
 

int wCen, yCen, cloCir, halfCir1, halfCir2, halfCir3;
void setup() {
  size (360,600);
  stroke(255);
  smooth();
  a= loadImage("222.png");
  b= loadImage("d4.jpg");
  c= loadImage("d10.png");
  d= loadImage("d3.png");
  e= loadImage("moon.png");
  f= loadImage("star.png");
  noStroke();
fill(255,200);
for (int i = 0; i < x . length; i ++) {
  x[i] = random(-1000,200);
}
}

void draw () {
  background(150); 
  image (b, 180,300);
  
 fill(198,143,172);
noStroke(); 
  for (int i = 0 ; i < x.length ; i++){
    x[i]+=0.3;
    float y = i * 3;
    image(f, x[i],y);
}
 
  wCen  = width/2;
  yCen = height/2-100;
  cloCir = 250; 
  halfCir1 = cloCir/2 - 2 ;
  halfCir2 = cloCir/2 -10 ;
  halfCir3 = cloCir/2 - 40 ;
 
  //moon
  noStroke();
  image (e, wCen,yCen, cloCir,cloCir);
  
  float s = map (second(), 0, 60, 0, TWO_PI) - HALF_PI; 
  float m = map(minute(), 0,60,0,TWO_PI) - HALF_PI; 
  float h =map(hour()%12, 0, 12, 0, TWO_PI)- HALF_PI; 
  
  //littlep
 
  imageMode(CENTER);
  image(a, cos(s) * halfCir1 + wCen, sin(s) * halfCir1 + yCen);
  
  //rose  
  
  image(c, cos(m) * halfCir2 +wCen, sin(m) * halfCir2+ yCen);
 
  //fox
  
  image(d, cos(h) * halfCir3 + wCen, sin(h) * halfCir3 + yCen);

}




