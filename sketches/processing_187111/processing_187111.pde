
void setup(){
  size(640,480);
  //background (255);
  strokeWeight(.5);
}
void draw(){ background (255);
/*
for(int j=50;j<height-50;j=j+20){
for(int i=50;i<width-50;i=i+20){
  line(i,j,i+10,j+10);
  line(i,j+10,i+10,j);
}
}
*/

//for(int j =0;j<height;j=j+10) {
  //for(int i=0;i<width;i=i+10){
   // line (i,j,i+10,j+10);
    //line(i,j+10,i+10,j);
 // }
//}//
for(int j =20;j<height;j=j+50) {
  for(int i=20;i<width;i=i+50){
  
    line (i,j,i+40,j+50);
  
    line(i,j+50,i+40,j);
  }
}
}
