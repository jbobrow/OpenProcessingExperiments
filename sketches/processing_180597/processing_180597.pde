
void setup(){
  size(800,800);
  frameRate(25);
  smooth();
  colorMode(HSB, 100);
  for (int y=0;y<height;y=y+60){
      for (int x=0;x<height;x=x+60){
          fill(random(100),70);
          rect(x,y,60,60);
      }
  }
}

int s = 0;
int r = 0;
float h = 0;

void draw(){ 
  //noStroke();
  translate(width/2, height/2);
  rotate(r);
  r=r+1;
  fill(h,100,100,20);
  h=(h+0.5)%100;
  rect(0,0,s,s/6);
  s=(s+2)%(width/2);
  if (mousePressed){
      save("an_image.png");
  }
}
