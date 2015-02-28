
float var;
PFont font;

void setup()
{
  //width must be the same as height
  size (496,496);
  smooth();
  stroke(10);
  strokeWeight(2);
  fill(255);
  font = loadFont("Serif.plain-20.vlw"); 
  textFont(font, 20); 
  textAlign(CENTER);
  textMode(MODEL);
}

void draw(){  
  background(255);  
  var = lerp(0, 24, norm(mouseX,0,width))*-1;
  for (int i=0; i < width*2; i++)
      {
        if (i%12==0)
        {
          line(i,height,i+var,0);
          line(i*3+var,height,0,height-tan(radians(20))*i*3);
          line(i+var,height,0,height-tan(radians(70))*i);
          line(width-i*3,height,width,height-tan(radians(20))*i*3);
          line(width-i,height,width,height-tan(radians(70))*i);
          line(0,i,width,i+var);
        }
      }
  rect(0-10,height-60,width+10,height);
  fill(10);
  text("Double Trames, 1958", width/2, height-20);
  fill(255);
}

