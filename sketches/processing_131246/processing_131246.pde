
float li = 100;
float lj = 500-20;
float lk = 500-20;
float ll = 100;
float lx = 100;
float ly = 100;

float c;
void setup(){
  size(500,500);
  colorMode(HSB);
}
void draw(){
colorMode(HSB);
  stroke(0);
  fill(255);
  if ((li<mouseX) && (mouseX<li+300) && (lj-20<mouseY) && (mouseY<lj+20) && (mousePressed)){
    lx = mouseX-li;
    
  }
  if ((lk-20<mouseX) && (mouseX<lk+20) && (ll<mouseY) && (mouseY<ll+300) && (mousePressed)){
    ly = mouseY-ll;
  }
  background(lx,240,ly);
  line(li,lj,li+300,lj);
  ellipse(lx+li,lj,15,25);
  line(lk,ll,lk,ll+300);
  ellipse(lk,ly+ll,25,15);
  
  colorMode(RGB);
  if (mousePressed){
   c=0;
  }
  noStroke();
  fill(100,255-c);
  pushMatrix();
  translate(mouseX,mouseY);
  ellipse(0,0,c,c);
  popMatrix();
  if (c<255){
    c+=10;
  }
}

