
int circle_width =20;
int max_i = 0;
int rate = 30;
int count =0;

float tick = 4;
float r = random(3,30);

void setup () {
  size(400, 400); 
  noFill();
  noStroke();
  background(0);
  colorMode(HSB,1);
  
  //frameRate(rate);
  max_i = round(width/circle_width);
}

void draw() {
  translate(width/2, height/2);
  background(0);

  pushMatrix();
  tick = millis()/500.0;
  
  
  for (int i=max_i; i>0; i--) {
    rotate(sin(tick/100.0));
    for (int j=0;j<16;j++) {

     float x = pow(sin(j/r*PI + tick),2) + pow(cos((float) i/max_i * HALF_PI+ tick),2);
     if(x>.99) x = 0;
     print(x + " ");
        //stroke(0,0,0,0.1);
           fill(
             //map(cos( (j+tick)*PI/16.0 ) ,  -1, 1, 0, 1),
             1- (x)   , 
             3 * x * (float) i/max_i,
             3 * x *(float) i/max_i,
             1
            );
      
     
      arc(0, 0, circle_width*i, circle_width*i, 
      PI/8.0*j, 
      PI/8.0*(j+1) );
    }
  }
  
   popMatrix();
   
}
