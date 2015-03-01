
float counter = 0;

void setup ()
{
  size (400,400);
}
void draw ()
{
smooth();
  colorMode (HSB,360,100,100);
  background (360,0,100);
  translate (width/2,height/2-30);
  float counter_mouse = map (mouseY,0,height,0.01,0.03);
  counter += counter_mouse;
  float amplitude = map (sin(counter), -1,1,0,100);
  float farbe = map (sin(counter),-1,1,100,0);
  
  //background (0,0,farbe);
  fill (330,100,farbe);
  noStroke();
  triangle (0+amplitude,0,0+amplitude,120,80+amplitude,0);
  triangle (0-amplitude,0,0-amplitude,120,-80-amplitude,0);
  arc (-40-amplitude,0,80,80,PI,TWO_PI);
  arc (40+amplitude,0,80,80,PI,TWO_PI);
  
  fill (amplitude*300);
  ellipse (-20,-50,5,5);
  ellipse (20,-50,5,5);
  fill (amplitude*200);
  ellipse (-30,-70,10,10);
  ellipse (30,-70,10,10);
  fill (amplitude*300);
  ellipse (40,-90,15,15);
  ellipse (-40,-90,15,15);
  
 
  fill (amplitude*400);
  
  ellipse (40,-110,5,5);
  ellipse (40,-70,5,5);
  ellipse (60,-90,5,5);
  ellipse (20,-90,5,5);
  ellipse (-20,-90,5,5);
  ellipse (-60,-90,5,5);
  ellipse (-40,-110,5,5);
  ellipse (-40,-70,5,5);
  
  
  fill (amplitude*500);
  ellipse (40,-120,5,5);
  ellipse (40,-60,5,5);
  ellipse (70,-90,5,5);
  ellipse (10,-90,5,5);
  ellipse (-10,-90,5,5);
  ellipse (-70,-90,5,5);
  ellipse (-40,-120,5,5);
  ellipse (-40,-60,5,5);
 
  fill (amplitude*600);
  ellipse (40,-130,5,5); 
  ellipse (40,-50,5,5);
  ellipse (80,-90,5,5);
  ellipse (0,-90,5,5);
  ellipse (-80,-90,5,5);
  ellipse (-40,-130,5,5);
  ellipse (-40,-50,5,5);
  

}
