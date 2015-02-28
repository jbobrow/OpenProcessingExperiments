
int d=20;
int s=30;
void setup(){
  size(400,400);
}
void draw(){
  background(0);
  //simple
  
  for(int i =0;i<=width;i=i+s){
      for(int j =0;j<=height;j=j+s){
        noFill();
        strokeWeight(1);
        stroke(255);
        ellipse(i,j,s,s);
      }
    }
  
  //complex
  if(mousePressed){
    background(0);
    for(int i =0;i<=width;i=i+s){
      for(int j =0;j<=height;j=j+s){
        noFill();
        strokeWeight(2);
        stroke(i,j,d);
        ellipse(i,j,d,d);
      }
    }
    d=d+1;
  }
}
