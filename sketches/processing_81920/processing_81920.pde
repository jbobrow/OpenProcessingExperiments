
float A_radius = 1.0;
float B_radius = 0.3; //Radius of axis
int n = 3; //Number of blades
int objang = 0; //Rotation angle

void setup() {
  size(200,200);
}

//change blade's number
void mouseClicked() {
  if (n > 24) {
    n = 3;
  } else {
    n++;
  }
}

//Based on: http://en.wikipedia.org/wiki/Line-line_intersection#Mathematics
float[] intersections (float x1,float y1,float x2,float y2,float x3,float y3,float x4,float y4) {
  float NTRSCTN[] = new float[2];
  NTRSCTN[0] = ((x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*x4))/((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
  NTRSCTN[1] = ((x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*x4))/((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
  return NTRSCTN;
}

void draw() {
  //Coordinates of the line segment
  float A_x[] = new float[n];
  float A_y[] = new float[n];
  float B_x[] = new float[n];
  float B_y[] = new float[n];
  //Middle point of the line segment
  float F_x[] = new float[n];
  float F_y[] = new float[n];
  //Coordinates of perpendicular bisector
  float C_x[] = new float[n];
  float C_y[] = new float[n];
  float D_x[] = new float[n];
  float D_y[] = new float[n];
  //Intersections
  float NTRSCTNS_x[] = new float[n];
  float NTRSCTNS_y[] = new float[n];
  /* Calculations */
  for (int i = 0; i < n; i++) {
    //Line segments
    float ang = i * (360/n)-90;
    A_x[i] = A_radius * cos(radians(ang));
    A_y[i] = A_radius * sin(radians(ang));
    B_x[i] = B_radius * cos(radians(ang));
    B_y[i] = B_radius * sin(radians(ang));
    //Middle points of line segments
    F_x[i] = (A_x[i] + B_x[i])/2;  
    F_y[i] = (A_y[i] + B_y[i])/2;
    //Perpendicular bisectors  
    A_x[i] -= F_x[i]; B_x[i] -= F_x[i];
    A_y[i] -= F_y[i]; B_y[i] -= F_y[i];
    C_x[i] = A_x[i] * cos(radians(-90)) - A_y[i] * sin(radians(-90)) + F_x[i];
    C_y[i] = A_x[i] * sin(radians(-90)) - A_y[i] * cos(radians(-90)) + F_y[i];
    D_x[i] = B_x[i] * cos(radians(-90)) - B_y[i] * sin(radians(-90)) + F_x[i];
    D_y[i] = B_x[i] * sin(radians(-90)) - B_y[i] * cos(radians(-90)) + F_y[i];
    A_x[i] += F_x[i]; B_x[i] += F_x[i];
    A_y[i] += F_y[i]; B_y[i] += F_y[i];
  }
  
  //Calculate intersections
  for (int i = 0; i < n; i++) {
    if (i==(n-1)) {
      NTRSCTNS_x[i] = intersections (C_x[i],C_y[i],D_x[i],D_y[i],C_x[0],C_y[0],D_x[0],D_y[0])[0];    
      NTRSCTNS_y[i] = intersections (C_x[i],C_y[i],D_x[i],D_y[i],C_x[0],C_y[0],D_x[0],D_y[0])[1];    
    } else {
      NTRSCTNS_x[i] = intersections (C_x[i],C_y[i],D_x[i],D_y[i],C_x[(i+1)],C_y[(i+1)],D_x[(i+1)],D_y[(i+1)])[0];    
      NTRSCTNS_y[i] = intersections (C_x[i],C_y[i],D_x[i],D_y[i],C_x[(i+1)],C_y[(i+1)],D_x[(i+1)],D_y[(i+1)])[1];    
    }
  }
  //Draw
  stroke(0);
  background(#3D4035);
  translate(width/2, height/2);
  objang++;
  rotate (radians(objang));
  beginShape();
  for (int i = 0; i < n; i++) {
    vertex(int(int(width/3)*B_x[i]),int(int(width/3)*B_y[i]));
    vertex(int(int(width/3)*NTRSCTNS_x[i]),int(int(width/3)*NTRSCTNS_y[i]));
    if (i==(n-1)) {
      vertex(int(int(width/3)*A_x[0]),int(int(width/3)*A_y[0]));
      vertex(int(int(width/3)*B_x[0]),int(int(width/3)*B_y[0]));
    } else {
      vertex(int(int(width/3)*A_x[(i+1)]),int(int(width/3)*A_y[(i+1)]));
    }
  }
  endShape(CLOSE);
  fill(#B9C0A2);
}


