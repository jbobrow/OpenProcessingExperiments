
void setup(){
  size(600,600);
smooth();
}


void draw(){
//  background(50);

  
 pushMatrix();
 
  float rv = map(mouseX,0,600,0,255);
  float gv = map(mouseX,0,800,0,255);  
  float bv = map(mouseX,0,1000,0,255);
  
  translate(width/2,height/2);
  for (int i=0;i<mouseX;i+=5){
  for (int r=0;r<255;r+=rv){
    for (int g=0;g<255;g+=gv){
      for (int b=0;b<255;b+=bv){
      stroke(r,g,b,10);
      }
    }
  }
  strokeWeight(i);
  rotate(PI/12);

  line(0,0,150,0);
  }
popMatrix();

}

