
float[ ] snowfall= {8,7, 10.6, 17.4, 20.1, 6.8, 1.2, 0, 0, 2.6, 9.4, 13.8, 9.8};
float[ ] avetemp= {2, 3, 4, 5 ,6, 7, 8, 9, 10, 11, 12};
PFont font;
PImage background;

float widthoffset;

void setup(){
size (600,400);
font=loadFont("Avenir-Roman-48.vlw");
textFont(font);
background=loadImage("background.jpg");
//map=loadImage("thermometer.png");
widthoffset=40;
}

void draw()
{
  drawBackground();
  drawSnownumbers();
  
}

void drawBackground()
{
  background(133,209,227);
  image(background, 0, 0);

}

void drawSnownumbers()
{
  fill(0);
  
  text("Average Snowfall:",.1*width, .5*height);
  for(int i=0; i<avetemp.length;i=i+1)
  {
    if(mouseX<((i+1)*width/avetemp.length+widthoffset) && mouseX>(i*height/avetemp.length-widthoffset))
    {text("Average Snowfall:",.1*width, .5*height);
      textAlign(LEFT);
     image(background, 0, 0);
      text(snowfall[i] +"inches of snow", .2*width, .6*height);
     
    }
    
  }
}




