
//import processing.opengl.*;

float zr = 0;

void setup()
{
  size(600, 600, P3D);
  frameRate(25);
  textFont(loadFont("Univers45.vlw"), 25);
}


float disturbance(float depth, float time)
{
  return 2.0+cos(depth/300*2*PI + time);
}

void make_spinner(int sectors, float t, int Ampl, int step, float Width)
{
  float z = 0;
  int i  = 0;
  for(z = -Ampl; z<Ampl; z=z+step)
  {    
    float rl = Width * disturbance(z,t) / sqrt(2);  
    for(int ind = 1; ind < sectors; ind++)
    {
      i++;
      int s =  i % sectors;
      vertex(rl*sin(s*2*PI/sectors),rl*cos(s*2*PI/sectors),z);
    }
  }
}

void attach_label(float l, float t, String label,float offset)
{
  pushMatrix();
  
  rotateZ(offset);
  
  float slider = 300+l*sin(t/8 + offset);
  float f = disturbance(slider,3*t);
  
  pushMatrix();
  translate(-100 * f / sqrt(2)-150,100,slider);
  rotateX(-PI/2);
  scale(3);
  text(label,0,textWidth(label));
  popMatrix();
  popMatrix();

}

void draw()
{
  background(185, 205, 165);  
  zr = zr + 0.05;  

  pushMatrix();
  translate(width *5 / 7 , height / 2);

  rotateX(PI/2+(cos(zr)*PI/10));
  rotateY(PI/10*sin(zr));
  rotateZ(zr);

  stroke(185,150,135,200+(100*sin(zr)));
  
  smooth();
  strokeWeight(10);
  strokeCap(ROUND);
  noFill();
  
 
  beginShape();
  make_spinner(5,3*zr, height*3/4, 20, 100);
  endShape();
 
  strokeWeight(3); 
  int d = 0;
  for(d = 0; d < 200*cos(zr); d+=40)
  {
    pushMatrix();
    rotateZ(PI/3000*d);
    strokeWeight(1+5*(1-(d/200))); 
    stroke(200*cos(zr),100*sin(2*zr),50*sin(4*zr), d+(100*cos(zr)));
    beginShape(POINT);
    make_spinner(5,3*(zr), height*3/4, 20, 110*cos(zr));
    endShape();
    popMatrix();
  }
  
  fill(0);
  attach_label(300,zr,"Create and Live", -PI); 
  attach_label(300,zr,"Waiste Time", -PI*2/3); 
  attach_label(300,3*zr,"Go sleep", -PI/3); 
  attach_label(300,zr,"Coffee is too strong", 0); 
  attach_label(300,4*zr,"Midnight", PI/3); 
  attach_label(300,zr,"Nonsense", PI*2/3); 
 
  popMatrix();

/////////////////////////////////////////////////
}

