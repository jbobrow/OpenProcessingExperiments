
void setup (){
  size(400,400);
}
void draw(){
background(0);
 
  for(int i=0; i<600; i = i+30){
    for(int j=0; j<600; j=j+30){

       
  textSize(50);
  fill(255,0,0);
  text ("V",i, j);
  
    for(int k=0; k<600; k = k+45){
    for(int a=0; a<600; a = a+30){

  textSize(50);
  fill(255);
  text ("V",k, a);
  

  }
    }
}
}
  }

