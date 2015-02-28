
// Venetian Alligator, by Brian Wong, 2010
void setup(){
  size(500,500,P2D);                   // set size and draw method
  loadPixels();                        // load array of pixels
  background(0);
}

int n;
void draw(){
  for(int i=0; i<(250000); i++){
    n=pixels[i];
    if(i>100){
      n+=pixels[i-100]; 
    }
    if(i<100){
      n+=pixels[i+9900];
    }
    if(i<9900){
      n+=pixels[i+100];
    }
    if(i>9899){
      n+=pixels[i-9900];
    }
    if((i%500)>0){
      n+=pixels[i-1];
    }
    if(i%500==0){
      n+=pixels[i+99];
    }
    n=n/4;
    pixels[i]=n;
  }  
  updatePixels();
}


