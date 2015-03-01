
void setup() 

{

  size(600,600);

  frameRate(12);

}




void draw() 

{

  background(0);

  

  raining();

  window();

  

 }

 

void raining() {

  for (float x=0; x<width; x+=10) {

    float rainX = random(0,width);

    float rainLt = random(10,20);

    stroke(255);

    strokeWeight(3);

    line(rainX, x+rainLt, rainX, x-rainLt);

  }

}




void window() {

  stroke(216,98,7);

  strokeWeight(20);

  line(0,0,width,0);

  line(0,0,0,height);

  line(0,height,width,height);

  line(width,0,width,height);

  line(width/2,0,width/2,height);

  line(0,height/2,width,height/2);

}

  




void mouseClicked() {

background(242,235,17.200);

}
