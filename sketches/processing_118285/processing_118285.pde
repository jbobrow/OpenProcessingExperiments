
void setup(){
  size(1300,1300);
  background(255,0,0);
  fill(255);
  noStroke();
}
void draw(){
  for(int i = 0;i<width;i += 3){
    for(int j = 0;j<height;j +=3){
   if(i%2==0 && j%2==0){
   fill(0,0,255);
   ellipse(i,j,2.5,2.5);}
   //else if(i%2==0 && j%2!=0){
     //fill(255);
      //ellipse(i,j,5,5);
    
else if(i%2!=0&&j%2!=0){
fill(0,255,0);
ellipse(i,j,2.5,2.5);
}
//else if(i%2==0&&j%2!=0){
  //fill(255,0,0);
  //ellipse(i,j,2.5,2.5);
//}
   }
 }
    }
  
  




