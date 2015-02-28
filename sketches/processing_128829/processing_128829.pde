
//electricity : to produce a scene of thundering
//chang kuo Ping from industrial design
void setup(){
  size(500,500);
  //noLoop();
}

void draw(){
  background(0);
  fill(225,225,0);
  ellipse(250,20,100,70);
  
  

  strokeWeight(5);
  stroke(225,225,0);


  float xstep = 10;
  float ystep = 10;
  float lastx = 250;
  float lasty = 20;
  float x = 250;
  int border = 20;
  for (int y=border; y<=width-border;y+=ystep)
  {
        xstep = random(50)-25;
        x += xstep;
        strokeWeight(random(1,10));
        line(x, y, lastx, lasty);
        lastx = x;
        lasty = y;
  }


}




