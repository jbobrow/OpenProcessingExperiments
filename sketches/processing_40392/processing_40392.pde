
//Rayniel Estrella
//Math, Programming and Art
//Homework # 3 - Pattern using for loops, variables and conditionals.

int value = 0;

void setup(){
  size(800,800);
  smooth();
  background(255);
  colorMode(HSB,360,100,100,100);
}

void draw(){
  background(255);
  for(int x = 0; x < width; x+=10){
    for(int y = 0; y < height; y+=10){
     if(x%20 == 0 && y%20 == 0){
      fill(random(360),100,100,100);
       noStroke();
       rect(x,y,x+5,y+30,x+20,y+20);
     } else {
       fill(0);
       rect(x,y,30,30);
       //noLoop();
     }
    }
  }
}

//void mouseDragged() 
//{
//  value = 0;
//  if(X%20 == 0 && Y%20 == 0){
//      fill(random(255));
//  }
//}

//I wanted the colors to change at a faster pace and I sense that has to do with my "if" code within the void draw.
//For the void mouseDraggred I wanted the colors to turn random in a black, gray, and white pattern.

