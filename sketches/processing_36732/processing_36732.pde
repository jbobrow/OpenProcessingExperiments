
size(500, 400); 
smooth();
background(13,250,100); 
noStroke(); 

float bo = random(15,25); 
float boxs = 20; 


for (int i = 1; i < width; i += 40){
  if(bo >1){
    

     }
    for(int j = 10; j <=width; j+=boxs){
      fill(bo-10, bo+70, bo+46);
      ellipse(i,j, bo+15, bo+15);
    }
    for(int j = 10; j <=width; j+=boxs){
      fill(bo*10, bo*80, bo-34);
      ellipse(i, j, bo, bo);
     }
    for(int j = 10; j <=width; j+=boxs){
      fill(bo*10, bo-80, bo-34);
      ellipse(i, j, bo-10, bo-10);
     }

}

 
float pp = 100;
float linesp = 16;
int   nLines = 30;
 
for (int i=1; i<=30; i=i+1) {
 
 stroke(15,110,90);
 float d = random(1,2);
  strokeWeight(d);
  line (0, i*linesp-40, 500, i*linesp+200);
    strokeWeight(d);
    line (0, i*linesp+40, 500, i*linesp-200);
}

                
                                
