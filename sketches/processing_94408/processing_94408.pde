
float theta = radians(26);

  float c=noise(10);
float xnoise;

void setup() {
  size(1200,700);
  noLoop();
}
void draw(){
  
  background(250,180);
  translate(width/2,height);
  split(100);
  
  
}


void split(float len) {

  float a= random(0.6,1.3);
  float b= random(0.6,0.99);
  float d= random(7,9);
  float e= random(-1.5,1.5);
  
  stroke(130,len*11);
  
  
  strokeWeight(len/d*0.9);

  rotate(theta*e*0.8);

  line(0,0,0,-len);
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
    
    if(len<11){
      noStroke();
      fill(250,230);
      ellipse(0,0,a*2,a*2);
    }
      
    
  }
  
  
  if(len<10){
  
   
  }
  
}




void mousePressed(){
  
 redraw(); 
}


