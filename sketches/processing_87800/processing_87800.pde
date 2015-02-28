
void setup(){
  size (500, 500);
  smooth();
  background(125);
}

void draw(){
 strokeWeight(.5);
 noFill();
for(int i=0;i<980;i+=4){
   stroke(215);
  line(i*.75,0,500,i*3);
  
  stroke(0);
  line(0,i*1,500,i*3);
  
  stroke(130);
  strokeWeight(1);
  line(0,i*1,300,i*99);
}
 
}


