
void setup(){
  size(700,700);
}
float a=-0.03;
float b=1;
float c=30;
float t=0;
void draw(){
  b=5*sin(radians(t));
  a=map(mouseX,0,width,-1,1);
  c=(mouseY-height/2)*-0.5;
  background(0);
  fill(0,255,0);
  text("y = "+nf(a,0,2)+"x^2"+" "+(int)b+"x + "+nf((c),0,2),10,10);
  fill(255,0,0);
  text("y = "+nf((-1*a),0,2)+"x^2 + "+nf(c,0,2),10,30);
  noFill();
  stroke(255,128);
  line(0,height/2,width,height/2);
  line(width/2,0,width/2,height);
  translate(width/2,height/2);
  scale(2);
  for(int i=-width/2;i<width/2;i++){
    stroke(0,255,0);
    point(i,-1*(a*sq(i)+b*i+c));
    stroke(255,0,0);
    point(i,a*sq(i)-c);
  }
  t+=0.2;
}



