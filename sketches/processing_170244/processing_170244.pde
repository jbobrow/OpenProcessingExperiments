
int eSize = 5;

size(400,400);
background(0);
smooth();
noFill();


for(int i =0; i <10; i+=5 ){
for(int y=0; y<=width-i; y+= 10) {
for(int x=0; x<=height-y; x+= 10) {

  
  if( x >= 20 && x <= 40 || x== 60 || x== 200 || x== 270 || x == 300 || x== 310 || x== 350){
    fill(0,x,200,230);
  }else if( x== 60 && height== 300 ){
    fill(255);
  }else{
    fill(255);
  }
  
  
  
 stroke(0,x,200,230);
 ellipse(x,y,eSize,eSize);
line(0,200,x,height); 

}
}
}


