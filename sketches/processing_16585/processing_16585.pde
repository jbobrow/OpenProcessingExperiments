
int halfcir, wCen, yCen, clocir, halfcir1, halfcir2 ; 
PImage a; PImage b; 
PImage c; PImage d;
  
void setup(){ 
  size(360,600); 
  smooth(); 
    a= loadImage("star.jpg"); 
    b = loadImage("earth.png"); 
    c = loadImage("moon.png"); 
    d = loadImage("planet.png");
  imageMode(CENTER); 
    
} 
void draw(){
image(a,150,400,500,800);
image(b,180,250,260,260);
image(d,300,100,70,70);
      
wCen = 180; 
yCen = 250; 
  fill(0); 
  stroke(255); 
  strokeWeight(5); 
  smooth(); 
      
  float s = map(second(), 0,60,0 , TWO_PI) - HALF_PI; 
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() % 12, 0, 12,0, TWO_PI) - HALF_PI; 
  stroke(255); 
  clocir =230; 
  halfcir = 110; 
  halfcir1 = clocir/2+40; 
  halfcir2 = clocir/2-50; 
    
  strokeWeight(2); 
  line(180,250, cos(s) * halfcir1 +  wCen, sin(s) * halfcir1 +yCen); 
  strokeWeight(5); 
  line(180,250, cos(m) * halfcir + wCen, sin(m) * halfcir + yCen); 
  strokeWeight(9); 
  line(180,250, cos(h) * halfcir2 + wCen, sin(h) * halfcir2 +yCen); 
  image(c, cos(s) * halfcir1 +  wCen, sin(s) * halfcir1 +yCen, 30,30);
 
}

