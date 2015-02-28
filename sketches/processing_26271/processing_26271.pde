
void setup (){
  size(600,600);
}
void draw(){
background(43,187,193);

  for(int i=0; i<600; i = i+20){
    for(int j=0; j<600; j=j+20){
      
  textSize(50);
  fill(i,j,random(100));
  text ("0*0",i, j);
   
   fill(0,100);
   stroke(255);
  
   fill(i+j,j,random(10));
   ellipse(i+j,i,j,i+j);
  }
}
}

