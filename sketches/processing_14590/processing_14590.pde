
PImage face2;
void setup()  {
  size(400,225);
  face2=loadImage("face2.jpg");
  colorMode(HSB,360,100,100);
  noLoop();
    }

void draw(){
  background(255);
  for(int x=0; x<=width; x=x+5)  {
    for(int y=0; y<=height; y=y+5)  {
      color c = face2.get(x,y);
      fill(c,35);
      //엘릾(엓승왕일렌 렌덤\)
      noStroke();
      rect(x,y,random(60),random(50));
      rect(x,y,5,5);
      
      //fill(red(c),0,0);
      //rect(x+0,y,5,5);
      
     // fill(red(c),0,0);
     // rect(x,y,5,5);
      
      //fill(red(c),0,0);
    //  rect(x,y,5,5);
      
      //translate(x+x,y+y);
      //rotate(radians(frameCount+3));
      //image(face,-10,-10);
      //popMatrix();
    }
  }

}

