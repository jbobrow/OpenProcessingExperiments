

void setup () {
  size (900,500);
  smooth ();
  noLoop();
  noStroke();
}

void draw () {
  
//---------------------- RULES
  
  float r = random(255);
  float g = random(255);
  float b = random(255);
  
  float r2= r+30;
  float g2= g+30;
  float b2= b+30;
  
  background (r2,b2,g2 );
  
//---------------------- FOR LOOP
  for (int x=0; x<width-50; x+=87) {
    
    float y;
    y=height/2;
    
    int n = 2;
    float d = random (0, n+1);

//---------------------- PLANT
    pushMatrix();
    translate(x,random(y,y+20));
    
    stroke (r,g,b);
    
    plant ();
    plant ();
    plant ();
    plant ();
    fill(r,g,b);
    
    noStroke();
    popMatrix();
    
//---------------------- LEAVES
    pushMatrix();
    translate(x,y);
    
    float xc = (random(40,80));
    float yc = (random(80,150));

    ellipse(xc+(random(1,40)), yc+(random(5,10)), 3,1);
    ellipse(xc+(random(1,40)), yc+(random(5,10)), 4,2);
    ellipse(xc+(random(1,40)), yc+(random(5,10)), 4,2);
    
    fill(r,g,b, 100);
    quad (78,90, 43,90, 90, 60, 200, 70);
    
    fill(255);
    quad (30,32, 89,32, 84,55, 35,55);
    quad (39,55, 82,55, 78,90, 43,90);

    noFill();
    popMatrix();
  }

}

//---------------------- PLANT RULES
void plant () {
 
  strokeWeight(random(2,6));
  
  line (random(20,40), -35, 
        60, 0);
            
  line (random (40,85), -25,
        70, 40);
  
  line (70, random(-45,-30),
        60, 35);
        
}

//---------------------- REDRAW
void mousePressed () {
  redraw();
}

