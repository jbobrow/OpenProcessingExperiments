
/*
*  Curvy by Christophe Guebert
 *  First example of my new particle engine.
 *  Particles are emitted at the mouse position,
 *   a force is applied to bend the particle's trajectory, 
 *   which is drawn as a ribbon.
 *   'g' to show or hide the GUI, spacebar to pause.
 */
 
// Yep, the gui now has its own library !
import miny.types.*;
import miny.gui.*;

MinyGUI gui;
boolean showGui = false, inside = false;
int lastX, lastY;
MinyColor backgroundColor;

ParticleEngine engineCurvy, engineShiny;
EffectorSpiral spiral;
EffectorRibbon ribbon;
EffectorNoiseSimple noise;

void setup()
{
  size(600, 500);
  smooth();

// First particle engine
  engineCurvy = new ParticleEngine();
  engineCurvy.creationRate.setValue(5.0);
  engineCurvy.lifeMin.setValue(5.0);
  engineCurvy.lifeMax.setValue(10.0);
  engineCurvy.angleMin.setValue(-45.0);
  engineCurvy.angleMax.setValue(45.0);
  engineCurvy.speedMin.setValue(5.0);
  engineCurvy.speedMax.setValue(25.0);
  engineCurvy.distanceMax.setValue(0.0);
  engineCurvy.friction.setValue(0.15);
  engineCurvy.spawnMode.setValue(1);
  engineCurvy.renderMode.setValue(3);
  engineCurvy.emitterSpeedInfluence.setValue(1.0);
  engineCurvy.colorAnimation.add(0.8, color(255));
  engineCurvy.colorAnimation.add(1.0, color(255, 0));
  engineCurvy.addEmitter(new ParticleEmitter(width/2, height/2));
  engineCurvy.addEmitter(new ParticleEmitter(width/2, height/2));
  
  // Effector that curves the particle trajectory
  spiral = new EffectorSpiral();
  spiral.coef.setValue(0.8);
  engineCurvy.addEffector(spiral);

  // Changing the drawing style
  ribbon = new EffectorRibbon();
  ribbon.ribbonWidth.setValue(3.0);
  ribbon.ribbonColor.setValue(color(255));
  engineCurvy.addEffector(ribbon);
  
// Second particle engine
  engineShiny = new ParticleEngine();
  engineShiny.creationRate.setValue(50.0);
  engineShiny.lifeMin.setValue(5.0);
  engineShiny.lifeMax.setValue(10.0);
  engineShiny.distanceMax.setValue(0.0);
  engineShiny.speedMin.setValue(0.0);
  engineShiny.speedMax.setValue(0.0);
  engineShiny.emitterSpeedInfluence.setValue(0.0);
  engineShiny.sizeMin.setValue(5.0);
  engineShiny.sizeMax.setValue(10.0);
  engineShiny.sizeAnimation.add(0.0, 0.5);
  engineShiny.sizeAnimation.add(0.8, 1.0);
  engineShiny.sizeAnimation.add(1.0, 0.2);
  engineShiny.renderMode.setValue(2);
  engineShiny.colorAnimation.add(0.8, color(255));
  engineShiny.colorAnimation.add(1.0, color(255, 0));
  engineShiny.particleImage = loadImage("cross.png");
  engineShiny.addEmitter(new ParticleEmitter(width/2, height/2));
  engineShiny.addEmitter(new ParticleEmitter(width/2, height/2));
  
  // Just a little bit of random acceleration
  noise = new EffectorNoiseSimple();
  noise.amount.setValue(2.0);
  engineShiny.addEffector(noise);

// Creating a gui so we can play with the parameters !
  gui = new MinyGUI(this, 0, 0, width/3, height);
  gui.bg = color(255); gui.fg = color(0);
  gui.selectColor = color(128, 255, 128);
  gui.hide();

  gui.addCheckBox("Pause", engineCurvy.pause);

  backgroundColor = new MinyColor(color(0));
  gui.addColorChooser("Back. color", backgroundColor);

  gui.addEditBox("1.Create rate", engineCurvy.creationRate);
  gui.addEditBox("1.Angle min", engineCurvy.angleMin);
  gui.addEditBox("1.Angle max", engineCurvy.angleMax);
  gui.addEditBox("1.Life min", engineCurvy.lifeMin);
  gui.addEditBox("1.Life max", engineCurvy.lifeMax);
  gui.addEditBox("1.Speed min", engineCurvy.speedMin);
  gui.addEditBox("1.Speed max", engineCurvy.speedMax);
  gui.addEditBox("1.Speed infl.", engineCurvy.emitterSpeedInfluence);
  gui.addEditBox("1.Friction", engineCurvy.friction);
  gui.addGradient("1.Color", engineCurvy.colorAnimation);

  gui.addEditBox("Spiral coef.", spiral.coef);

  gui.addEditBox("Ribbon width", ribbon.ribbonWidth);
  gui.addGraph("Ribbon width", ribbon.finalWidth);
  gui.addColorChooser("Ribbon color", ribbon.ribbonColor);
  gui.addCheckBox("Mult. colors", ribbon.multiplyColor);
  
  gui.addEditBox("2.Create rate", engineShiny.creationRate);
  gui.addEditBox("2.Size min", engineShiny.sizeMin);
  gui.addEditBox("2.Size max", engineShiny.sizeMax);
  gui.addGradient("2.Color", engineShiny.colorAnimation);
  gui.addGraph("2.Size anim", engineShiny.sizeAnimation);
  gui.addEditBox("Noise amount", noise.amount);
  
}

void draw()
{
  background(backgroundColor.getValue());

  // Not jumping huge distances when mouse leaves screen
  if(!inside) { lastX = mouseX; lastY = mouseY; }
  if(Rect.overRect(this, 0, 0, width, height)) inside = true; 
  else inside = false;

  // Updating particles engine emitters
  int sX = constrain(mouseX-lastX, -25, 25), sY = constrain(mouseY-lastY, -25, 25);
  ParticleEmitter pe0 = new ParticleEmitter(lastX, lastY, sX, sY);
  ParticleEmitter pe1 = new ParticleEmitter(mouseX, mouseY, sX, sY);
  engineCurvy.setEmitter(0, pe0); engineCurvy.setEmitter(1, pe1); 
  engineShiny.setEmitter(0, pe0); engineShiny.setEmitter(1, pe1);
  
  // Copying some values from one engine to the other
  engineShiny.pause.setValue(engineCurvy.pause.getValue());
  engineShiny.lifeMin.setValue(engineCurvy.lifeMin.getValue());
  engineShiny.lifeMax.setValue(engineCurvy.lifeMax.getValue());
  
  // Updating particles position and drawing them
  engineCurvy.update(); engineShiny.update();

  lastX = mouseX; lastY = mouseY;
}

void keyPressed()   
{ 
  // If not currently editing a property
  if(!gui.isLocked())
  {
    // Showing or hiding the gui
    if(key == 'g' || key == 'G')
    {
      showGui = !showGui;
      if(showGui) gui.show();
      else gui.hide();
    }
    // Pausing
    else if(key == ' ')
      engineCurvy.pause.setValue(!engineCurvy.pause.getValue());
  }
}

