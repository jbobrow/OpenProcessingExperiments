
/* Inspired by "Awesome digital bokeh effect in Photoshop" by Abduzeedo. 
   http://abduzeedo.com/awesome-digital-bokeh-effect-photoshop
   
   Particles based on a modified version of the SimpleParicleSystem by Daniel Shiffman (included in standard Processing examples). 
   
   Examples used from GlGraphics library:
   GLBlendModes, DynamicMask, BasicUse
   
   Runs in Processing 1.5.1.
   
   The background is a simple gradient on blended black of 512 by 512 pixels
   Three textures are used, all made in Photoshop. Of course I could have created them in Processing as well, but with blur 
   this was faster. 
   bokeh128: small eclipse with 1px gaussian blur, 128x128px
   bokeh256: medium eclipse with 4px gaussian blur, 256x256px
   bokeh512: big eclipse with 20px gaussian blur, 512x512px  
  
   See the tutorial for the steps. 
   
   Example made to show the power of compositing in Processing. 
*/

import processing.opengl.*;
import codeanticode.glgraphics.*;

GLTextureFilter dodgeFilter;
GLTexture bokeh512, bokeh256, bokeh128; // bokeh particle textures
GLTexture layer1Tex, layer2Tex, layer3Tex, layer4Tex, screenTex; // layer textures

GLGraphicsOffScreen offscreen1; // offscreen buffer layer2
GLGraphicsOffScreen offscreen2; // offscreen buffer layer3
GLGraphicsOffScreen offscreen3; // offscreen buffer layer4

ParticleSystem ps1; // small particles on offscreen1 texture
ParticleSystem ps2; // medium particles on offscreen2 texture
ParticleSystem ps3; // big  particles on offscreen3 texture

//PImage bg;

void setup() {
  size(1280, 720, GLConstants.GLGRAPHICS);
  frameRate(30);
  offscreen1 = new GLGraphicsOffScreen(this, 1280, 720); //, true, 4); // full resolution
  offscreen2 = new GLGraphicsOffScreen(this, 640, 360); //, true, 4);  // half resolution is blurry
  offscreen3 = new GLGraphicsOffScreen(this, 640, 360); //, true, 4);  // half resolution is blurry
  
  screenTex = new GLTexture(this, width, height); // texture of screensize to display 
  
  // used images
  layer1Tex = new GLTexture(this,"gradientbackground.jpg"); // gradient background in layer 1
  
  bokeh128 = new GLTexture(this,"bokeh-128.png"); 
  bokeh256 = new GLTexture(this,"bokeh-256.png");
  bokeh512 = new GLTexture(this,"bokeh-512.png");
  
  // color dodge blendingmode filter
  dodgeFilter = new GLTextureFilter(this, "BlendColorDodge.xml");
  
  // particle system start empty 
  ps1 = new ParticleSystem(); // small particles
  ps2 = new ParticleSystem(); // medium particles
  ps3 = new ParticleSystem(); // big particles
}

void draw() {
  
  // animate
  // start positions of the particles
  float randomX = (width/4)+random(width-(width/2));
  float randomY = random(height);
  
  // use frameCount and modulo (%) to add particles every 20, every 5 and every 3 frames  
  // addParticle parameters: x position, y position, size, velocity, texture
  if(frameCount%20==0) ps3.addParticle(random(width/40)*40,randomY, random(200, 300), 0.02, bokeh512);
  if(frameCount%5==0) ps2.addParticle(random(width/20)*20,randomY, random(60, 100), 0.1, bokeh256);
  if(frameCount%3==0)  ps1.addParticle(randomX,randomY, random(60,100), 0.2, bokeh128);
  
  // draw particlesystems on offscreens
  drawOffscreen(ps1,offscreen1);
  drawOffscreen(ps2,offscreen2);
  drawOffscreen(ps3,offscreen3);
  
  // save GLGraphicsOffScreen to textures
  layer2Tex = offscreen1.getTexture();
  layer3Tex = offscreen2.getTexture(); 
  layer4Tex = offscreen3.getTexture(); 
  
  // blend layers with color dodge mode
  dodgeFilter.apply(new GLTexture[]{layer1Tex, layer4Tex}, screenTex); // layer4 with gradient output screenTex
  dodgeFilter.apply(new GLTexture[]{screenTex, layer3Tex}, screenTex); // layer3 with screenTex output screenTex
  dodgeFilter.apply(new GLTexture[]{screenTex, layer2Tex}, screenTex); // layer2 with screenTex output screenTex
  
  // display the screenTexture
  image(screenTex, 0, 0);  
}

// function to begin drawing particles
void drawOffscreen(ParticleSystem p, GLGraphicsOffScreen o)
{ o.beginDraw();
  o.clear(0, 0);
  o.background(0);
  p.run(o);
  o.endDraw();
}



