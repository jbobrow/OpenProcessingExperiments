

 
void setup(){
  size(800,800);
  background(100);
  smooth();
  noFill();
  rectMode(CENTER);
  ellipseMode(CENTER);
  imageMode(CENTER);
}

//function for the first grid

void GRID1(float a, float b, float c, float d, float e, float f, float g,
float h, float i, float j, float k, float l, float m, float n, float o,
float p, float q, float r, float s, float t, float u, float v){
  stroke(82,u/3.14,232);
  strokeWeight(random(4));
  beginShape();
    vertex(a,b);
    vertex(c,d);
    vertex(e,f);
    vertex(g,h);
  endShape(CLOSE);
    stroke(255,114,v/3.14);
  strokeWeight(random(4));
  beginShape();
    vertex(i,j);
    vertex(k,l);
    vertex(m,n);
    vertex(o,p);
    vertex(q,r);
    vertex(s,t);    
  endShape(CLOSE);
}

//function for second grid

void GRID2(float a2, float b2, float c2, float d2, float e2, float f2, float g2,
float h2, float i2, float j2, float k2, float l2, float m2, float n2, float o2,
float p2, float q2, float r2, float s2, float t2, float u2, float v2){
  stroke(82,u2/3.14,232,50);
  strokeWeight(random(4));
  beginShape();
    vertex(a2,b2);
    vertex(c2,d2);
    vertex(e2,f2);
    vertex(g2,h2);
  endShape(CLOSE);
    stroke(255,114,v2/3.14,50);
  strokeWeight(random(4));
  beginShape();
    vertex(i2,j2);
    vertex(k2,l2);
    vertex(m2,n2);
    vertex(o2,p2);
    vertex(q2,r2);
    vertex(s2,t2);    
  endShape(CLOSE);
}

 //function for bezier's
 
 void BEZIER(float a3, float b3, float c3, float d3, float e3, float f3, float g3,
  float h3){
    stroke(209,52,9,90);
    strokeWeight(random(6,9));
    bezier(a3,b3,random(100,700),random(100,700),random(100,700),random(100,700),
    c3,d3);
     stroke(253,244,11,90);
    strokeWeight(random(6,9));
    bezier(e3,f3,random(100,700),random(100,700),random(100,700),random(100,700),
    g3,h3);
  }
  
  // function for ellipses 
  
  void ELLIPSE( float a4, float b4, float c4, float d4, float e4, float f4){
    noStroke();
    fill(209,52,9,90);
    ellipse(a4,b4,random(50,100),random(50,100));
    fill(253,244,11,90);
    ellipse(c4,d4,random(15,75),random(15,75));
    fill(7,96,5,90);
    ellipse(e4,f4,random(50,125),random(50,125));
  }
    

void draw(){
  for( int U=0; U<width; U=U+100){
   for( int V=0; V<height; V=V+100){
      GRID1(random(100)+U,random(100)+V,random(100)+U,random(100)+V,random(100)+U,
      random(100)+V,random(100)+U,random(100)+V,random(100)+U,random(100)+V,random(100)+U,
      random(100)+V,random(100)+U,random(100)+V,random(100)+U,random(100)+V,random(100)+U,
      random(100)+V,random(100)+U,random(100)+V,U,V);
      noLoop();
    }
  }
 fill(100);
 stroke(0);
 strokeWeight(9);
 rect(width/2,height/2,600,600);
 noFill();
 for( int U2=100; U2<width-100; U2=U2+100){
   for( int V2=100; V2<height-100; V2=V2+100){
      GRID2(random(100)+U2,random(100)+V2,random(100)+U2,random(100)+V2,random(100)+U2,
      random(100)+V2,random(100)+U2,random(100)+V2,random(100)+U2,random(100)+V2,random(100)+U2,
      random(100)+V2,random(100)+U2,random(100)+V2,random(100)+U2,random(100)+V2,random(100)+U2,
      random(100)+V2,random(100)+U2,random(100)+V2,U2,V2);
      noLoop();
}
 }
 
 PImage MIES;
 MIES= loadImage("MiesSrCrownHall.jpg");
 image(MIES,width/2,height/2);
 BEZIER(random(100,700), random(100,700), random(100,700), random(100,700), random(100,700), random(100,700), 
 random(100,700), random(100,700));
 ELLIPSE( random(200,600), random(200,600),random(200,600), random(200,600), 
 random(200,600),random(200,600));	
  	
 }
  void mousePressed(){
   background(100);
   noFill();
   loop();
 }

