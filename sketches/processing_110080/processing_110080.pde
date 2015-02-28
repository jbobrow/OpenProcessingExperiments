
float value;
int c;
boolean i = false;

void setup(){
  size(600, 600);
  background(0);
  value = 99;
  c = 254;
}

void draw(){

 // background(181, 100, c, 50);
 fill(1);
  noStroke();
  ellipse(mouseX + 30, pmouseY, value, value);
  fill(181, 100, c, 1);
  rect(0, 0, 600, 600);

  value = value -1;

  if(value == -120){
    value = 120;
    
  }
  
  if (c==0 || c==255) 
    i = !i;
    
  if(!i){
   --c;
  }
   else{
     ++c;
   }
   println(value);
  
  
}


