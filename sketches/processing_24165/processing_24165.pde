
void setup(){
size(800,450);
smooth();
noLoop();
}

void draw(){
background(85,136,204);

float start=random(1,40);      //Controls set to random
float freq=random(1,20);

float phith=width/1.6180339887;
float pheig=height/1.6180339887;
float hpw=phith/2;
float hph=pheig/2;
float x1=width/2-hpw/2+random(-pheig,pheig);
float y1=height/2-hph/2+random(-pheig,pheig);
float x2=x1+random(-pheig,pheig);
float y2=height/2+hph/2+random(-pheig,pheig);
float x3=width/2+hpw/2+random(-pheig,pheig);
float y3=y1+random(-pheig,pheig);
float x4=x3+random(-pheig,pheig);
float y4=y2+random(-pheig,pheig);

//noise generator
noFill();
strokeWeight(1);
for(int i=width/2;i>=-5;i--){    //top left
  for(int j=height/2+round(random(height/4));j>=-5;j=j-round(random(5,20))){
    float fil=norm(i,0,width/2);
    fil=1-pow(fil,2);
    fil*=255;
    stroke(255,fil+10);
    ellipse(i,j,10,10);
  }}
for(int i=width/2;i<=width+5;i++){  //top right
  for(int j=height/2+round(random(height/4));j>=-5;j=j-round(random(5,20))){
    float fil=norm(i,width/2,width);
    fil=1-pow(1-fil,2);
    fil*=255;
    stroke(255,fil+10);
    ellipse(i,j,10,10);
  }}

// Shape generator

noFill();
strokeJoin(ROUND);
strokeCap(ROUND);
for(int i=round(width/start);i<width;i+=round(width/freq)){
  float nx=norm(i,0,width);
  float c1=1-pow(nx,8);
  c1*=height;
  float c2=pow(nx,8);
  c2*=height;
  float c3=1-pow(1-nx,8);
  c3*=height;
  float c4=pow(1-nx,8);
  c4*=height;
  strokeWeight(random(1,height/54));
  stroke(random(0,140),random(0,100),random(20,200),150);
  beginShape();
  vertex(x1,y1);
  bezierVertex(i,c1,i,c2,x2,y2);
  bezierVertex(i,c2,width-i,c3,x3,y3);
  bezierVertex(width-i,c3,width-i,c4,x4,y4);
  endShape();
}
fill(0,200);
stroke(0,150);
ellipse(x1,y1,width/50+random(0,20),width/50+random(0,20));
ellipse(x2,y2,width/50+random(0,20),width/50+random(0,20));
ellipse(x3,y3,width/50+random(0,20),width/50+random(0,20));
ellipse(x4,y4,width/50+random(0,20),width/50+random(0,20));


}

void mousePressed(){
  redraw();
}


                                                                                                                                    
