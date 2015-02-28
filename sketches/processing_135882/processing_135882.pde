
void setup(){
  size(700,700);
  background(255);
}
float angle=-35;
float radius=250;
float r = 0.; 
float[] b = new float[8]; 
boolean k0 = false; 
boolean k1 = false; 
  float x=0;
  float y=50;
  float w=-225.;
  float a_radius=100;
  float a_angle =0;
  float a_x=cos(a_angle*PI/180)*a_radius;
  float a_y=sin(a_angle*PI/180)*a_radius;
  float b_radius=50;
  float b_angle=0;
  float b_x=cos(b_angle*PI/180)*b_radius;
  float b_y=sin(b_angle*PI/180)*b_radius;
  float c_radius=20;
  float c_angle=0;
  float c_x=cos(c_angle*PI/180)*c_radius;
  float c_y=sin(c_angle*PI/180)*c_radius;
    float s=0.01;
   float i;
  int n=2;
   
void draw() { 
  fill(0, 5); 
  rect(0, 0, width, height); 
  translate(width/2, height/2); 
  rotate(r); 
  stroke(255); 
  for (int i = 0; i<n; i++) { 
    float xcoord = cos(angle*TWO_PI/360)*radius; 
    float ycoord = sin(angle*TWO_PI/360)*radius; 
   
    strokeWeight(3); 
   stroke(mouseX,mouseY,mouseX*2,20);
   quad(xcoord+b[6], ycoord+b[1], xcoord+b[2], ycoord+b[3], xcoord+b[4], ycoord+b[5], xcoord+b[6], ycoord+b[7]); 
  noStroke() ; 
  float yy = map(sin(y), 1., -1., w, 500.); 
  fill(mouseX,mouseY,mouseY*2,50); 
  ellipse(250, yy, 100, 50); 
fill(mouseY,mouseX,mouseX*3,20);
ellipse(180, 30, 50, 50);

  if (mousePressed) { 
    y = 70.; 
  } 
  y = y+s; 
}

    if (k0 == true) { 
      b[0]++; 
    }  
    else { 
      b[0]--; 
    } 
    if (b[0] > 250 || b[0] < -250) { 
      k0=!k0; 
    }  
    if (k1 == true) { 
      b[1]--; 
    }  
    else { 
      b[1]++; 
    } 
    if (b[1] > 250 || b[1] < -250) { 
      k1=!k1; 
    }  
    radius=map(sin(angle), 1., -1., -150., 150.); 
    angle=angle+0.01; 
    r=r+.1; 
    rotate(TWO_PI/n); 
    


      } 












