
import superCAD.*;



ArrayList Dots = new ArrayList();
Dot D; // our Dot

int width = 450;
int height = 640;

PVector startpoint = new PVector(width/2,height-20);
PVector endpoint = new PVector(width/2,0);

void setup(){
  size(width,height, P3D);
  background(0);
  noFill();
  smooth();
  colorMode(HSB);

}

void draw(){
  fill(0);//Start point
point(startpoint.x, startpoint.y);
point(endpoint.x, endpoint.y);
 
 noStroke();
  for (int i=0; i<Dots.size(); i++){// iterate over our ArrayList
    Dot D = (Dot) Dots.get(i); // get one Dot out
    D.run(); // do your thang
  }
  
  



}

void keyPressed(){
  
    beginRaw("superCAD.Rhino", "output.rvb");
  
  for (int i=0; i<7; i++){
  Dot D = new Dot( new PVector(startpoint.x+random(-80,80), startpoint.y, startpoint.z+random(-80,80)), color(130,255,200, 50), random(10,50) ); // new dot
  Dots.add(D); // add the new dot to the bucket
}
}
 
void mousePressed(){
  endRaw();
  background(0);
}


