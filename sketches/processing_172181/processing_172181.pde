
float counter = 0;

void setup ()
{
 smooth (); 
 size (400,400);
}
void draw ()
{
  colorMode (HSB,360,100,100);
  background (360,0,100);
  translate (width/2,height/2-30);
  float counter_mouse = map (mouseY,0,height,0.01,0.03);
  counter += counter_mouse;
  float amplitude = map (sin(counter), -1,1,0,100);
  float farbe = map (sin(counter),-1,1,100,0);
  
  background (0,0,farbe);
  fill (330,100,farbe);
  noStroke();
  triangle (0+amplitude,0,0+amplitude,120,80+amplitude,0);
  triangle (0-amplitude,0,0-amplitude,120,-80-amplitude,0);
  arc (-40-amplitude,0,80,80,PI,TWO_PI);
  arc (40+amplitude,0,80,80,PI,TWO_PI);
  
  translate (-width/4,-height/3);
  triangle (0+amplitude*0.5,0,0+amplitude*0.5,80,40+amplitude*0.5,0);
  triangle (0-amplitude*0.5,0,0-amplitude*0.5,80,-40-amplitude*0.5,0);
  arc (-20-amplitude*0.5,1,39,40,PI,TWO_PI);
  arc (20+amplitude*0.5,1,39,40,PI,TWO_PI);
  translate (width/2,0);
  triangle (0+amplitude*0.5,0,0+amplitude*0.5,80,40+amplitude*0.5,0);
  triangle (0-amplitude*0.5,0,0-amplitude*0.5,80,-40-amplitude*0.5,0);
  arc (-20-amplitude*0.5,1,39,40,PI,TWO_PI);
  arc (20+amplitude*0.5,1,39,40,PI,TWO_PI); 
}
