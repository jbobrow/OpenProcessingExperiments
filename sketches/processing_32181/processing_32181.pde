
void setup(){
 size(500,400);
 background(0);
}

void draw(){
 noStroke();
 fill(0,30);
 rect(0,0,500,400);
 int i;
 for(i=0; i<=500; i+=5){
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(i,random(0,400),10,10);
  }
 } 
 
                
                
