
void setup(){
  size(300,600);
  background(180);
  smooth();
}
void draw(){
for (int i=0;i<10;i++){
  drawX(int (random(200)),int(random(30)),int(random(width)),int(random(height)),100);
      frameRate(10);

}
}
void drawX(int gray,int weight,int x ,int y, int size){
  stroke(170,30,gray,80);
  strokeWeight(weight);
    line(x,y,x+1,y+1);
    
  }

    


