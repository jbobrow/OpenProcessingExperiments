
// by Lucille Dobler

void setup(){
  size(600,600);
  background(0);
  noLoop();
}

void draw(){
  
  stroke(255,0,0);
  strokeWeight(4);
  fill(255,255,0);
  for (int i = 0; i <width; i=i+1){
    for (int a = 0; a<width; a=a+100){
  rect(i*61,a,50,50);
  }
 }
  
  fill(255,0,125);
  stroke(255,125);
  
  for (int j = 0; j<width; j=j+1){
    for (int b= 74; b<width; b=b+100){
    ellipse(j*30,b,25,25);
   
}
  }
  
 
}


