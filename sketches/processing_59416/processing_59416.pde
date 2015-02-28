


ArrayList rots;
ArrayList trail;

void setup() {
  size(400, 400, P2D); 

  rots = new ArrayList();
  trail = new ArrayList();
  loadPixels();

  for (int i =0 ; i < pixels.length;i+=3) {
    rots.add(new Rot(i%width, i/width));
  }
}


void draw() {

  background(0);

  for (int i =0 ; i < rots.size();i++) {
    Rot rt = (Rot)rots.get(i);
    rt.draw();
  }
  
  
  if(mouseX!=0 && mouseY!=0)
  trail.add(new PVector(mouseX,mouseY));
  
  noFill();
  beginShape();
    for(int i =0 ; i < trail.size();i++){
   PVector t = (PVector)trail.get(i);
   
   strokeWeight(map(i,0,trail.size(),0,10));
   stroke(#FFCC00,map(i,0,trail.size(),0,40));
   
   vertex(t.x,t.y);
  }
  endShape();
  
  strokeWeight(1);
  
  
  
  if(trail.size()>10){
   trail.remove(0); 
  }
}


class Rot {
  float x, y, sx, sy;
  float ox,oy;
  float w = 40.;
  float t, s;

  Rot(float _x, float _y) {
    ox=x=_x;
    oy=y=_y;
    t = 0;
    s = random(1, 20)/50.0;
  }

  void draw() {
    sx = cos(t)*w;
    sy = sin(t)*w;



    pushMatrix();
    translate(x, y);
    stroke(255, 70);
    point(sx, sy);
    popMatrix();

    w = dist(mouseX, mouseY, x, y)/30.0;
    float d2 = dist(ox,oy,x,y);
    //w /= atan2(sy-y,sx-x);
    
    
    
    if(mousePressed){
    x += (ox-x)/(300.0);
    y += (oy-y)/(300.0);
    sx += (-sx)/(30.0);
    sy += (-sy)/(30.0);
    t+=(-0)/1.5;
    w+=(-w)/3.0;
    
    }else{
     t+=w/(400.0/d2+1.0); 
    }

    
    x -= (mouseX-x)/((log((w*35.0)/80.1+1.01)*(7.8)));
    y -= (mouseY-y)/((log((w*35.0)/80.1+1.01)*(7.8)));

    x += (ox-x)/(300.0/d2);
    y += (oy-y)/(300.0/d2);

    x += (mouseX-x)/((log((w*35.0)/100.0+1.01)*(10.0)));
    y += (mouseY-y)/((log((w*35.0)/100.0+1.01)*(10.0)));

    
    //brightness(g.pixels[(int)y*width+(int)x])/100.0;
  }
}


void keyPressed(){
 save("screen.png"); 
}


