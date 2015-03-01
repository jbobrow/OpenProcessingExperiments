
void setup(){
  size(600,400);
}

void draw(){
  for(int i =0; i<width/50; i = i +1){ //local variable!
     for(int j =0; j<height/50; j = j +1){
    noStroke();
    fill(i*20, j*20,0);
    rect(i*50,j*50,50,50);
     fill(i*20);
     rect(i*50+20,j*50+20,20,20);
    fill(255-i*20);
    text(width/50*j +i,i*50+23,j*50+35);
     }
  }
 
}
