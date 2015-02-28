
void setup() {
size(600, 600);
  background(80,30,50);
  frameRate(8);
  noStroke();
  smooth();
}

void draw(){
  //fill(80,30,50,10);
  rect(0,0,width,height);
  for (float x=0; x<= width; x=x+random(20.40)) {
    for (float y=0;y<=height;y=y+random(20,40)) {
      fill(random(100,130),70,90,random(100,230));
     if (random(100)<40) {
       ellipse(x,y,random(20,60),random(20,60));
     } else {
      fill(0);
        ellipse(x,y,random(20,60),random(20,60));
     }
       
    }
  }
}


