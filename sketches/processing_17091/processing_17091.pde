
int y;
int l;

float rot = 0;
int a =0;


void setup(){
  size(485,485,P3D);
  rectMode(CENTER);
  noStroke();
  background(100,0,100);
  fill(100,100,0);
  for(y = 0; y<=1200; y+=55){
  for(l = 0; l<=750; l+=55){
    pushMatrix();
   
    translate(l,y,-200);
    rotateZ(.8);
    rect(-215,-85,40,40);
    popMatrix();
  }
  }
}

void draw(){
  pushMatrix();
  translate(width/2,height/2);
  pushMatrix();
  rotateY(rot);
  inf(100,0,20,120,180,50,60,a);
  popMatrix();
  popMatrix();
  rot+=.3;
}

void inf(float d,float dY, float r, float g, float b, float w, float h,float a1){
  if( a1<50){
   pushMatrix();
  translate(d,dY,0);
  fill(r,g,b);
  ellipse(0,0,w,h);
  popMatrix();
  inf(random(-100,100),random(-500,500),random(155),random(155),random(155),random(200),random(200),a1+=1);
  
  }
}

