
float x=0;
float y=0;

void setup()
{size(1000,750);
frameRate(10);
//background(20,0,0);
//use this one to make the circles add on top of each other
}

void draw()
{
  background(20,0,0);
  for(x=0;x<displayWidth; x+=random(0,200)){
    for(y=0; y<displayHeight/2; y+=random(0, 200)){
     stroke(12);
     fill(25, 100,0);
     //ellipse(x,y, 12,12);
    
     text("Hahahahaha", x, y);
    //instead of ellipse you can do text words in different locations
    }
  }
}
