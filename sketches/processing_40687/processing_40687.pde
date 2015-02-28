
void setup(){
 size(500,500); 
 smooth();
}

void draw() {
  float s = second();  
  float m = minute();
        m = m + s/60; 
  float h = hour();
        h = h + m/60;   
        if(h > 12){h -= 12;}
  
  background(40);
  noStroke();
 
  pushMatrix();
  translate(250,250);

  rotate(radians(270));
  // hours
  fill(#c9efb0);
  ellipse(0, 0, 400, 400);
  fill (#a2d382);
  arc(0, 0, 400, 400, 0, (h*TWO_PI/12));
  //minutes
  fill(#c1def6);
  ellipse(0, 0, 250, 250);
  fill(#83bcec);;
  arc(0, 0, 250, 250, 0, (m*TWO_PI/60));
  //seconds
  fill(#ce4221);
  ellipse(0, 0, 130, 130);
  fill(#990f0f);
  arc(0, 0, 130, 130, 0, (s*TWO_PI/60));  
  popMatrix();
  
   for(int i=0;i<12;i++)
  {
   pushMatrix();
   translate(250,250);
   stroke(40);
   rotate(i*(radians(30)));
   strokeWeight(10);
   strokeCap(SQUARE);
   line(0,195,0,201);
   popMatrix(); 
   noStroke();
  }
}

