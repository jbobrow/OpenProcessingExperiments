
int x= 0; 

void setup(){
  size(600,600);
}

void draw() {
  background(0);
  x= x+1; 
  if(x>30){
    x=0;
  }
  
  for(int i=x; i<600; i = i+30){
    for(int j=0; j<600; j= j+60) {
      for(int k=0; k<600; k= k+100){
      
 
 textSize(24);
fill(i,j,mouseX);
    text("C",i,j);
    
     textSize(24);
fill(i,j,mouseY);
    text("D",j,i);
      
fill(255,i,0,i);
    rect(i,j,10,10);
    
fill(255,j,mouseY);
ellipse(k,j,10,10);

fill(255,k,mouseX);
rect(i,k,20,20);

    
    
    
  }
    }
  
}
}

