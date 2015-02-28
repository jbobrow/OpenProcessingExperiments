
int counter;
int w = 650,h = 250;

void setup() {  //setup function called initially, only once
  size(650,250,P2D);
  background(255);  //set background white
 
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  background(255);
  noStroke();
  fill(0);
  
  
  for(int i =1  ; i < 60 ; i++) {
  
  if(i%2==0){
  fill(0);
  }else{
  fill(255);
  }
  
  float r = 125.0*(sin(millis()/(400.0+i+counter/3000.0))+1.0);
  float x = w/2+(w/2-r/2)*sin(millis()/(500.0+i+counter/300.0));
    ellipse( x , h/2, r,r);
  }
}

                
                                                                
