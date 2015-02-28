
/** (c) subpixel 2009 - http://subpixels.com
 *
 * class Channel
 * 2009-01-20 Created by subpixel
 *
 * Control Channel class
 * The idea is that these can be tiered, eg with a  master
 * channel and individual channels having a combined effect on
 * a single object.
 */

float   minTumbleAdjustment = 0.125;
float   maxTumbleAdjustment = 4;

class Channel
{
  Scene scene;                          // The scene this channel belongs to
  String  id;                           // ident

  EffectParameters[] effectParams;      // Array of channel effects
  boolean[]          effectActive;      // Computed effective values for each effect

  boolean display             = true;   // Display?
  boolean doUpdate            = true;   // Update?

  boolean automate            = false;  // Automate? (Random channel changes?)
  int     autoBeats           = 4;      // Number of beats per automation
  int     autoBeatOffset      = 0;      // Beat offset for automation (0 = on main beat, 1 = next beat, etc)

  boolean travel              = true;   // Travel? (Move?)
  boolean velocityAdjust      = true;   // Use the velocity adjustment?
  float   velocityAdjustment  = 1.0;    // Factor to adjust the velocity by
  float   velocityAdjustmentStep = 0.1; // Number added to or subtractef from velocityAdjustment

  boolean tumble              = true;   // Tumble?
  boolean tumbleAdjust        = true;   // Use the tumble adjustment?
  float   tumbleAdjustment    = 1.0;    // Factor to adjust the tumble rate by
  float   tumbleAdjustmentStep = 0.05;  // Number added to or subtracted from tumbleAdjustment

  boolean forceRegular        = false;   // Force regular shape/size?

  boolean scaleAdjust         = false;   // Use the scale adjustment?
  float   scaleAdjustAmount   = 1.0;     // Factor to adjust the scale by

  // --------------------------------------------------------------------------
  // Constructor
  // --------------------------------------------------------------------------

  Channel(Scene scene, String id)
  {
    this.scene = scene;
    this.id = id;
    
    effectParams = new EffectParameters[maxEffects];
    effectActive = new boolean[maxEffects];
    for (int i = 0; i < maxEffects; i++)
    {
      effectParams[i] = new EffectParameters(this);
    }
  }

  // --------------------------------------------------------------------------
  // Update effect parameters, etc
  // --------------------------------------------------------------------------
  void update()
  {
    for (int i = 0; i < scene.numEffects; i++)
    {
      effectParams[i].update();
      
      if (this == scene.master)  // Master channel
        effectActive[i] = effectParams[i].active;
      else
        effectActive[i] = effectParams[i].active ^ scene.master.effectParams[i].active;
    }
    
    if (automate)
    {
      //TODO: automation needs timing stuff!
    }
  }

  // --------------------------------------------------------------------------

  void toggleDisplay()           { display = !display; }
  void displayOn()               { display = true; }
  void displayOff()              { display = false; }
  
  void toggleDoUpdate()          { doUpdate = !doUpdate; }
  
  // --------------------------------------------------------------------------

  void toggleTravel()            { travel = !travel; }
  void toggleVelocityAdjust()    { velocityAdjust = !velocityAdjust; }
  void velocityAdjustOn()        { velocityAdjust = true; }
  void velocityAdjustOff()       { velocityAdjust = false; }
  void velocityReverse()         { velocityAdjustment *= -1.0;
                                   velocityAdjust = true; }
  void velocityHalve()
  {
    if (velocityAdjust)
      velocityAdjustment *= 0.5;

    velocityAdjust = true;  // always want to be moving now
  }
  void velocityDouble()
  {
    if (!velocityAdjust)
      velocityAdjust = true;  // since moving is faster than not moving
    else
      velocityAdjustment *= 2.0;
  }
  void velocityDecrease()        { velocityAdjustment -= velocityAdjustmentStep;
                                   velocityAdjust = true; }
  void velocityIncrease()        { velocityAdjustment += velocityAdjustmentStep;
                                   velocityAdjust = true; }
  void velocityAdjustmentReset() { velocityAdjustment = 1.0; }

  // --------------------------------------------------------------------------

  void toggleTumble()            { tumble = !tumble; }
  void toggleTumbleAdjust()      { tumbleAdjust = !tumbleAdjust; }
  void tumbleReverse()           { tumbleAdjustment *= -1.0; }
  void tumbleHalve()             { tumbleAdjustment *= 0.5; }
  void tumbleDouble()            { tumbleAdjustment *= 2.0; }
  void tumbleDecrease()          { tumbleAdjustment -= tumbleAdjustmentStep; }
  void tumbleIncrease()          { tumbleAdjustment += tumbleAdjustmentStep; }
  void tumbleAdjustmentReset()   { tumbleAdjustment = 1.0; }

