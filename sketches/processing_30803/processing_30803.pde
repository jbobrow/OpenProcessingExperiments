
void setup(){
size(900,450);
smooth();
noLoop();
noCursor();
}
 
void draw(){
background(85,136,204);

// DIRTy lines
int numLines=0;
while (numLines<50){
    strokeWeight(random(1,width/20));
    stroke(random(230,255),random(200,255),0,2);
    line(random(width),0,random(width),height);
    numLines++;
  }
numLines=0;  
while (numLines<50){
    strokeWeight(random(1,width/20));
    stroke(random(230,255),random(200,255),0,2);
    line(0,random(height),width,random(height));
    numLines++;
  }

// VALUES

float circleVar=random(1,5);
float circleSize=random(10,15);
int middle=int(random(width/10,width-width/10));
int posCourtain=int(random(height/10, height/1.5)); 
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

   //TOP LEFT
for(int i=middle;i>=-5;i--){   
  for(int j=posCourtain+round(random(height/4));j>=-5;j=j-round(random(5,20))){
    float fil=norm(i,0,middle);
    fil=1-pow(fil,2);
    fil*=255;
    // distance to the nodes
    float d1=dist(i,j,x1,y1)/30;
    float d2=dist(i,j,x2,y2)/30;
    float d3=dist(i,j,x3,y3)/30;
    float d4=dist(i,j,x4,y4)/30;
    stroke(255-10*sqrt(d1*d2*d3*d4),fil+10); // random relation to the distances
    ellipse(i,j,circleSize+random(-circleVar,circleVar),circleSize+random(-circleVar,circleVar));
  }}
  
  //TOP RIGHT
for(int i=middle;i<=width+5;i++){  
  for(int j=posCourtain+round(random(height/4));j>=-5;j=j-round(random(5,20))){
    float fil=norm(i,middle,width);
    fil=1-pow(1-fil,2);
    fil*=255;
    // distance to the nodes
    float d1=dist(i,j,x1,y1)/30;
    float d2=dist(i,j,x2,y2)/30;
    float d3=dist(i,j,x3,y3)/30;
    float d4=dist(i,j,x4,y4)/30;
    stroke(255-10*sqrt(d1*d2*d3*d4),fil+10);
    ellipse(i,j,circleSize+random(-circleVar,circleVar),circleSize+random(-circleVar,circleVar));
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
//  float c4=pow(1-nx,8);
//  c4*=height;
  strokeWeight(random(1,height/54));
  stroke(random(0,140),random(0,100),random(20,200),150);
  beginShape();
  vertex(x1,y1);
  bezierVertex(i,c1,i,c2,x2,y2);
  bezierVertex(i,c2,width-i,c3,x3,y3);
  bezierVertex(width-i,c3,i,c1,x4,y4);
  endShape();
}

// NODES
  fill(0,200);
  stroke(255,150);
ellipse(x1,y1,width/50+random(0,20),width/50+random(0,20));
ellipse(x2,y2,width/50+random(0,20),width/50+random(0,20));
ellipse(x3,y3,width/50+random(0,20),width/50+random(0,20));
ellipse(x4,y4,width/50+random(0,20),width/50+random(0,20));
 
 
}
 
void mousePressed(){
  redraw();
}

void keyPressed(){
  
  saveFrame("wired_snow####.png");
}
            
    
