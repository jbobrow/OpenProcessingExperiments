

void setup() {
  size(700, 700);
}

void draw() {
  for (int i=0;i<=6;i++){
    for(int j=0;j<=6;j++){
  int x = 50+100*i; 
  int y = 50+100*j;
  float distance=dist(mouseX,mouseY,x,y); 
  if(distance<=25 ){
  fill(255,0,0);
  
 }else{fill(255);} ellipse(x, y, 50+distance, 50+distance);}} 

}




