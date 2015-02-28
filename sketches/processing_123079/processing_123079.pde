
String[] year = { "preindustrial", "1950", "1970", "1990", "current"};  // Store the name of the years 
float [] co2 = {280,  311,  326,  354,  387};

 
void setup() 
{
  size(500, 500);
  smooth();
  textAlign(CENTER);
  fill (255);
}
 
void draw() 
{
  background(0);
  title();
  drawGraph();
}

void title()
{
  textSize(18);
  text("Atmospheric carbon dioxide concentration \n (*parts per million)", width/2, height*5/6);
}

void drawGraph()
{
  stroke(128);
  noFill();
  strokeWeight(1);
  
  for (int i = 0; i < year.length; i++) 
  {
    float x = map(i, 0, year.length - 1, width/7, width*6/7);
 
    line(x, 50, x, height*5/7);   
    line(width/7, height*5/7, width*6/7,height*5/7);
    pushMatrix();
    textSize(12);
    text( year[i],x, 20.0);
    popMatrix();
  }
 
  strokeWeight(3);
  stroke(255);
  
    beginShape();
  
    for (int j = 0; j < co2.length; j++) 
    {
      float x = map(j, 0, co2.length - 1, width/7, width*6/7);
      float valueHeight = height - co2[j];
      vertex(x, valueHeight);
    }
    endShape();
    stroke(255, 255,100);
    strokeWeight(1);
    line(width/7, height-350, width/7*6, height -350);
    
    mouseHover();

  }

 void mouseHover()
 {
   if(((mouseX>= width/7)) && (mouseX<= (width*6/7)) && (mouseY >= (height -365)) && (mouseY <= (height -335)))
   {
     textSize(20);
     fill(255, 255,100);
     text( "350 parts per million", width/2, height -380);
     textSize(12);
     text( "\n Likelihood of runaway greenhouse warming substantially increases \n and with it the possibility of catastrophic consequences", width/2, height -340);
     text( "\n \n \n such as melted icecaps", width/2, height -340);
     fill(255);
 }
 }


