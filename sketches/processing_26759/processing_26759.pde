
void setup() {
  size(900,550);
}

void draw(){
  for(int i=0; i<600; i = i+30){
    for(int j=0; j<900; j = j+30){
     
  fill(218,242,39,20);
  rect(j,i,10,40);
    
 textSize(28);
  fill(0);
  text("KB24",j,i);
  
  stroke(0);
  line(j,i,j+100,i+80);
  line(j,i,j+50,i+60);
    }
}
}

