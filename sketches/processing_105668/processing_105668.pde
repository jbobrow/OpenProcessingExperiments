

int max;
color random;
float randomhue;
float randomsat;
float randomframerate;
float randomtransparency;
float randomX;
float randomY;

void setup(){
  size(600,600);
}

void draw (){
  colorMode(RGB,255);
  background(88,89,91);
  
  randomframerate=random(2,20);
  
  frameRate(randomframerate);
  noStroke();
 int max=height/10; 
 colorMode(HSB, max);
 
 randomhue=random(0,max);
 randomsat=random(0,max);
 
 
 for (int i =0; i<max;i++){
   for (int j=0; j<max; j++){
     
     fill(0,0,randomsat+i*1.5,100);
     rect(i*90+3.5,j*90+3.5,70,70);}
 }

     for (int k = 0;k<max;k++){
         for (int l = 0; l<max;l++){
        
           fill(randomhue+k*1.5,randomsat+l*1.5,100);
           rect(k*30+5,l*30+5,7,7);
         }
       }
       
       randomX=random(0,7);
       randomY=random(0,7);
       
       for (int p=0;p<max;p++){
         for (int q=0;q<max;q++){
           fill(0,0,max);
           rect(p*15,q*15,randomX,randomX);
         }
       }


}


