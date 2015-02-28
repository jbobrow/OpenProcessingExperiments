

//Author: Liliam Rodas
//Purpose: To practice how to apply time and repetitions
//Functioning: Shows a night sky landscape.


// Space setup
void setup () {
  size (300, 400);
  background (0, 0, 55);
  
}

void land () {
  
  noStroke ();
  fill(0,0,55);
  rect (270,280,275,285);
  
  fill (0);
  stroke(2);
  strokeWeight(1);
  
  
  beginShape (); // mountain 1
  
  curveVertex (100,400);
  curveVertex (100,400);
  
  curveVertex (150,320);
  curveVertex (240,300);
  
  curveVertex (310,400);
  curveVertex (310,400);
  
  endShape ();
  
   beginShape (); // mountain 2
  
  curveVertex (0,400);
  curveVertex (0,400);
  
  curveVertex (50,320);
  curveVertex (110,270);
  curveVertex (170,350);
  
  curveVertex (150,400);
  curveVertex (150,400);
  
  endShape ();
  
}
  

int p = 0;
int p1 = 0;
float p2;

void shootingStar () {
  p++;
  p1= p-15;
  
  stroke (242,231,0,50);
  strokeWeight (5); 
  line (p,p,p,p);
  
  stroke (0, 0, 55);
  strokeWeight (6); 
  line (p1,p1,p1,p1);
  
    if(p >= width) {
    p =0;
  } 
  if(p1>=width) {
    
    p1=0;
}

  if(p2>=width) {
    
    p2=0;
}

}
void stars () {
  int s = millis();
  fill(s % 255);
  noStroke ();
  ellipse(200, 40, 2, 2);
  ellipse(170, 100, 2, 2);
  ellipse(50, 70, 4, 4);
  ellipse(100, 60, 3, 3);
  ellipse(50, 140, 2, 2);
  ellipse(100, 150, 3, 3);
  ellipse(180, 160, 3, 3);
  ellipse(150, 50, 2, 2);
  ellipse(65, 110, 2, 2);
  ellipse(175, 125, 2, 2);
  ellipse(145, 80, 3, 3);
  ellipse(170, 190, 2, 2);
  ellipse(200, 140, 2, 2);
}


int diam1 = 1;
float centX, centY, tempdiam, diam;


void moon () {

  frameRate(15); 

  centX = width-50; 
  centY = height-300;

  if (diam1 <= 60) { 
    stroke(0,0,21); 
    strokeWeight(0); 
    fill(255,120);     
    ellipse(centX, centY, diam1, diam1);
    diam1 += 5;  // increases diameter for next loop
    
    fill(184,192,24,15);     
    ellipse(centX, centY, (diam1+30), (diam1+30));
  }

  // loop within loop
  while (tempdiam > 10) {                               
    ellipse(centX, centY, tempdiam, tempdiam);
    tempdiam -= 8;
  }
}

 void draw() {

  smooth ();

  land ();
  stars ();
  shootingStar ();
  moon ();
  
}

void keyPressed(){
saveFrame("night.jpg");
    }




