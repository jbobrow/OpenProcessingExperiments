

// StarDance1.pde  12/2010  by Toni Holzer
// http://www.openprocessing.org/visuals
// Use the mouse to modify star spiral.

int w=512,  m=w/2;
int h=512;
float a,b,c;

void setup()
{ size(w, h); 
  fill(0); rect(0,0,w-1,h-1);
}

void draw()
{ 
  stroke(0);   line (0,0,w,0);
  stroke(155+cos(a)*100, 170+sin(a*1.33)*80, 155+sin(a*1.79)*80);
  a += 0.02;
  b = sin(a)+ cos(a*1.33);
  for(float r=m; r>0; r-=.1)
  { c=r*(111+mouseY+mouseX*m)*.0001+b; 
    point (m+cos(c)*r*sin(r), h/2+sin(c)*r*sin(r)); 
  } 
  blend(0,0,w,h, 0, 1, w, h-1, 0);
}


