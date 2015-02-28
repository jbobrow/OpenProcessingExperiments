
int rectEtat = 0;
int rondEtat = 0;

float xCercle = 125;
float yCercle = 200;

float xRect = 275;
float yRect = 200;


int nombreDeRayons = 40;
int longueurDesRayons = 60;

float incRayon = 0;
float incLine = 0;

void setup() {
  size(400,400);
  smooth();
  noStroke();
}

void mouseReleased(){ rectEtat = 0;

}
void mousePressed(){
  
  if (mouseX > xRect - 25 && 
  mouseX < xRect + 25 && mouseY > yRect - 25 && mouseY < yRect +25)
  
  { 
    rectEtat = 1;
   
   }
  
  float distance = dist(xCercle,yCercle,mouseX, mouseY);
  
  if (distance < 25)
  {
    if (rondEtat == 0) 
    
    {
      rondEtat = 1;
      
     } 
      else {rondEtat = 0;

     }
  
  }
  
}


void draw() {
  
  background(0);
  smooth();
 
 if ( rectEtat == 0) 
 { 
   fill(#4503FF);
   
   if (incLine > 0) { incLine = incLine - 10; 
   
   }
 } 
 
 else
 {
   fill(#FEFF00);
   
   if (incLine < 400) { incLine = incLine + 10; 
   
   }
 }
 
 float currentLine = 0;
 
 while (currentLine < incLine) {
   line(0, currentLine, 400, currentLine);
   
   currentLine = currentLine + 19;
 
 }
 
 
 rectMode(CENTER);
 
 noStroke();
 rect(xRect,yRect,50,50);
 
 
 
 
 

 if ( rondEtat == 0) 
 { 
   fill(#FF0D0D);
   
   if (incRayon > 0) { incRayon = incRayon - 0.1; 
   
   }
 } 
 
 else
 {
   fill(#FF50F4);
   
   if (incRayon < TWO_PI) { incRayon = incRayon + 0.1; 
   
   }
 }

 noStroke();
 ellipse (xCercle, yCercle, 50,50);
 
 
float tranche = TWO_PI / nombreDeRayons;
float rads = 0;
float ratio = 0.75;
 
strokeWeight(3);
stroke(#2BA01A);
while ( rads < incRayon ) {
 float x1 = xCercle+cos(rads) * longueurDesRayons * ratio;
 float y1 = yCercle + sin(rads) * longueurDesRayons * ratio;
 float x2 = xCercle +cos(rads) * longueurDesRayons;
 float y2 = yCercle + sin(rads) * longueurDesRayons;
  line(x1,y1,x2,y2 );
  rads = rads + tranche;
   }



}



