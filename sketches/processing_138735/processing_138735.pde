
float i=0, j=0;
float biggness=50;
float frames2=0;
//float[] randoms = new float[500];
float k=0;
float ran;
void setup(){
//  background(20);
  size(900,600);
  noStroke();
/*  for(i=0;i<500;i++){ //x
    randoms[i]=random(360);
    
  } */
}

void draw(){

  frames2++;
  if(frames2>=440){
    frames2=0;
  }
  if(frames2%20==1){
    background(20);
    for(j=0;j<height/biggness+2;j+=1){ //y
      for(i=0;i<width/biggness+1;i+=1){ //x
        while(k<j){
          ran=random(biggness/4+frames2/8);
          ellipse(i*biggness-biggness/2+random(biggness),j*biggness-biggness/2+random(biggness)-biggness,biggness/4+ran,biggness/4+ran);
          k++;
        }
        k=0;
      } 
    }
  }
}
