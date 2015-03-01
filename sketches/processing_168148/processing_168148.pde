
boolean m_c = true;

void setup() {
  size(600, 1000,P3D);
  background(255);
  frameRate(10);
}

void draw() {
  translate(width/2, height/3, 0);
  
  //rotate X for view angle
  rotateX(radians(75)); //331.3 - >262.091753(deg), 75(deg)
  d_b = random(10, 30);
  wreck1 = random(-15, 15);
  wreck2 = random(-15, 15);
  wreck3 = random(-15, 15);
  wreck4 = random(-15, 15);

  
  if(m_c){ //<>//
  background(255);
 
  
  //body
  body();
  
  //neck
  neck_set();
 
  //head
  spere_head();
  
  }
}

void keyPressed() {
  background(255);
  spere_pattern();
  neck_set();
  body();
  m_c = !m_c;
}

void neck_set() {
  fill(brt_n*random(125,255), brt_n*random(125,255), brt_n*random(125,255),200);
  neck(r1, 1, 0); //skin
  fill(brt_n*random(125,255), brt_n*random(125,255), brt_n* random(125,255),200);
  neck(r2, 1, 1); //flash
  fill(brt_n*255, brt_n*255, brt_n*255);
  neck(r3, delta, 6); //bone
}

void body() {
  stroke(126);
  fill(random(125,255), brt_b*random(125,255), random(125,255),200); 
  r_4 = 90;
  bi_b = 0.87;
  i_b = 30;
  body_lp();
}

//NECKS
float delta = 50;
float r1 = 80; //skin rad
float r2 = 70; // flash rad
float r3 = 30; // bone rad
//float i = 100;
float l = 400; //length of neck part
float d = 60; //department between the parts
float z_n = -260; //distance between orbital

//body
float l_b = 900; // length of the body
float d_b; // distance between lines
float r_4 = 90; //body radious, first value
float bi_b = 0.87; // decreasing ratio
float i_b = 30; // decreasing value, first value
float z_b = -420;

//head
float delta_h = 3;
float theta, theta_r, pol, pol_r; //var for degrees, _r are for the radians transformation.
float x, y, z; //for head cordinates
float r; //radious of head

int [] pattern_x = {5, 15, 30, 46, 62, 95}; // pattern code

//light


float lx = 5;
float ly = 5;
float lz = 5;
float brt_b;
float brt_n;
float[] ax = new float[37];
float[] ay = new float[37];
//float[] az = new float[43];
float wreck1;
float wreck2;
float wreck3;
float wreck4;


void body_lp() {
  for(float z = z_b; z>-l_b; z-=d_b) {
    beginShape(TRIANGLE_STRIP);
    for (float theta = 0; theta<=360; theta+=10) {
     
     float rads = radians(theta);
     float x = r_4*cos(rads);
     float y = r_4*sin(rads);
     if (!(z == z_b)) {
       vertex(ax[floor(theta/10)]+wreck1, ay[floor(theta/10)]+wreck2, z+d_b);
       
       float cx_b = ((y+wreck4)*(z+d_b) - (y+wreck4)*(ay[floor(theta/10)]+wreck2));
       float cy_b = ((x+wreck3)*(z+d_b) - z*(ax[floor(theta/10)]+wreck1));
       float cz_b = ((x+wreck3)*(ay[floor(theta/10)]+wreck2) - (y+wreck4)*(ax[floor(theta/10)]+wreck1));
       
       float size = sqrt(cx_b*cx_b+cy_b*cy_b+cz_b*cz_b);
       cx_b = cx_b/size;
       cy_b = cy_b/size;
       cz_b = cz_b/size;
       
       brt_b = abs(cx_b*lx + cy_b*ly +cz_b*lz);
     }
     vertex(x+wreck3, y+wreck4, z);
     ax[floor(theta/10)] = x;
     ay[floor(theta/10)] = y;
    }
    r_4+=i_b;
    i_b*=bi_b;
    endShape();
  }
 
}
void spere_head() {
  stroke(0, 30);
  sphere(5);
  for (theta = 0; theta < 360; theta+=5) {
    for(pol = 0; pol < 180; pol+=delta_h) {
      theta_r = radians(theta);
      pol_r = radians(pol);
      r = random(100, 230);
      x = r*sin(pol_r)*cos(theta_r);
      y = r*sin(pol_r)*sin(theta_r);
      z = r*cos(pol_r);
      strokeWeight(1.5);
      stroke(random(125, 255), random(125, 255), random(125, 255));
      point(x, y, z);
    }
  }
}

void spere_pattern() {
  float i = random(0, 6);
  int j = floor(i);
  int k = pattern_x[j];
  stroke(random(250), random(250), random(250),200);
  for (theta = 0; theta < 360; theta+=5) {
    for(pol = 0; pol < 180; pol+=delta_h) {
      theta_r = radians(theta);
      pol_r = radians(pol);
      r = 230;
      x = r*sin(pol_r)*cos(theta_r);
      y = r*sin(pol_r)*sin(theta_r);
      z = r*cos(pol_r);
      //stroke(random(00), random(100), random(100));
      line(x, y, z, x+10, y+10, z+10);
      rotate(PI/k);
    }
  }
}  
void neck(float r_n, float d_n, float h_n) {
  for(float z = z_n ; z>-l; z-=d) {
    beginShape();
    for (float theta = 0; theta<=360; theta+=d_n) {
      float rads = radians (theta);
      float x = r_n*cos(rads);
      float y = r_n*sin(rads);
      vertex(x, y, z+h_n);
      //vertex(x, y, z-30);
     }
    
    endShape();
    
    beginShape(TRIANGLE_STRIP);
    for (float theta = 0; theta<=360; theta+=d_n) {
      float rads = radians (theta);
      float x = r_n*cos(rads);
      float y = r_n*sin(rads);
      vertex(x, y, z+h_n);
      vertex(x, y, z-20);
      float cx_n = y*(z-20) - y*y;
      float cy_n = x*(z-20) - (z+h_n)*x;
      float cz_n = x*y - y*x;
      float size = sqrt(cx_n*cx_n+cy_n*cy_n+cz_n*cz_n);
      cx_n = cx_n/size;
      cy_n = cy_n/size;
      cz_n = cz_n/size;
      brt_n = abs(cx_n*lx + cy_n*ly + cz_n*lz);
     }
    
    endShape();
  }
  float cx_n = y*(z-20) - y*y;
  float cy_n = x*(z-20) - (z+h_n)*x;
  float cz_n = x*y - y*x;
  
}


/*void neck_skin(float r_n, float d_n) {
  for(float z = z_n ; z>-l; z-=d) {
    beginShape();
    for (float theta = 0; theta<=360; theta++) {
      float rads = radians(theta);
      float x = r1*cos(rads);
      float y = r1*sin(rads);
      vertex(x, y, z);
      
    }
    endShape();
  }
}

void neck_flash() {
  for(float z = z_n; z>-l; z-=d) {
    beginShape();
    for (float theta = 0; theta<=360; theta++) {
      float rads = radians(theta);
      float x = r2*cos(rads);
      float y = r2*sin(rads);
      vertex(x, y, z+1);
      
    }
      endShape();
  }  
}


void neck_bone() {
  for(float z = z_n; z>-l; z-=d) {
    beginShape();
    for (float theta = 0; theta<=360; theta+=delta) {
      float rads = radians(theta);
      float x = r3*cos(rads);
      float y = r3*sin(rads);
      vertex(x, y, z+2);
      
    }
    endShape();
  }
} */


