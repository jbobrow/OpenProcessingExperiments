
/* Processing conversion/interpretation of 'Marcin Ignac' code (Cinder, processing.js):
   
   http://marcinignac.com/blog/cindermedusae-making-generative-creatures/mesh01.html
   http://marcinignac.com/blog/cindermedusae-making-generative-creatures/
  
   mouse X changes the period.
   mouse Y changes the amplitude.
*/

int w = 360;
int h = 360;
float r = 360/2-50;    
int numSegments1 = 128;
float phiStep1 = PI / numSegments1;


void setup()
{ size(w, h);
}

void draw()
{ background(252, 236, 194);
  translate(w/2, h/2); 
    
  for(float phi = 0; phi<2*PI; phi+=phiStep1) { 		
                  	
        EvalVertex1 p1 = new EvalVertex1(phi);
        EvalVertex1 p2 = new EvalVertex1(phi + phiStep1);
    
        stroke(0); 
  	line(p1.x, p1.y, p2.x, p2.y);  	
         
        stroke(70); 	 
        line(p1.x, p1.y, 0, 0);	
  } 
}

class EvalVertex1
{     	float x; 
        float y;
        
        EvalVertex1(float phi)
        { int period     = (int) map(mouseX, 0, width, 0, 20);
          float amplitude = map(mouseY, 0, height, 0, 1);
          println("amplitude: "+amplitude + ", period: "+period);
          
          float localR = r * (1 + amplitude * cos(phi * period));
          
          //we subtract QUARTER_PI aka 90' so the first point is on top instead on the right                   
          x = localR * cos(phi - QUARTER_PI);
          y = localR * sin(phi - QUARTER_PI); 
        }
}

