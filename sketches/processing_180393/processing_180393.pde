
PGraphics fond;
flocon[] flocons;
int next=0;

void setup(){
  flocons = new flocon[0];
  size(500,500);
  fond = createGraphics(width, height, JAVA2D);
  fond.beginDraw();
  for(int a=0;a<400;a++){
    fond.stroke(map(a,0,400,220,250));
    fond.line(0,a,500,a);
  }
  fond.noStroke();
  fond.fill(255);
  fond.beginShape();
  fond.vertex(0,350);
  fond.vertex(0,350);
  fond.vertex(0,height);
  fond.vertex(width,height);
  fond.vertex(width,350);
  fond.curveVertex(width,350);
  fond.curveVertex(width/5*4,350-6);
  fond.curveVertex(width/5*3,350+20);
  fond.curveVertex(width/5*2,350-7);
  fond.curveVertex(width/5 ,350+8);
  fond.curveVertex(0,350);
  fond.endShape();
  fond.endDraw();
}

void draw(){
  image(fond,0,0);
  noStroke();
  fill(255);
  ellipse(200,300,150,150);
  ellipse(200,200,80,80); 
  fill(0);
  ellipse(200,180,5,5);
  ellipse(220,180,5,5);
  fill(237, 134, 57);
  arc(250,225,95,95,PI+0.4, PI+0.75);
  fill(255,200);
  flocon[] nf= new flocon[0];
  for(flocon f:flocons){
    f.dessine();
    if(f.y<height){
      nf = (flocon[]) append(nf, f);
    }
  }
  flocons = nf;
  if(next<millis()){
    next=millis()+50;
    new flocon();
  }
}

class flocon{
  float t, x, y;
  flocon(){
    x = random(width);
    y= random(-5,2);
    t = random(0.5, 5.5);
    flocons=(flocon[]) append(flocons, this);
  }
  void dessine(){
    x+=random(-t*0.3,t*0.3);
    y+=t/3;
    stroke(255,random(250,255));
    ellipse(x,y,t,t);
  }
}
