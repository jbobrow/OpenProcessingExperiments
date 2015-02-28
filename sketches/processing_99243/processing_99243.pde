
int i=0;

void setup()
{
  size(400,400);
}

void prettyCircle()
{
for(int i=0;i<400;i=i+10){
    float g=random(200,255);
    float b=random(200,255);
    float h=random(50,100);
      background(150,g,b);
    frameRate(20);
   for(int h=0;h<400;h=h+10){
       float j=random(400);
       if (j<400) {
      noFill();
      stroke(255,h);
    ellipse(200,200,j,j);
       frameRate(24);
    }
  }
}
}

void draw(){
prettyCircle()
  }
