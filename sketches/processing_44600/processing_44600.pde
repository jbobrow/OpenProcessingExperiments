

//Author: Liliam Rodas
//Purpose: Homework to generate different grass patterns. The idea shows the viewer
         // laying behind the grass of a house backyard and contemplating the view:
         // A not too shinny afternoon with mountains and a lake.
//Functioning: Shows lines with a hint of reality in order to represent grass.
//Reference: previous excercises provided in class and processing.



void setup()
{
  color color1 = color (4,7,54);
  color color2 = color  (200,238,245);
  size(300, 400);
  background (color1);
  for (int initial=0; initial<height; initial++)
  {
    stroke ((color2), (255*(height-initial)/height));
    line (0, initial, width, initial);
  }
 
 //Mountains 
beginShape ();

smooth ();
stroke (0,100);
fill (81,106,84,60);
curveVertex (-50, 250); // beginning-point section 1
curveVertex (-50,250);

curveVertex (30,190);    
curveVertex (80,200);
curveVertex (130,180);
curveVertex (170,170);
curveVertex (220,120);
curveVertex (285,190);

curveVertex (380, 250); 
curveVertex (380, 250); // end-point

endShape ();

}


 

  int diam1 = 1;
float centX, centY, tempdiam, diam; 

void sunshine () {
  
   
  //Sunshine
  frameRate(10); 

  centX = width/2; 
  centY = height/6;

  if (diam1 <= 50) { 
    noStroke ();
    fill(249,250,199,120);     
    ellipse(centX, centY, diam1, diam1);
    diam1 += 4;  // increases diameter for next loop
    
    noStroke ();
    fill(255,15);     
    ellipse(centX, centY, (diam1+60), (diam1+60));
  }

  // loop within loop
  while (tempdiam > 10) {                               
    ellipse(centX, centY, tempdiam, tempdiam);
    tempdiam -= 8;
  }
}

float grass= 0;

void grass(){
  
  
   stroke (0,64,0,150);
   fill (4,180,16,75);
  smooth ();
  grass = grass + 1;
  float n = noise(grass) * width;
  
  if (grass>125) {
    noStroke ();
  } else {
  curve (random (width), random (height), n, height, random (width), random (height),height/2, height/3);
  
  
  }
 }
 




 //noLoop ();



void draw (){
  
  grass ();
   sunshine ();
   
}

  
void keyPressed(){
saveFrame("grass.jpg");
    }


