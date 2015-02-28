
//very begining level -0 
void setup() {  
  size(192,157);
  background(255);  //fondo blanco
  noFill ();
  smooth();
 }

void draw() {  

  strokeWeight (1);
  stroke (255,0,255);
  ellipse (width/2,height/2,150,150);
pushMatrix ();
    noFill ();
    strokeWeight (2);
    stroke(0);
    beginShape ();        
    vertex (100,5);
    vertex (166,55);
    vertex (150,130);
    vertex (42,130);
    vertex(26,55);
    vertex (100,5);
    vertex (100,55);
    vertex (166,55);
    vertex (100,55);
    vertex (26,55);
    endShape (CLOSE);
popMatrix();
stroke (0,0,255);
triangle (100,55,26,55,100,5);
stroke (255,0,0);
triangle (100,55,166,55,100,5);
stroke (0,255,0);
triangle (45,130,166,60,150,130);
  
}

                
                                
