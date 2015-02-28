
int counter;
float x;
float angle;
float da;
float[][] particles; 
float[6] p;
float speed;
bool alreadyPressed;
int i;
float radius;
float k;

void setup() {  //setup function called initially, only once
  size(900, 400);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  da = -0.001;
  particles = new float[100][4];
  numParticles = 0;
  speed = 5;
  particles[i][0] = 0;
  particles[i][1] = height;
  particles[i][2] = 0;
  particles[i][3] = 3;
  particles[i][4] = 2;
  particles[i][5] = 4;
 
 
  
  smooth();
  k = 0.001;
  angle = 0;
  i = 0;
  radius = 5;
  alreadyPressed =false;
  
  
 
  
  
  
}

void draw() {  //draw function loops 
  background(255);
  
  //line(0,height, 0 + 100*cos(angle), height - 100*sin(angle));
  angle = angle + da;
  if( angle > PI/2 ){
    angle = PI/2;
    da = -da;
  }
  
  if( angle < 0 ){
     angle = 0;
     da = -da;
  }
  
  if( mousePressed && !alreadyPressed){
     angle = angleFromTo(0,height,mouseX,mouseY);
     speed = dist(0,height,mouseX,mouseY)/30;
     particles[numParticles][0] = 0;
     particles[numParticles][1] = height;
     particles[numParticles][2] = speed*cos(angle);
     particles[numParticles][3] = speed*sin(angle);
     particles[numParticles][4] = 0;
     particles[numParticles][5] = 0.3;
     particles[numParticles][6] = int( 2 +  random(10));
     alreadyPressed = true;
     
     numParticles++;
  }
  

  i = 0;
  while( i < numParticles ){
     
     updateParticle(particles[i]);
     i++;
  }
  
     
  
  
  
  
  
  
  
  
  
  
}


void updateParticle( float[4] p ){


stroke(0);


strokeWeight(p[6]); 


point(p[0],p[1]);

strokeWeight(1);
stroke(int(dist(width/2,height/2,p[0],p[1])) );
line(width/2,height/2,p[0],p[1]);

p[0] += p[2];
p[1] += p[3];

p[2] += p[4];
p[3] += p[5];

p[4] = -k*(p[0] - width/2);
//p[5] =  2 -k*(p[1] - height/2);



}


float angleFromTo( float xFrom, float yFrom, float xTo, float yTo){
   float height;
   float width;
   
   height = yTo - yFrom;
   width = xTo - xFrom;
   
   return(atan(height/width));
 }
 
void mouseReleased(){
   alreadyPressed =false;
}


                
                                                
