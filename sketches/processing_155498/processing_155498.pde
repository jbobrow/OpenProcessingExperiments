
boolean appear=false;
int margin;
float leng,alph;
void setup() {
  size(600, 600);
  background(0);
  smooth(8);
  margin=50;
  leng=200;
  alph=255;
  rectMode(CENTER);  
  noStroke();
}
void draw() {
  background(0,255,255); 
  if(appear){
    alph--;
    if(alph<1)appear=false;
  }
  else if(alph<255)alph++;
  pushMatrix();  
  fill(255,0,255);
  translate(width/2+30*sin(frameCount/20),height/2+30*cos(frameCount/20));
  rotate(sin(frameCount/30)/10);
  noFill();
  strokeWeight(5);
  stroke(255,0,128);
  rect(0,0,width/1.9,height/1.9);
  popMatrix();
  noStroke();
  fill(255-alph,255,255,2*alph);
  rect(margin+leng/2,margin+leng/1.5,leng,leng);
  rect(width-margin-leng/2,margin+leng/2,leng,leng);
  rect(margin+leng/2.5,height-margin-leng/2,leng,leng);
  rect(width-margin-leng/2,height-margin-leng/3,leng,leng);
}
void mouseClicked(){
  appear=true;
}


