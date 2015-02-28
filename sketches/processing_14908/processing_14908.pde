
//PROJECT IV_NARRATE

//by Stephen Ou
//UCLA DESMA Interactivity 2010
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioSample [] sounds =  new AudioSample [4];

PImage environment, owl_asleep, owl_awake, grasshopper, block, skull, polite;
PImage wine, flee, frustrate, speaker, stopsign, bulb, survival;
int card = 0;
int chirpcounter = 0;
float x;
float y;
float targetX, targetY;
float easing = 0.08;
float fly = 0.0;
PFont hel;
PFont hels;
boolean prevention = true;

void setup()
{
  hel = loadFont("Helvetica-24.vlw");
  hels = loadFont("Helvetica-11.vlw");
  size(640, 480, P2D);
  smooth();
  textAlign(CENTER);

  environment = loadImage("environment.png");
  owl_asleep = loadImage("element_owl.png");
  owl_awake = loadImage("element_owl_awake.png");
  grasshopper = loadImage("grasshopper.png");
  block = loadImage("environment_tree_block.png");
  skull = loadImage("skull.png");
  wine = loadImage("wine.png");
  frustrate = loadImage("frustrate.png");
  flee = loadImage("exit.png");
  speaker = loadImage("speaker.png");
  stopsign = loadImage("stop.png");
  polite = loadImage("polite.png");
  bulb = loadImage("bulb.png");
  survival = loadImage("survival.png");

  minim = new Minim(this);

  sounds [0]  = minim.loadSample("chirp02.mp3");
  sounds [1] = minim.loadSample("Eating.mp3");
  sounds [2] = minim.loadSample("Bite.mp3");
  sounds [3] = minim.loadSample("horned_owl_regular.mp3");
  

}

