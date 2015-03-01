
float i=0, j=0;
float biggness=50;
float frames2=0;
float k=0;
float ran;
 
void setup(){
  size(900,900);
  noStroke();
}
  
void draw(){
  
  frames2++;
  if(frames2>=440){
    frames2=0;
  }
  if(frames2%20==1){
    background(100,0,0);
    for(j=0;j<height/biggness+2;j+=1){ //y
      for(i=0;i<width/biggness+1;i+=1){ //x
        while(k<j+20){
          ran=random(biggness/8+frames2/32);
          ellipse(i*biggness-biggness/8+random(biggness),j*biggness-biggness/8+random(biggness)-biggness,biggness/16+ran,biggness/16+ran);
          k++;
        }
        k=0;
      }
    }
  }
}
