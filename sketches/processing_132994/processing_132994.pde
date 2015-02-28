

int n = 1;

void setup(){
  size(800,600);
  stroke(255);
  frameRate(5);
  float n = 1;
}

void draw(){
  background(0);


  for(int x = 1; x < width; x=x+10){
    for(int y = 1; y < height; y=y+10){

      float delta = noise(float(x+n)/100);
      delta = map(delta,0,1,0,255);

      stroke((delta*x)%255,0,80);
      //ellipse(x+(mouseX/100), y+(mouseY+100), 30, 30);
      line(x,y,x+40,y+40);
    }
  }
  n++;
}

