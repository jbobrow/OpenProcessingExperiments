
void setup(){
  size(600,600);
  smooth();
  
}

void draw(){
  background(255);
  
  for(int i=0; i<600; i= i+30){
    for(int j=0; j<610; j= j+10){
    fill(i,mouseX,mouseY,j);
    textSize(20);
    text("JESS",i,j);
 }
}
}

                
                
