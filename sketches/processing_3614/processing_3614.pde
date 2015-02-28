
int i,w=500,h=w,x,y,s=10;
float k,m,r,j=.01;
void setup(){size(w,h,P3D);noStroke();}
void draw()
{ 
  background(0);
  lights();
  beginShape(9);
  for(i=0;i<w*h;i+=s)
  {
      x=i%w;y=i/w;      
      k=y+s;m=x+s;
      vertex(x,n(y*w+x),y);vertex(m,n(y*w+m),y);vertex(m,n(k*w+m),k);
      vertex(m,n(k*w+m),k);vertex(x,n(k*w+x),k);vertex(x,n(y*w+x),y);
      i+=i%w==0?w*(s-1):0;
  }
  endShape();
  r-=j;
}
float n(float i){return noise(i%w*j,i*j/w+r)*s*10+h/2;}



