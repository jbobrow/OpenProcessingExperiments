
int i=0;
int k=0;
int l=0;
void setup(){
  size(500,500);

}

void draw(){
  background(0);
  fill(0);
  
  
  for(int i=0; i<10; i++) {
    for(int j=0; j<10;j++){
  stroke(0,255,204);
      ellipse(25+(i*50),25+(j*50),50,50);
      stroke(255,0,222);
      //elipses in circle
      ellipse(15+(i*50),15+(j*50),20,20);
      ellipse(35+(i*50),15+(j*50),20,20);
      ellipse(15+(i*50),35+(j*50),20,20);
      ellipse(35+(i*50),35+(j*50),20,20);

    }
    for(k=0;k<25;k++) {
      for (l=0;l<25;l++){
              //elipses lines
        ellipse((k*20)+5,(l*20)+5,10,5);
      }
    }
  }
}
