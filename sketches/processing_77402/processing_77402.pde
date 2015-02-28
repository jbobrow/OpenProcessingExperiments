
int timeFlag = 0;
int f = 0;
//int r = 600;

void setup(){
  size(1270, 600);  
}

void draw(){
  background(255);
  //stroke(255);
  //strokeWeight(mouseY/100);
  for(int x=0; x<1270; x+=2){
    
   line(x, 0, x*4, f); 
  }
  f++;
  
 if ( millis() >= timeFlag + 1000 ) {
    timeFlag = millis();
    saveFrame("imag-####.jpg"); 
  }
  
  //if(mousePressed){
   //saveFrame("imag-####.jpg"); 
}



