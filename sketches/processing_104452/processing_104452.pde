
int j = 0;
float []x = new float[255];
float []y = new float[255];
int c = 0;
int k = 0;
void setup(){
size(500,500);
for(int i =0;i<250;i=i+1){
  x[i] = random(500);
  y[i] = random(500); 
}
}
void draw(){
if(c<500){
  c++;
}else if (k<1000){
k++;

  }else{
  c=-500;
  k=0;
  }
   for( j =0;j<250;j=j+1){
fill(random(255),random(255),random(255));
ellipse(x[j]+c-k,y[j],20,20);
    }
  

}


