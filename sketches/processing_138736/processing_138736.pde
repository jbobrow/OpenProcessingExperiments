
float i=0, j=0;
float biggness=50;
float frames2=0;
//float[] randoms = new float[500];
float k=0;
float ran;
void setup(){
//  background(20);
  size(901,601);
  background(10);
/*  for(i=0;i<500;i++){ //x
    randoms[i]=random(360);
    
  } */
}

void draw(){

  frames2++;
  if(frames2>=360){
    frames2=0;
  }
  if(frames2%120==1){
    background(10);
    for(j=0;j<height/biggness;j+=1){ //y
      for(i=0;i<width/biggness;i+=1){ //x
        while(k<=j){
          if((i+1)>=random(width/biggness)){
            stroke(random(30)+30);
            fill(random(55)+150,150+random(95));
            ran=random(biggness/8);
            ellipse(i*biggness+random(biggness),j*biggness+random(biggness),biggness/4+ran,biggness/4+ran);
          }
          k++;
        }
        k=0;
      } 
    }
  }
  noFill();
  stroke(235);
  for(j=0;j<height/biggness;j+=1){ //y
    for(i=0;i<width/biggness;i+=1){ //x
      rect(i*biggness,j*biggness,biggness,biggness);
    }
  }
  /*
  if(frames2%20==1){
    i=0;
    j=0;
    fill(235,100);
    ellipse(i*biggness+random(biggness),j*biggness+random(biggness),biggness/4+ran,biggness/4+ran);
  }
  */
}
