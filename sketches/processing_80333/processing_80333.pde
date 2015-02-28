
void setup(){
  size(400,200);
  noStroke();  
}

void draw (){ 
 background(0);
int i = 0;
  while(i <= 400){
    fill(random(255), random(255), random(255));
    rect(0,i,mouseX/1,200);
    i=i+1;
    
  }
}

