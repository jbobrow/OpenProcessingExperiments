
void setup(){
 size(500,500); 
 background(100,100,0);
}

void draw(){
  for(int i=0;i<10;i++){
    for(int j=10;j<20;j++){
     line(0,i*10,width,j*10); 
    }
  }
}
