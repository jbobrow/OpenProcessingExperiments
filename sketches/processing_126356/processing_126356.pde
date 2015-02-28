
float tempstarx=0;
float tempstarc=0;
float tempstary=0;
int i =0;
ArrayList<Star> stars;
void setup(){
  size(500,500);
  background(0);
  stars = new ArrayList<Star>();
  thestargenerator();
  stars.add(new Star(tempstarx,tempstary,tempstarc));
}
void draw(){
  thestargenerator();
  stars.add(new Star(tempstarx,tempstary,tempstarc));
  for (i=0;i<stars.size()-1;i+=1){
    Star stars = stars.get(i);
    stars.startwinkle();
  }
}
void thestargenerator(){
  tempstarx = random(0,width);
  tempstary = random(0,height);
  tempstarc = random(0,255);
  
}

class Star {
  float starx=0;
  float stary=0;
  float starc=0;
  Star (float x, float y, float c){
    starx = x;
    stary = y;
    starc = c;
  }
  void startwinkle(){
    starc += 10;
    fill(starc);
  rect(starx,stary,2,2);
  }
  
}

