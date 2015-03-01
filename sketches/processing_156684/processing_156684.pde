
int i=0;
void setup(){
  size(500,500);

}

void draw(){
  background(0);
  fill(0);
  
  
  for(int i=0; i<10; i++) {
    for(int j=0; j<10;j++){
  stroke(255 );
      ellipse(25+(i*50),25+(j*50),50,50);
      stroke(0,255,204);
      line((i*50)+25,0,(i*50)+25,height);
 
    }
  }
}
