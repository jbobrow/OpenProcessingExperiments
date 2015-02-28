
float theta = radians(26);
float rad;

  float c=noise(10);
float xnoise;

void setup() {
  smooth();
  size(1200,700);
  noLoop();
}
void draw(){
    background(10,250);

  float a = 30;
  rad= radians(a);
  
  
  translate(width/2,height);
  split(100);
  
  
}




void organicLine(float x1, float y1, float x2, float y2, float strokeW)
{
  //strokeCap(ROUND);
  strokeWeight(strokeW);

  float numSections =12;

  float cx = x2-x1; // change in x
  float cy = y2-y1; // change in y

  float nx1 = x1;
  float ny1 = y1;
  float perc = 1/numSections;

  for (int i = 0; i < numSections; i++) {
    
    float n = random(-1,1);
    float u = random(-1,1);

    float nx2 = nx1 + perc * cx+n;
    float ny2 = ny1 + perc * cy+u;
 

    
    line(nx1, ny1, nx2, ny2);
   
    
    nx1 = nx2;
    ny1 = ny2;
    
    
  }
}






void split(float len) {

  float a= random(0.6,1.3);
  float b= random(0.6,0.99);
  float d= random(7,9);
  float e= random(-1.5,1.5);
  
  stroke(40,50,60,len*5);
  
  strokeWeight(len/d*0.9);


  rotate(random((-rad-0.2),(rad+0.3)));
  
  organicLine( 0, 0, 0, -len, abs(len)/18);

  translate(0,-len);



  if (len > 10) { 

    pushMatrix();
    rotate(theta*e);
    strokeWeight(len/d*0.7);

    split(len*b);
    popMatrix();

    pushMatrix();
    rotate(theta*e*b);
    split(len*b*0.6);
    popMatrix();

    
    if( a>0.7){
    pushMatrix();
    rotate(theta*a);

    strokeWeight(len/d*0.8);

    split(len*b);
    popMatrix();
    
    }
    
    
    if( len>60){
    translate(e,-a*2);

    strokeWeight(len/d*0.6);

     pushMatrix();
    rotate(theta*c);
    split(len*c);
    popMatrix();
    }
    
    if(e>1.2){
      noStroke();
      fill(250,160*a);
      ellipse(0,0,a*2,a*2);
    }
      
    
  }
  
  
  if(len<10){
  
   
  }
  
}




void mousePressed(){
  
 redraw(); 
}


