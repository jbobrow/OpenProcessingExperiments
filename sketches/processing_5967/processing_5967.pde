

{
  size(600, 600);
  background(222);
for(int ypos = 0; ypos < width; ypos = ypos + 10){
    noStroke();
  for(int xpos = 0; xpos < width; xpos = xpos + 10){
    noStroke();
  
    //draw a background
    fill(random(200,255),random(200,225),random(200,255));
    ellipse(xpos,ypos,xpos/15, ypos/15);


}
}}

for(int ypos = 50; ypos < width; ypos = ypos + 50){
  noStroke();
  for(int xpos = 50; xpos < width; xpos = xpos + 50)


  while(xpos<width){
    noStroke();

    //draw white ellipses
    fill(240, random(80,150));
    ellipse(xpos,ypos, random(30,50), random(30,50));



    //change the x position
    xpos = xpos + 50;
    
  }
}

