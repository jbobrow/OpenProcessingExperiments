
void setup(){
  size(600,600);
  smooth();
  background(189,0,193);
}

void draw(){
  for(int x = 10; x < width; x+=60){
    for(int y = 10; y < height; y+=60){
      noFill();
                  //middle
   stroke(random(0,50),random(100,255),random(100,180), 80);
   ellipse(random(250,350),random(250,350),x,y);
                 //left
   stroke(random(0,50),random(0,55),random(100,255), 30);
   ellipse(random(0,200),random(250,350),x,y);
                    //right
   stroke(random(100,255),random(100,175),random(0,80), 30);
   ellipse(random(400,600),random(250,350),x,y);
      stroke(255);
   line(y,x,x++,y++);
     stroke(0);
   line(x,y,y,x);
  }
  

  }
}

