
/**
 * sketch:    SimpleEyeBall.pde
 * descr.:    Animated eyeball using GPU shader 
 * original:  http://glsl.herokuapp.com/e#3025.0
 *            created by Inigo Quilez - iq/08-07-2012
 * Processing port 12/2014 by Toni Holzer.
 */

// Tags:  GPU, shader, eye ball, animation, GLSL
 

PShader shader;

boolean animate = true;
String picName = "SimpleEyeBall.png";

void setup() 
{
  size(400, 400, P2D);
  frame.setResizable(true);
  noStroke();
  shader = loadShader("SimpleEyeBall.glsl");
}

void draw() 
{
  frame.setTitle(frameCount + " SimpleEyeBall  fps: " + nf(frameRate,0,1));     
    text ("press a to toggle animation, s to save picture", 10, 20);

  if (frameCount < 192)
  {
    background(255);    
    fill(0, min(255, 755-frameCount*4));
    text ("press a to toggle animation, s to save picture", 10, 20);
    fill(255);
  }
  else 

  {
    rect(0, 0, width, height);
//  background (introPicture);
    shader.set("resolution", float(width), float(height));  

    if (animate) 
      shader.set("time", (millis() / 1000.0));
    shader(shader);
  }
}

void keyPressed()
{
  if (key == 'a') animate = !animate;
  if (key == 's') save (picName);
  else animate = !animate;
}

