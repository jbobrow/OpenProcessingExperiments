
int i = 0;


void setup(){ 
background(100, 100, 100); 
  size(500, 500); 
}

void draw(){
  //background(100, 100, 100); 
  
  stroke(i, 200, 100); 

  line(10, 10+i, 300, 10+i); 
  
  i = i + 5;
  
  if(i>400){
     i=0;
     background(100, 100, 100); 
  }
  
}
