
int r = 300;


void setup(){
  size(700,700);
  smooth();
}

void draw(){
  
  background(50);
  
  translate(width/2, height/2);
  rotate(frameCount*0.1);
  
  strokeWeight(2);
  
  for(float i=2; i < 255; i+=3){
    for(float j = 2; j < 255; j +=3){
    
      float x = r * cos(i) * cos(j);
      //float y = r * sin(i)-20 * sin(j)-20;
      float y = r * sin(i) * cos(j);
      stroke(i*0.9, j*0.9, 200);
      point(x,y);
      
      // Try lines
//      float x = r * cos(i) * cos(j);
//      float y = r * cos(i) * sin(j);
//      stroke(i*0.002, j*0.9, 200);
//      
//      line(0,0,x,y);

    }
  }
  
 
}
