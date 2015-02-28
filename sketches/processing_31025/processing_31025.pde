
PImage imagen; 
void setup () { 
  imagen= loadImage("lhooq.jpg"); 
  size(450, 650, P2D); 
  noFill();
  background(0); 
} 
 
void draw(){ 
  float diag = dist(0,0,width,height);
  for(int i=0; i<5000; i++){
  int n = int(random(imagen.width)); 
  int m = int(random(imagen.height)); 
  float mp = map(dist(mouseX,mouseY,n,m),0,diag,1,60);
  color pix = imagen.get(n, m); 
  stroke(pix,30); 
  strokeWeight(mp); 
  point(n,m);
  }
 }

//void keyPressed() { 
//  save("cover" + key + ".png");
//}


