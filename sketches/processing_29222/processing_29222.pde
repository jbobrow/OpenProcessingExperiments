
//import processing.opengl.*;

// stephen monslow 2011

//   adapted from RedFriks cinder pact: pact15
//  original C++ code:
//  http://www.fredrikolofsson.com/f0blog/?q=node/490
//
// uses PVector could use Toxiclibs.
//
//
//


PVector v1, v2;

float w, h, speed, n,r,g,b,rr,gg,bb,e;
int index;


void setup()

{
  index = 0;
  size(400, 400);
  n= 80.0;
  speed= 0.005;
  w = width;
  h = height;
}





void draw()



{

  
if(r>255) r = random(255);
if(g>255) g = random(255);
if(b>255) b = random(255);
 
  if(rr>255) rr = random(255);
if(gg>255) gg = random(255);
if(bb>255) bb = random(255);
  background(rr,gg,bb);
  
  
  r++;g++;b++;rr++;gg++;bb++;
  
  
  translate(w*0.5, h*0.5);  
  for (int i = 0; i<=n*2; i+=1) {

    rotate(i/n*PI*2+(index*speed)*0.00001);
    stroke(random(255), 0, 0);
    v1 = new PVector(w*(sin((index+i)*0.0144f)*0.09f+0.26f), 
    h*(cos((index+i)*0.0126f)*0.03f+0.26f));
    
    v2 = new PVector(w*(sin((index+i)*0.0244f)*0.02f+0.07f), 
    h*(cos((index+i)*0.0226f)*0.02f+0.07f));
    v1.add(v2);


stroke(r,g,b);
     line(v1.x, v1.y, v2.x, v2.y);
    
fill(r,g,b);
    arc(v1.x, v1.y,w*e,h*e,0,cos((index+i)*0.0126f)*0.11f+0.26f) ;
fill(r+22,g-22,b-44);
    arc(v2.y,v2.x ,w*e,h*e,0,sin((index+i)*0.0126f)*0.003f+0.26f) ;
    
    stroke(r,g,b);
     line(v2.x, v2.y, v1.x, v1.y);
  }
n+=0.0099;
if(n > 80 ) n = 0.;
  index+=11;
  e+=0.002;
  if(e > 0.3) e = random(0.3);
  
}


