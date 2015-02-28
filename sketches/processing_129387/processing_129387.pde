
int x = 0;
int y = 0;
int gradient = 0;
float bigness = 5;

void setup(){
  size(800,800);
}

void draw(){


   while (x<height){
     noStroke();
        while (y<width){
         fill(random(0,255),random(0,255),random(0,255));
         rect(y, x, bigness, bigness);
         y = y + 10;
      }
      
   y = 0;
   x = x + 10; 
  noStroke();
  
  fill(255);
  
  triangle(random(0,400), random(0,400),random(0,400),random(0,400), random(0,400), random(0,400));
  triangle(random(400,800), random(400,800),random(400,800),random(400,800), random(400,800),random(400,800));
  triangle(random(0,400), random(400,800),random(0,400),random(400,800), random(0,400),random(400,800));
  triangle(random(400,800), random(0,400),random(400,800),random(0,400), random(400,800),random(0,400));
  
  fill(225);
  
  rect(0,0,120,120);
  
  rect(240,240,120,120);

  rect(120,120,120,120);
  
  rect(440,240,120,120);
  

  rect(560,120,120,120);
  
  rect(680,0,120,120);

  ellipse(400,400,165,165);
  
  rect(240,440,120,120);
  
  rect(120,560,120,120);
  
  rect(0,680,120,120);
  
  rect(440,440,120,120);
  
  rect(560,560,120,120);
  
  rect(680,680,120,120);
  
  rect(120,340,120,120);

  rect(0,450,120,120);

  rect(0,230,120,120);

  rect(680,230,120,120);
  
  rect(560,340,120,120);

  rect(680,440,120,120);

  stroke(.25);
  
  //Original lines
  
  //line(0,400,800,400);
  //line(400,0,400,800);
  //line(0,0,800,800);
  //line(0,800,800,0);
  
  }
}