  // --------------------------------------------------------------------------

  void toggleForceRegular()      { forceRegular = !forceRegular; }

  // --------------------------------------------------------------------------
  // Initiate a "random" action on the channel.
  // This isn't entirely random, since there are things we might want,
  // preferentially, to change before considering anything else, such
  // as re-enabling updates or the display of that channel.
  // --------------------------------------------------------------------------
  void randomAction()
  {
    println("---- randomAction() on " + id + " ----------");
println("BEFORE: tumble: "+tumble+", Adjust: "+tumbleAdjust+", factor: "+tumbleAdjustment);
    if (!doUpdate)
    {
      println("* randomAction forced doUpdate");
      toggleDoUpdate();
      return;
    }

    if (!travel)
    {
      println("* randomAction forced travel");
      toggleTravel();
      return;
    }

    if (velocityAdjust && velocityAdjustment < 0)
    {
      println("* randomAction forced positive velocity");
      velocityReverse();
      return;
    }

    if (!tumble)
    {
      println("* randomAction forced tumble");
      toggleTumble();
      return;
    }
   
    if (!display)
    {
      println("* randomAction forced display");
      toggleDisplay();
      return;
    }
    
    if (tumbleAdjust && abs(tumbleAdjustment) > maxTumbleAdjustment/2)
    {
      println("* randomAction forced halve tumble adjustment");
      tumbleHalve();
      return;
    }
    
    
    boolean prevTumbleAdjust = tumbleAdjust;
    float prevTumbleAdjustment = tumbleAdjustment;

    int n = int(random(13));
    
println("switch(" + n + ") ...");
    switch(n)
    {
      case 0:
      case 1:  // TOGGLE (turn off) TUMBLING
               toggleTumble();
               break;

      case 2:  // TOGGLE TUMBLE ADJUSTMENT
               toggleTumbleAdjust();
               break;

      case 3:
      case 4:
      case 5:
      case 6:  // REVERSE TUMBLE
               tumbleAdjust = true;
               tumbleReverse();
               // If the change is small, make it bigger!
               if (abs(tumbleAdjustment) < 0.3) tumbleDouble();
               break;

      case 7:
      case 8:
      case 9:  // HALVE OR DOUBLE TUMBLE ADJUSTMENT
               tumbleAdjust = true;
               if (abs(tumbleAdjustment) > maxTumbleAdjustment/2)
                 tumbleHalve();
               else if (abs(tumbleAdjustment) < minTumbleAdjustment*2 ||
                        random(1) < 0.5)  // forced double or random double
                 tumbleDouble();
               else
                 tumbleHalve();

               break;

      case 10: // RANDOM TUMBLE ADJUSTMENT
               {
                 tumbleAdjust = true;
                 float prev = tumbleAdjustment; 
                 tumbleAdjustment = pow(2, int(random(-2, 3))); // 0.25 to 4
                 tumbleAdjustment *= (random(1) < 0.5) ? -1 : 1;
                 if (tumbleAdjustment == prev) tumbleAdjustment *= -1;
                 break;
               }

      case 11: // TOGGLE (turn off) DISPLAY
               toggleDisplay();
               break;

      case 12: // APPLY RANDOM EFFECT
               randomEffectShot();
               break;
    } // end switch()
    
   // Don't want to go from not using adjustment to using
   // adjustment of 1 (or from using adjustment of 1 to not
   // using adjustment)
   if ((!prevTumbleAdjust && tumbleAdjustment == 1) ||
       (prevTumbleAdjust && prevTumbleAdjustment == 1))
   {
     tumbleAdjust = true;
     tumbleDouble();
   }

println("AFTER: tumble: "+tumble+", Adjust: "+tumbleAdjust+", factor: "+tumbleAdjustment);
  } // end randomAction()

  void randomEffectShot()
  {
    int effectNo = randomEffectNumber();
println("Random effect shot [" + effectNo + "] " + scene.effectsInfo[effectNo].name + " to " + id);
    effectParams[effectNo].shot();
    displayOn();
  }

  void randomEffectToggle()
  {
    int effectNo = randomEffectNumber();
println("Random effect shot [" + effectNo + "] " + scene.effectsInfo[effectNo].name + " to " + id);
    effectParams[effectNo].toggle();
    displayOn();
  }

  int randomEffectNumber()
  {
    return int(random(scene.numEffects));
  }
}


