
int NUM_SAMPLES = 1000;
int radius = 200;

float CIRC1_X = 240;
float CIRC1_Y = 225;

float CIRC2_X = 680;
float CIRC2_Y = 225;

Sample[] g_samples;

void setup() {
  size(900, 450);
  
  g_samples = new Sample[NUM_SAMPLES]; 

  for (int i = 0; i < NUM_SAMPLES; i++) {
    g_samples[i] = new Sample();
    float u1 = random(1);
    float u2 = random(1);
    g_samples[i].u1 = u1;
    g_samples[i].u2 = u2;
    
    // now, let's do the equi-areal mapping
    g_samples[i].theta1 = TWO_PI * g_samples[i].u1;
    g_samples[i].r1 = radius * sqrt(g_samples[i].u2);
    
    
    // and now, the Shirley map
    float a = u1 * 2 - 1; 
    float b = u2 * 2 - 1;
    float r2= 0;
   float theta2 = 0;
    if (a > -b) {
      if (a > b) {
         
         r2 = radius  * a;
         theta2 = (PI / 4.0) * (b/a);
      }
      else {
         r2 = radius * b;
         theta2 = (PI / 4.0) * (2 - (a/b)); 
      }
    }
    else {
      if (a < b) {
         r2 = radius * -a;
         theta2 = (PI/4) * ( 4 + (b/a)); 
      }
      else {
         r2 = radius * -b;
        if (b != 0) 
           theta2 = (PI/4.0) * (6 - (a/b));
        else 
           theta2 = 0;
       
      }
    }
    g_samples[i].r2 = r2;
    g_samples[i].theta2 = theta2;
  } // end for 1000
}

class Sample {
  float u1;
  float u2;
  float theta1;
  float r1;
  float theta2;
  float r2; 
}

float time = 0;

void draw() {
  background(0);
  

  stroke(50, 50, 50);
  fill (255, 255, 255);
  ellipse(CIRC1_X, CIRC1_Y, radius*2, radius*2);

  ellipse(CIRC2_X, CIRC2_Y, radius*2, radius*2);


  stroke(255, 0, 0);

  for (int i = 0; i < NUM_SAMPLES; i++) {
   
    float u1 = g_samples[i].u1;
    float u2 = g_samples[i].u2;
    
    float theta = g_samples[i].theta1;
    float r = g_samples[i].r1;
    
    float x1_0 = (CIRC1_X - radius*0.5) + radius * g_samples[i].u1;
    float x1_f = CIRC1_X + r * cos(theta);
    float x1 = (1 - time) * x1_0 + time * x1_f;
    
    float y1_0 = (CIRC1_Y - radius*0.5) + radius * g_samples[i].u2;
    float y1_f = CIRC1_Y + r * sin(theta);
    float y1 = (1 - time) * y1_0 + time * y1_f;

    stroke(u1 * 255, 0, u2 * 255);
    fill (u1*255, 0, u2*255);
    ellipse(x1, y1, 5, 5);

    
    float theta2 = g_samples[i].theta2;
    float r2 = g_samples[i].r2;
    
    float x2_0 = (CIRC2_X - radius *0.5) + (radius) * g_samples[i].u1;
    float x2_f = CIRC2_X + r2 * cos(theta2);
            float x2 = (1 - time) * x2_0 + time * x2_f;

    float y2_0 = (CIRC2_Y - radius*0.5) + (radius) * u2;
    float y2_f = CIRC2_Y + r2 * sin(theta2);
        float y2 = (1 - time) * y2_0 + time * y2_f;


    ellipse(x2, y2, 5, 5);
    

  }
  
  if (time < 1) 
    time += 0.004;
  else time = 1;
  
}

