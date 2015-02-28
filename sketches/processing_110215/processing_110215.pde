
float value;
int c;
boolean i = false;
boolean value1 = false;

void setup(){
  size(600, 600);
  background(0);
  value = 120;
  c = 254;
}

void draw(){

 // background(181, 100, c, 50);
 fill(1);
  noStroke();
  ellipse(mouseX + 30, pmouseY, value, value);
  fill(240, 80, c, 5);
  rect(0, 0, 600, 600);


  if(value == 121 || value == 1){
  value1 = !value1;
  
  }
    
  if(!value1){
    value = value - 1;
    
    } 
    
    else{
      value = value + 1;
    }
  
  if (c==0 || c==255){ 
    i = !i;
  }
    
  if(!i){
   --c;
  }
   else{
     ++c;
   }
  

  
  
  
}
