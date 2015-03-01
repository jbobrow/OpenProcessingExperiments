
int s=0;
int speed=1;

void setup() {
  size(600, 400);
}

void draw(){

  cloud();
    sun();
    moon();
}


void sun(){
  if(mouseX<300){
    for(int x=30;x<370;x=x+30){
      float a=random(255);
    pushMatrix();
    translate(mouseX,mouseY);
    rotate(radians(x));
    stroke(255);
    strokeWeight(10);
    fill(255,x,a);stroke(a,127,36);
    line(0,0,0,50);
    popMatrix();
     ellipse(mouseX,mouseY,50,50);
    }
  }
}

void cloud(){
  noStroke();
  background(0,width-mouseX,255);
  float a=random(255);
  fill(255,250,205);
    ellipse(s,200,100,70);
    ellipse(s-50,200,100,70);
    ellipse(s-100,70,70,50);
    ellipse(s-150,70,70,50);
    ellipse(s+30,100,50,30);
    ellipse(s+70,100,50,30);
    ellipse(s+100,350,70,50);
    ellipse(s+160,350,70,50);
    ellipse(s-100,350,70,50);
    ellipse(s-160,350,70,50);
    
    s=s+speed;
    if((s>600)|(s<0)){
      speed=speed*-1;
    }
}

void moon(){
  if(mouseX>=300){
    float b=random(150);
    fill(184,184,184);
    ellipse(mouseX,mouseY,100,100);
    fill(b,b,b);
    ellipse(mouseX+20,mouseY,10,10);
    ellipse(mouseX-10,mouseY-20,15,15);
    ellipse(mouseX+30,mouseY+20,20,20);
    ellipse(mouseX-20,mouseY+20,10,10);
  }
}
    
    
    
