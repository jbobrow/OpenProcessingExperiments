
float delta = 10;
int cnt=0;

void setup(){
size(800,800);
background(0);

}

void draw(){
for (int y=0; y<height;
y+=delta) {
  for (int x=0; x<width; x+=delta){
    noStroke();
    if(cnt%3==0) {
      fill(120+y,60+x,200);
      rect(x,y,x+delta,y+delta);
    }if(cnt%3==1) {
       fill(60+y,120+x,230);
      rect(x,y,y+delta,x+delta);
    }if(cnt%3==2){
      fill(60+x,120+y,220);
      ellipse(x,y,x+delta,y+delta);
    }
    }
    cnt++;
  }
}
