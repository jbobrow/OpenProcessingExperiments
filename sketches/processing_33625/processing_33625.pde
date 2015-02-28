

int line_distanxe = 10;
int line_space =10;

void setup(){
//frameRate(10);
  noLoop();
  size(256,256);
}

  void draw(){
   for(int i = 0; i < 256;i=i+1){ 
   for(int j = 0;j < 256; j+=1 ){
      stroke(i,j,0);
      point(i,j);
   }
   
  }    
  
}   
   
 //void dog(){
 // for(int i = 255; i >= 0;i=i-1){ 
 //   for(int j = 255;j >= 0; j-=1 ){
 //      stroke(255-i,255-j,0);
 //      point(i,j);
 
 // }
   
// }    
  
//}

