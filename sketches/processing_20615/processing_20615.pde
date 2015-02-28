
/*
processing
ana villa
feb 8, 2011 */

void setup (){
  size(500,500);
  frameRate(10);
  background (255);
  smooth();
}

void draw (){
  

}

void mousePressed(){
for (int x=10; x<width+100; x+=10) {
  for(int y=10; y<height+100; y+=10){
    noStroke();
    fill (random(255), random(255), random(255), 50);
    ellipse (x,y,100,100);
  }
  
  }
}

void keyPressed(){
if (key=='s')
saveFrame();
}

                
                
