
//Based on program from Generative Design book by Hartmut Bohnacker
//Processing 2.0

int max = 25000;                //maximum number of particles
int count = 1;
float[] x = new float[max];
float[] y = new float[max];
float r = 1;                    //line length
PVector axis;
float dec=0.9999;               //decrease rate of stroke weight

void setup() {
  size(600,800);
  background(255,250,245);
  frameRate(900);
  smooth();
  stroke(128);
  x[0] = width/2;               //initial particle position
  y[0] = height-100;            //
}

void draw() {
  strokeWeight(3*dec);
  axis = new PVector(random(100,width-100),random(70,height-70));
  float minDist = 1000;
  int pin = 0;
  for(int i=0; i < count; i++) {                      //find the closest particle of the organism
    float updtDist = dist(axis.x,axis.y, x[i],y[i]);
    if (updtDist < minDist) {
      minDist = updtDist;
      pin = i; 
    }
  }
  float theta = atan2(axis.y-y[pin], axis.x-x[pin]);
  x[count] = x[pin] + cos(theta) * r*2;
  y[count] = y[pin] + sin(theta) * r*2;
  line(x[count],y[count],x[pin],y[pin]);              //attach new particle to the organism
  count++;
  if(dec>=0.3){  dec-=0.0001;  }                      //restrain minimum stroke weight
  else{  dec=0.3;  }
  if (count >= max){
    noLoop();                                         //stop program when all particles were drawn
  }
}


