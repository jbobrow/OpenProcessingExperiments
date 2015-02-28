
void setup(){
  size(600,600);
  
  for(int i=0; i < 20; i++){
    fill(0);
    rect(0,i*30,width-1,15);
    
    fill(255);
    rect(i*30,0,15,height-1);
  }

}


