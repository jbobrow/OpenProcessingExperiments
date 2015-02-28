
void setup() {
  size(900,550);
}

void draw(){
  for(int i=0; i<600; i = i+20){
    for(int j=0; j<900; j = j+20){
  
line(j,i-40,i-50,j+70);      
  fill(234,240,111,10);
  rect(j,i,10,30);
    
 textSize(20);
  fill(62,12,90);
  text("KB",j,i);
  
  stroke(0);
  line(j,i,j+50,i+46);
  line(j,i,j+24,i+23);
    }
}
}

