
int counter;
float x = 250;
float y = 250;
float r = 10;
float step = 20;
float life = 255;
float h = 0;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode  
  reset();
}

void draw() {  //draw function loops 
for(i=0;i<50;i++){
  stroke(h,255,255-life);
  strokeWeight(1);
  noFill();
  //ellipse(x,y,life,life);
  line(random(500),random(500),random(500),random(500));
  //step=life/5;
  //x+=random(step)-step/2;
  //y+=random(step)-step/2;
  
  }
  stroke(0);
  //fill(0);
  strokeWeight(5);
  ellipse(x,y,life,life);
  r+=random(2)-1;
  if(r<=0){
      r=1;
  }
  life--;
  if(life<=-1){
  reset();
  }
}
void reset(){
life=255;
x = 250;
y = 250;
h=random(255)
background(h,255,255-life);
}
