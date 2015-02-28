




/**
 *thanks to the Noise1D exemple. 
 
 */

float xoff = 0.0;
float xincrement = 0.005; 
float n=0;
float taille=0;



void setup() {
 size(500, 300);


  background(255);

  smooth();
}

void draw()
{

  filter(BLUR,2);
 




stroke(0,random(0,255));
 
  taille=random(0,width);

 
  beginShape(LINES);
  
  for (int i= int(random(-(width*0.5),width*1.5)) ; i<taille; i++) {  
 strokeWeight(random(1, 10));
    // Get a noise value based on xoff and scale it according to the window's height
    n = noise(xoff)*(height);
    // With each cycle, increment xoff
    xoff += xincrement;

    vertex(i, n);
  }

  endShape();

}


