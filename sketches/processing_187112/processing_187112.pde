
void setup(){
  size(640,480);
  //background (255);
  strokeWeight(.5);
}
void draw(){ background (255);

for(int j=50;j<height-50;j=j+20){
for(int i=50;i<width-50;i=i+20){
  line(i,j,i+10,j+10);
  line(i,j+10,i+10,j);
}
}

  for(int i=50;i<width-50;i=i+20){
    for(int j=50;j<width-50;j=j+20){
  
    line (i,j,width/2,height/2);
    }
   
  }

}
