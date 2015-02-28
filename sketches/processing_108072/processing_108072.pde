
void setup (){
size(800,800);
background(230,100,80);
}

void draw(){
 noStroke();
 int ringSize = 600;
 int center = 400;
  
  for(int i = 0; i <= 300; i++){
     if(i%2==0){
       fill(255,255,0);
       ellipse(center,center, ringSize, ringSize);
     }
     
     else{
       fill(0,255,20);
       ellipse(center,center, ringSize, ringSize);
     }
     
     ringSize -= 2;
     }
  }
