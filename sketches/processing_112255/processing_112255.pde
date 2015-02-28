
float v = 0;

void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(#F4B17A);
  noStroke();
  v = mouseX;

float face = map(v, 30, 440, 30, 60);

  fill(255, 50);
  rect(face, face, 400, 400);


  //eyeleft
  float eye = map(v, 0, 500, 0, 90);
  fill(0);
  rect(width/3, 80, -eye, 200);

  //eyeright
  fill(0);
  rect(2*width/3, 80, eye, 200);

  //eyeWhite
  fill(255);
  rect(width/3, 100, -eye/3, 100);

  rect(2*width/3, 100, eye/3, 100);

//mouth
float mouth = map(v, 50, 500, 30,190);
  noStroke();
    //strokeWeight(3);
    fill(#AF3165);
 
ellipse(width/2, 400, mouth-50,mouth);



  //tearleft
  float tear = map(v, 0, 500, 0, 90);
  stroke(#37B2F7, 150);
  strokeWeight(tear);
  noFill();
  arc(width/3-10, 410, 330, 270, radians(tear+180), radians(270));
  arc(2*width/3-10, 410, 330, 270, radians(270), radians(tear+270));
  

  stroke(0);
 strokeWeight(3);
for(int i = 0; i< width; i = i +15)
  line(i,0,i+(v)-1000,v);

}




