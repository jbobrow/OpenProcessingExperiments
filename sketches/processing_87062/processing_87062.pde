
//old tv set
PImage img;
int lado=8;
color colorin;
float wide,delta,offset;
float x1i,y1i,x2i,y2i,r;
void setup()
{
  img=loadImage("Shiffman.jpg");
  //int wider=int(img.width*lado);
  //int higher=img.height*lado;  
  size(440,440);
  frameRate(6);
}
void draw()
{
  background(0);
  stroke(255);
  fill(255);
    offset=(int(random(-2,2)))*noise(0.05)/1000; //change offset and it will spin
    delta=PI/20+offset; 
    for(float i=0;i<img.width*2*PI;i+=delta)
    {
      r=i;
      
      //delta=lado/(2*i);
      x1i=img.width*lado/2+r*cos(i);
      y1i=img.height*lado/2+r*sin(i);
      x2i=img.width*lado/2+r*cos(i+delta);
      y2i=img.height*lado/2+r*sin(i+delta);
      colorin=img.get(int(x1i/lado),int(y1i/lado));
      wide=(blue(colorin)/256)*lado;
      strokeWeight(wide);
      line(x1i,y1i,x2i,y2i);
    }
    
}



