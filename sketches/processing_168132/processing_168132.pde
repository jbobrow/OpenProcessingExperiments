
PImage ballet;
float[] tx = new float[100];
float[] ty = new float[100];
int i=0;
int count = 0;
boolean skirtUP = false;
boolean skirtDOWN = false;
float x,y,z;

void setup(){
  size(503,921,P3D);
  ballet = loadImage("dance.jpg");
  x = width/2;
  y = height/2;
  z = 0;
}

void draw(){
  
  translate(0,0,z);
  image(ballet,0,0);
  
  noStroke();
  fill(255);
  quad(156,430,180,550,10,900,10,100);
  quad(234,420,267,510,460,510,400,350);
  fill(255,0,0);
  beginShape(TRIANGLE_FAN);
  vertex(194,428);
  for(int j=0; j<count; j++){
    vertex(tx[j],ty[j]);
  }
  vertex(194,428);
  endShape();
    
  for(int j=1; j<count; j++){
    PVector a = new PVector (tx[j]-194,ty[j]-428);
    PVector b = new PVector (tx[j-1]-194,ty[j-1]-428);
    float ar = sqrt(a.x*a.x+a.y*a.y);
    float br = sqrt(b.x*b.x+b.y*b.y);
    float alpha = PVector.angleBetween(a,b);
    float o = ar*br*sin(alpha);
    float c = map(o,0,10000,50,225);
    float c1 = map(mouseX, 0,500,150,255);
    fill(c1,c,c);
    triangle(194,428,tx[j],ty[j],tx[j-1],ty[j-1]);
} 
  if(keyPressed) keyPressed();
}


void mouseClicked(){
  tx[i] = mouseX;
  ty[i] = mouseY;
  i++;
  count ++;
  
}
void keyPressed(){
  if(key == CODED){
    if(keyCode == UP) z++;
    if(keyCode == DOWN) z-=1;
  }
}