void draw() 
{
  println (chirpcounter);
  background(67, 108, 179);
  
  if (card == 0) 
  {
    //INTRO_OWL_ASLEEP
    background(67, 108, 179);

    image(environment, 0, 0);
    image(owl_awake, 0, 0);
    image(block, 0,0);

    //EYELIDS
    noStroke();
    fill(#363D54);
    
    float r = 0;
    r = constrain (r, 0, chirpcounter*0.15);
    
    if(mousePressed == false)
    {
      r += 2;
    }
    
    ellipse(145.48,97.25-chirpcounter*0.3, 10.6, 10.4-chirpcounter*0.3+r);
    ellipse(177.27,105.23-chirpcounter*0.3, 9, 10.4-chirpcounter*0.3+r);
    
    //GRASS_TRIGGERED_CHIRPING
    if (mousePressed) 
    {
      float d = dist(mouseX, mouseY, 525, 480);
      if (d < 100 && prevention == true) 
      {
        prevention = false;
        sounds[0].trigger();
        chirpcounter++;
      }
    }
    
    //THRESHOLD_REACHED_FOR_WAKING_UP
    if (chirpcounter >= 20) 
    {card = 1;}
    
    //DOT_CURSOR
    noCursor();
    fill(255);
    ellipse(mouseX, mouseY, 4,4);
    
    float d = dist(mouseX, mouseY, 525, 480);
    if (d < 100)
    {
      fill(255,0,13);
      ellipse(mouseX, mouseY, 5,5);
    }
  }
  else if (card == 1) 
  {
    background(67,108,179);

    image(environment, 0, 0);
    image(owl_awake, 0, 0);
    image(block, 0,0);
    
    //HOVERING_GRASSHOPPER
    targetX = mouseX;
    float dx = targetX - x;
    if(abs(dx) > 1) 
    {x += dx * easing;}

    targetY = mouseY;
    float dy = targetY - y;
    if(abs(dy) > 1) 
    {y += dy * easing;}
    
    image(grasshopper, x, y);
    
    //FRUSTRATION_ICON
    if(chirpcounter >= 26)
    {
      image(frustrate, 140,18, 50,50);
      fill(#363D54);
      quad(138.67,90.5, 152.08,90.5, 152.08,98.25, 138.67,93.25);
      quad(171.5,99.47, 183,99.47, 183,102.33, 171.5,104.33);
    }
    
    //TRIGGER_ANGRY_OWL
    if(chirpcounter >= 32)
    {card = 3;}
   
    //DEATH_TRIGGER [AREA]
    if(mouseX < 193 && mouseX > 72 && mouseY < 231 && mouseY >56) 
    {
      int index = int(random(1,2));
      sounds[1].trigger();
      sounds[2].trigger();

      card = 2 ;
    }
    
    //CHIRP_COUNTER
    if (mousePressed && prevention == true) 
    {
      prevention = false;
      sounds[0].trigger();
      chirpcounter++;
    }
    
    //DOT_CURSOR
    noCursor();
    fill(255);
    ellipse(mouseX, mouseY, 4,4);
  }
  else if(card == 2) 
  {
    //CONSUMED_END
    background(#D12828);
    fill(0);
    noStroke();
    imageMode(CENTER);
    
    image(skull, width/2,height/2-10);
    fill(255);
    textFont(hel);
    text("consumed END", width/2, height/2+100);
    textFont(hels);
    text("spacebar to restart", width/2, height/2+125);
    
    //REPLAY
    if (keyPressed == true && key == ' ')
    {
      card = 0;
      chirpcounter = 0;
      imageMode(CORNER);
    }
    
    //DOT_CURSOR
    noCursor();
    fill(255);
    ellipse(mouseX, mouseY, 4,4);
  }
  else if(card == 3)
  {
    //ANGRY_OWL
    background(67, 108, 179);

    image(environment, 0, 0);
    image(owl_awake, 0, 0);
    image(block, 0,0);
    image(speaker, 128,239, 30,30);
    image(speaker, 510,306, 30,30);
    image(stopsign, 128,239, 30,30);

    //HOVERING_GRASSHOPPER
    targetX = mouseX;
    float dx = targetX - x;
    if(abs(dx) > 1) 
    {x += dx * easing;}

    targetY = mouseY;
    float dy = targetY - y;
    if(abs(dy) > 1) 
    {y += dy * easing;}
    
    image(grasshopper, x, y);
    
    //initial_EYELIDS
    float h = 0;
    if(mousePressed == false)
    {
      fill(#363D54);
      quad(138.67,90.5, 152.08,90.5, 152.08,98.25-h, 138.67,93.25);
      quad(171.5,99.47, 183,99.47, 183,102.33, 171.5,104.33-h);
      
      h = h + 1;
      
      if(h >= 5)
      {h = 5;}
    }
    
    //ANGRIER
    if(mousePressed == true)
    {
      fill(#363D54);
      quad(138.67,90.5, 152.08,90.5, 152.08,98.25+5, 138.67,93.25);
      quad(171.5,99.47, 183,99.47, 183,102.33, 171.5,104.33+5);
      
      if (chirpcounter >= 7 && card == 3 && prevention == true)
      {
        prevention = false;
        sounds[3].trigger();
        chirpcounter = 0;
      }
    }
    
    //DEATH_TRIGGER
    if(mouseX < 173 && mouseX > 92 && mouseY < 211 && mouseY >76) 
    {
      int index = int(random(1,2));
      sounds[1].trigger();
      sounds[2].trigger();

      card = 2;
    }

    //TRIGGERED_CHIRPING
    if (mousePressed && prevention == true) 
    {
        prevention = false;
        sounds[0].trigger();
        chirpcounter++;
    }
    
    if((mousePressed) && (mouseX < 158) && (mouseX > 128) && (mouseY < 269) && (mouseY >239))
    {
      card = 4;
    }
    
    if((mousePressed) && (mouseX < 540) && (mouseX > 510) && (mouseY < 336) && (mouseY >306))
    {
      card = 5;
      chirpcounter = 0;
    }
    
    //DOT_CURSOR
    noCursor();
    fill(255);
    ellipse(mouseX, mouseY, 4,4);
    if((mouseX < 158) && (mouseX > 128) && (mouseY < 269) && (mouseY >239))
    {
      fill(255,0,13);
      ellipse(mouseX, mouseY, 5,5);
    }
    if((mouseX < 540) && (mouseX > 510) && (mouseY < 336) && (mouseY >306))
    {
      fill(255,0,13);
      ellipse(mouseX, mouseY, 5,5);
    }
    
    
  }
  else if (card == 4)
  {
    //POLITE_END
    background(67,108,179);

    image(polite, 0, 0);
    
    textFont(hels);
    fill(0);
    text("spacebar to restart", width/2+5, height/2+145);
    
    //REPLAY
    if (keyPressed == true && key == ' ')
    {
      card = 0;
      chirpcounter = 0;
      imageMode(CORNER);
    }
    
    //DOT_CURSOR
    noCursor();
    fill(255);
    ellipse(mouseX, mouseY, 4,4);
  }
  else if (card == 5)
  {
    //LIGHT_BULB
    background(67, 108, 179);

    image(environment, 0, 0);
    image(owl_awake, 0, 0);
    image(block, 0,0);
    
    //BULB_TRIGGER
    image(bulb, 140,20,45,45);
    if((mousePressed) && (mouseX < 195) && (mouseX > 140) && (mouseY < 65) && (mouseY >20))
    {card = 6;}
    
    //HOVERING_GRASSHOPPER
    targetX = mouseX;
    float dx = targetX - x;
    if(abs(dx) > 1) 
    {x += dx * easing;}

    targetY = mouseY;
    float dy = targetY - y;
    if(abs(dy) > 1) 
    {y += dy * easing;}
    
    image(grasshopper, x, y);
    
    //DEATH_TRIGGER
    if(mouseX < 173 && mouseX > 92 && mouseY < 211 && mouseY >76) 
    {
      int index = int(random(1,2));
      sounds[1].trigger();
      sounds[2].trigger();

      card = 2;
    }

    //TRIGGERED_CHIRPING
    if (mousePressed && prevention == true) 
    {
        prevention = false;
        sounds[0].trigger();
        chirpcounter++;
    }
    
    //DOT_CURSOR
    noCursor();
    fill(255);
    ellipse(mouseX, mouseY, 4,4);
    if((mouseX < 195) && (mouseX > 140) && (mouseY < 65) && (mouseY >20))
    {
      fill(255,0,13);
      ellipse(mouseX, mouseY, 5,5);
    }
  }
  else if (card == 6)
  {
    //WINE_OFFERED
    background(67, 108, 179);

    image(environment, 0, 0);
    image(owl_awake, 0, 0);
    image(block, 0,0);
    
    //SLY_OWL
    fill(#363D54);
    ellipse(145.48,97.25+3, 10.6, 10.4);
    ellipse(177.27,105.23+3, 9, 10.4);
    
    //WINE_DEATH
    image(wine, 205,135,50,50);             
    if((mousePressed) && (mouseX < 255) && (mouseX > 205) && (mouseY< 185) && (mouseY >135))
    {card = 7;}
    
    //FLEE
    image(flee, 600,440,30,30);
    if((mousePressed) && (mouseX < 630) && (mouseX > 600) && (mouseY< 470) && (mouseY >440))
    {card = 8;}
    
    //HOVERING_GRASSHOPPER
    targetX = mouseX;
    float dx = targetX - x;
    if(abs(dx) > 1) 
    {x += dx * easing;}

    targetY = mouseY;
    float dy = targetY - y;
    if(abs(dy) > 1) 
    {y += dy * easing;}
    
    image(grasshopper, x, y);
    
    //DEATH_TRIGGER
    if(mouseX < 173 && mouseX > 92 && mouseY < 211 && mouseY >76) 
    {
      int index = int(random(1,2));
      sounds[1].trigger();
      sounds[2].trigger();

      card = 2;
    }

    //TRIGGERED_CHIRPING
    if (mousePressed && prevention == true) 
    {
        prevention = false;
        sounds[0].trigger();
        chirpcounter++;
    }
    
    //DOT_CURSOR
    noCursor();
    fill(255);
    ellipse(mouseX, mouseY, 4,4);
    if((mouseX < 255) && (mouseX > 205) && (mouseY< 185) && (mouseY >135))
    {
      fill(255,0,13);
      ellipse(mouseX, mouseY, 5,5);
    }
    if((mouseX < 630) && (mouseX > 600) && (mouseY< 470) && (mouseY >440))
    {
      fill(255,0,13);
      ellipse(mouseX, mouseY, 5,5);
    }
    
  }
  else if (card == 7)
  {
    //POISONED_AND_CONSUMED_END
    background(#9C3CBF);
    fill(0);
    noStroke();
    imageMode(CENTER);
    
    image(skull, width/2,height/2-10);
    fill(255);
    textFont(hel);
    text("poisoned END", width/2, height/2+100);
    textFont(hels);
    text("spacebar to restart", width/2, height/2+125);
    
    //REPLAY
    if (keyPressed == true && key == ' ')
    {
      card = 0;
      chirpcounter = 0;
      imageMode(CORNER);
    }
    
    //DOT_CURSOR
    noCursor();
    fill(255);
    ellipse(mouseX, mouseY, 4,4);
  }
  else if (card == 8)
  {
    //SURVIVE
    background(0);
    
    image(survival, 0,0);
    
    //GRASS_TRIGGERED_CHIRPING
    if (mousePressed && prevention == true) 
    {
      float d = dist(mouseX, mouseY, 550, 435);
      if (d < 70) 
      {
        prevention = false;
        sounds[0].trigger();
        chirpcounter++;
      }
    }
    
    //REPLAY
    if (keyPressed == true && key == ' ')
    {
      card = 0;
      chirpcounter = 0;
      imageMode(CORNER);
    }
    
     //DOT_CURSOR
    noCursor();
    fill(255);
    ellipse(mouseX, mouseY, 4,4);
  }
  
}

void mouseReleased()
{
  prevention = true;
}
 
void stop()
{
  minim.stop();
  super.stop();
}


