
/*******************************************************************************
 * SparkChime: Drag the mouse to release a colorful spray of sparks that produce
 * musical tones as they bounce.
 *
 * This version has sound disabled since OpenProcessing won't run the Javascript.
 *
 * To enable it, set SOUND_ON = true below and uncomment the Javascript section.
 *
 * @author Gregory Bush
 */

/*
 * High-level configuration settings
 */
int JAVA = 0;
int JAVASCRIPT = 1;

/*
 * Are we running in Java or Javascript?
 */
int ENVIRONMENT = JAVASCRIPT;

/*
 * The amount to scale sound by when playing in Java.  Higher is louder.
 * 1.0 is default.  If you get audio distortion in Java, reduce this value.
 */
float JAVA_AMPLIFICATION = 3.0;

/*
 * Since Javascript Maxim is not detecting the correct length of the sample,
 * specify it here.
 */
float JAVASCRIPT_SAMPLE_LENGTH = 200;

/*
 * The maximum number of particles to display at once.  Lowering this will
 * improve performance on slow systems.
 */
int PARTICLE_COUNT = 256;

/*
 * The number of events that must occur before a spark is emitted.  Increasing
 * this will improve video and sound performance as well as change the
 * aesthetics.
 */
int EMISSION_PERIOD = 0;

/*
 * Set to enable or disable all sound.
 */
boolean SOUND_ON = false;

/*
 * The sound file to use as the basic tone when the sparks hit the ground.
 */
String SOUND_FILE_NAME = "clavesMono2.wav";

/*
 * Specify which musical scale to use when tuning spark sounds.  To find
 * more scales to try, see the Music file in this project.
 */
Scale MUSICAL_SCALE = ScaleFactory.createEgyptianSuspended();

/*
 * The lowest note that a spark can produce, offset from the root tone.
 */
int LOW_NOTE = -15;

/*
 * The highest note that a spark can produce, offset from the root tone.
 */
int HIGH_NOTE = 10;

/*
 * The maximum number of sounds to have playing at once.  Lowering this
 * will improve audio performance.
 */
int VOICE_COUNT = 16;

/*
 * The lowest ratio of vertical speed retained after a spark bounces.
 */
float LOW_BOUNCE = 0.5;

/*
 * The highest ratio of vertical speed retained after a spark bounces.
 */
float HIGH_BOUNCE = 0.8;

/*
 * The variation in velocity of newly-created sparks.
 */
float SPRAY_SPREAD = 10.0;

/*
 * Some predefined gravity settings to play with.
 */
float EARTH_GRAVITY = 1.0 / 16.0;
float MOON_GRAVITY = EARTH_GRAVITY / 6.0;
float JUPITER_GRAVITY = EARTH_GRAVITY * 2.5;

/*
 * The amount of acceleration due to gravity.
 */
float GRAVITY = EARTH_GRAVITY;

/*
 * The amount of error allowed in model coordinate measurements.  Lowering
 * this will let sparks have tiny bounces longer.
 */
float TOLERANCE = 0.2;

/**
 * The focal length from the viewer to the screen in model coordinates.
 */
float FOCAL_LENGTH = 1000.0;

/**
 * The distance in model coordinates from the viewer to where new sparks are
 * created.  Increasing this number will move the created sparks further away.
 */
float INTERACTION_DISTANCE = 4 * FOCAL_LENGTH;

/*
 * A custom 3D canvas used to draw the world.
 */
Canvas3D canvas;

/*
 * A collection of Particles that represent the spraying sparks.
 */
Particle sparks[] = new Particle[PARTICLE_COUNT];

/*
 * The index of the Particle to use for the next spark created.
 */
int nextSpark = 0;

/*
 * The number of drag events that have passed without emitting a spark.
 */
int skipCount = 0;

/*
 * Create a SoundBank of bounce sounds depending on whether or not sound is
 * enabled.
 */
SoundBank createSoundBank(boolean soundEnabled) {
  SoundBank result;
  if (soundEnabled) {
    /*
     * If sound is enabled, create a palette of bounce sounds from a sample
     * file tuned to a particular musical scale.
     */
    result = new ScaledSampleSoundBank(new Maxim(this), SOUND_FILE_NAME, MUSICAL_SCALE, 
    LOW_NOTE, HIGH_NOTE, VOICE_COUNT, ENVIRONMENT == JAVA ? JAVA_AMPLIFICATION : 1.0, 
    ENVIRONMENT == JAVASCRIPT ? JAVASCRIPT_SAMPLE_LENGTH : 0.0);
  } 
  else {
    /*
     * Otherwise, if sound is disabled, yield a SoundBank that plays no sound.
     */
    result = new SilentSoundBank();
  }
  return result;
}

/**
 * Perform initial setup needed for the sketch.
 *
 * @author Gregory Bush
 */
void setup() {
  size(640, 480);
  background(0);

  /*
   * Create the 3D canvas to draw on.
   */
  canvas = new Canvas3D(FOCAL_LENGTH, INTERACTION_DISTANCE);

  /*
   * Get a soundbank to select bounce sounds from.
   */
  SoundBank soundBank = createSoundBank(SOUND_ON);

  /*
   * Initialize the array of Particles to be used in the animation.  They will be
   * each be randomly colored and have a random sound from the SoundBank.
   */
  for (int i = 0; i < PARTICLE_COUNT; i++) {
    sparks[i] = new Particle(random(256), random(256), random(256), soundBank.getRandomSound());
  }
}

/**
 * When the mouse is dragged, create a new spark at the mouse position with a
 * velocity based on the drag speed and direction.
 *
 * @author Gregory Bush
 */
void mouseDragged() {
  if (skipCount >= EMISSION_PERIOD) {
    /*
     * Reset the skip count.
     */
    skipCount = 0;

    /*
     * Convert the prior and current mouse screen coordinates to model coordinates.
     */
    PVector prior = canvas.toModelCoordinates(pmouseX, pmouseY);
    PVector current = canvas.toModelCoordinates(mouseX, mouseY);

    /*
     * If the interaction point is above the ground, create a spark.
     */
    if (current.y < height) {
      /*
       * The spark's initial velocity is the difference between the current and prior
       * points, randomized a bit to create a "spray" effect and scaled by the elapsed
       * time.
       */
      PVector velocity = PVector.sub(current, prior);
      velocity.add(new PVector(random(-SPRAY_SPREAD, SPRAY_SPREAD), 0, random(-SPRAY_SPREAD, SPRAY_SPREAD)/* * velocity.x*/));
      velocity.mult(1.0 / averageElapsedMillis);

      /*
       * Set the spark's intital motion and queue up the next particle.
       */
      sparks[nextSpark].initializeMotion(current, velocity);
      nextSpark = (nextSpark + 1) % PARTICLE_COUNT;
    }
  } 
  else {
    /*
     * Increase the skip count.
     */
    skipCount++;
  }
}

/**
 * Treat any mouse motion over the sketch like a mouse drag.
 */
void mouseMoved() {
  mouseDragged();
}

long lastFrameDrawn = millis();

float averageElapsedMillis = 20.0;

/**
 * Draw an animation frame.
 *
 * @author Gregory Bush
 */
void draw() {
  /*
   * Determine how long it has been since we last drew a frame.
   */
  long now = millis();
  long elapsedMillis = now - lastFrameDrawn;
  lastFrameDrawn = now;
  averageElapsedMillis = .90 * averageElapsedMillis + .10 * elapsedMillis;

  /*
   * Fade the screen's current contents a bit more toward black.
   */
  noStroke();    
  fill(0, 0, 0, constrain(2 * elapsedMillis, 0, 255));
  rect(0, 0, width, height);

  /*
   * Draw any active sparks and evolve them the amount of passed time
   * since the last frame was drawn.
   *
   * TODO: I'd like to draw these z-ordered from furthest to
   * closest, but the built-in Processing sorts don't
   * facilitate this.
   */

  for (Particle spark : sparks) {
    if (spark.isActive()) {
      spark.evolve(elapsedMillis);
    }
  }
}

/******************************************************************************
 * A Player is a simplified interface that will play a sound at a particular
 * speed and volume if possible.
 *
 * @author Gregory Bush
 */
public interface Player {
  /**
   * Play a sound at a particular speed and volume.  If it is not possible to
   * play the sound now, false will be returned.
   */
  public boolean play(float speed, float volume);
}

/******************************************************************************
 * A SamplePlayer is a Player that will play a single sample from an
 * AudioPlayer.  If the sample is already playing, the play method will return
 * false.
 *
 * @author Gregory Bush
 */
public class SamplePlayer implements Player {
  /*
   * The AudioPlayer that contains the loaded sample.
   */
  private final AudioPlayer player;

  /*
   * The time stamp when the sample last started playing.
   */
  private long startTime;

  /*
   * The length of this sample in milliseconds.
   */
  private float sampleLength;

  public SamplePlayer(AudioPlayer player, float sampleLength) {
    this.sampleLength = sampleLength;
    this.player = player;
    player.setLooping(false);
  }
  
  public SamplePlayer(AudioPlayer player) {
    this(player, player.getLengthMs());
  }

  public boolean play(float speed, float volume) {
    /*
     * Check if the sample has finished playing.
     */
    long now = millis();
    boolean donePlaying = now - startTime > sampleLength;

    if (donePlaying) {
      /*
       * If so, record the current time as the time the sample last started
       * playing.
       */
      startTime = now;

      /*
       * Then stop the player if it thinks it is still playing, rewind the
       * sample to the beginning, set the speed and volume and start playing
       * the sample.
       */
      player.stop();
      player.cue(0);
      player.speed(speed);
      player.volume(volume);
      player.play();
    }

    /*
     * Let the caller know if we were able to play the sample or not.
     */
    return donePlaying;
  }
}

/******************************************************************************
 * A PolyphonicPlayer is an aggregate Player that can play as many sounds at
 * once as the number of delegate Players that have been added to it.
 *
 * @author Gregory Bush
 */
public static class PolyphonicPlayer implements Player {
  /*
   * A list of delegate players that may be free to play a sound. 
   */
  private final ArrayList voices = new ArrayList();

  /*
   * The index of the next player that we will attempt to play a sound on.
   */
  private int nextVoice = 0;

  /**
   * Add a delegate Player to the PolyphonicPlayer.  One or more players must be
   * added before the PolyphonicPlayer can play any sounds.
   */
  public void addPlayer(Player p) {
    voices.add(p);
  }

  public boolean play(float speed, float volume) {
    /*
     * Attempt to play the sound on the next Player in line.  If successful,
     * move the Player after that to the head of the line.
     */
    boolean played;

    int voiceCount = voices.size();

    if (voiceCount > nextVoice) {
      played = ((Player) voices.get(nextVoice)).play(speed, volume);
      if (played) {
        nextVoice = (nextVoice + 1) % voiceCount;
      }
    } 
    else {
      played = false;
    }
    return played;
  }
}

/******************************************************************************
 * An AmplifiedPlayer is a Player that wraps a delegate Player and increases
 * (or decreases) the volume of all the sounds it plays by a specified scale
 * factor.
 *
 * @author Gregory Bush
 */
public class AmplifiedPlayer implements Player {
  /*
   * The delegate player that will actually play the sound.
   */
  private final Player delegate;

  /*
   * The scale factor we want to change the volume by.
   */
  private final float volumeMultiplier;

  public AmplifiedPlayer(Player delegate, float volumeMultiplier) {
    this.delegate = delegate;
    this.volumeMultiplier = volumeMultiplier;
  }

  public boolean play(float speed, float volume) {
    return delegate.play(speed, volume * volumeMultiplier);
  }
}

/******************************************************************************
 * A rudimentary 3D graphics library.
 *
 * @author Gregory Bush
 */

/**
 * A Canvas3D allows drawing graphics primitives in a 3D coordinate system.
 *
 * @author Gregory Bush
 */
public class Canvas3D {
  private final float focalLength;

  private final float interactionPlane;

  public Canvas3D(float focalLength, float interactionPlane) {
    this.focalLength = focalLength;
    this.interactionPlane = interactionPlane;
  }

  /**
   * Convert a point in the 3D model to a point on the 2D screen.
   */
  public PVector toScreenCoordinates(PVector p) {
    float scale = focalLength / p.z;

    return new PVector(p.x * scale + width / 2, p.y * scale + height / 2);
  }

  /**
   * Convert a point on the 2D screen to a point in the 3D model, projected on
   * the interaction plane.
   */
  public PVector toModelCoordinates(float x, float y) {
    float scale = interactionPlane / focalLength;

    return new PVector((x - width / 2) * scale, (y - height / 2) * scale, interactionPlane);
  }

  /**
   * Scale the diameter of a sphere whose center is at a particular Z distance to
   * its diameter on the screen.
   */
  public float scaleToScreen(float diameter, float distance) {
    return diameter * focalLength / distance;
  }

  private void drawLine(PVector from, PVector to) {
    line(from.x, from.y, to.x, to.y);
  }

  private void drawPoint(PVector p) {
    point(p.x, p.y);
  }

  /**
   * Draw a line between 3D points.
   */
  public void drawLine(PVector from, PVector to, float weight) {
    strokeWeight(scaleToScreen(weight, to.z));
    drawLine(toScreenCoordinates(from), toScreenCoordinates(to));
  }

  /**
   * Draw a point in 3D.
   */
  public void drawPoint(PVector p, float weight) {
    strokeWeight(scaleToScreen(weight, p.z));
    drawPoint(toScreenCoordinates(p));
  }

  /**
   * Draw a circle with vertical normal vector.
   */
  public void drawHorizontalCircle(PVector center, float radius, float weight) {
    float screenRadius = canvas.scaleToScreen(radius, center.z);
    PVector p = toScreenCoordinates(center);
    PVector back = toScreenCoordinates(PVector.add(center, new PVector(0, 0, radius)));
    float aspect = (back.y - p.y) * 2;
    
    /*
     * A reasonably good approximation of a circle in persepective.
     */
    strokeWeight(scaleToScreen(weight, center.z));    
    ellipse(p.x, p.y, screenRadius, aspect);
  }
}

/**
 * Increase the intensity of a color value.
 */
float amplify(float n) {
  return constrain(4 * n, 0, 255);
}

color amplifyColor(color c) {
  return color(amplify(red(c)), amplify(green(c)), amplify(blue(c)));
}

/******************************************************************************
 * A Particle is a representation of a bouncing, colored spark that plays a
 * sound when it strikes the ground.
 *
 * @author Gregory Bush
 */
public class Particle {
  /*
   * The coordinates of the Particle's current location.
   */
  private PVector location;

  /*
   * The Particle's velocity.
   */
  private PVector velocity;

  /*
   * The Particle's color.
   */
  private color c;

  /*
   * The sound that will be played when the Particle strikes the ground.
   */
  private Sound sound;

  /**
   * Create a Particle with a specified color and characteristic sound.
   */
  public Particle(float red, float green, float blue, Sound sound) {
    this.c = color(red, green, blue);
    this.sound = sound;
  }

  /**
   * Initialize or reset all variables describing the motion of the particle to
   * the specified values.
   */
  public void initializeMotion(PVector location, PVector velocity) {
    this.location = location;
    this.velocity = velocity;
  }

  /**
   * Returns true if the Particle should still be actively evolving in time.
   */
  public boolean isActive() {
    /*
     * We will consider the Particle active as long as it is on the other side
     * of the screen than the viewer. 
     */
    return location != null && location.z >= FOCAL_LENGTH;
  }

  /*
   * Draw a motion-blurred trajectory of a particular stroke weight and opacity.
   * The stroke weight will be scaled based on the Particle's distance from the
   * viewer.
   */
  private void drawMotion(PVector from, PVector to, float weight, float opacity) {
    stroke(c, opacity);
    canvas.drawLine(from, to, weight);
  }

  private void drawMotionBright(PVector from, PVector to, float weight, float opacity) {
    stroke(amplifyColor(c), opacity);
    canvas.drawLine(from, to, weight);
  }

  private void paint(PVector from, PVector to) {
    /*
     * Draw three motion blurs, successively narrower and brighter.
     */
    drawMotion(from, to, 64, 16);
    drawMotion(from, to, 16, 128);
    drawMotionBright(from, to, 8, 255);
  }

  private PVector flip(PVector v) {
    return new PVector(v.x, height + 2 * (height - v.y), v.z);
  }

  private void paintReflection(PVector from, PVector to) {
    from = flip(from);
    to = flip(to);

    drawMotion(from, to, 32, 4);
    drawMotionBright(from, to, 8, 8);
  }

  /*
   * Draw the splash when the Particle strikes the ground and play the
   * Particle's characteristic note if sound is enabled.
   */
  private void splash(PVector to) {
    /*
     * The splash is a circle on the ground with dim illumination in its
     * interior and a bright ring on its circumference.
     */
    stroke(c, 128);
    fill(c, 64);
    canvas.drawHorizontalCircle(to, 128, 8);

    /*
     * At the point where the Particle touched the ground, draw a small
     * but bright flash of light.
     */
    stroke(255, 255, 255, 255);
    canvas.drawPoint(to, 8);

    /*
     * Play the splash sound at a volume relative to how fast the
     * particle collided.
     */
    sound.play(map(-velocity.y, 0, 6, 0, 1));
  }

  /*
   * Various functions to determine the direction of the Particle's motion.
   */

  private boolean isMovingLeft() {
    return velocity.x <= -TOLERANCE;
  }

  private boolean isMovingRight() {
    return velocity.x >= TOLERANCE;
  }

  private boolean isMovingUp() {
    return velocity.y <= -TOLERANCE;
  }

  private boolean isMovingDown() {
    return velocity.y >= TOLERANCE;
  }

  private boolean isMovingVertically() {
    return isMovingUp() || isMovingDown();
  }

  /*
   * Reverse the horizontal motion of the Particle.
   */
  private void bounceHorizontal() {
    velocity.x = -velocity.x * random(LOW_BOUNCE, HIGH_BOUNCE);
  }

  /*
   * Reverse the vertical motion of the Particle.
   */
  private void bounceVertical() {
    /*
     * The Particle's kinetic energy will be scaled down randomly.  It
     * will lose energy with every bounce.
     */
    velocity.y = -velocity.y * random(LOW_BOUNCE, HIGH_BOUNCE);
  }

  /*
   * Give the particle an inactive status, indicating it no longer needs to be
   * evolved in time.
   */
  private void deactivate() {
    location.z = 0;
  }

  public void evolve(float elapsedMillis) {
    /*
     * Deactivate the particle if it has settled into the ground.
     */
    if (location.y > height && velocity.y > 0) {
      deactivate();
      return;
    }

    for (;;) {
      /*
       * Determine if the Particle collided with the ground.  If so, determine
       * where and when it collided.
       */
      boolean collided;
      float collisionMillis = (height - location.y) / velocity.y;

      PVector to;
      if (collisionMillis > 0 && collisionMillis < elapsedMillis) {
        to = PVector.add(location, PVector.mult(velocity, collisionMillis));
        elapsedMillis -= collisionMillis + 1;
        collided = true;
        if (isMovingDown()) {
          bounceVertical();
        }
      } 
      else {
        to = PVector.add(location, PVector.mult(velocity, elapsedMillis));
        collided = false;
      }

      paintReflection(location, to);

      if (collided) {
        splash(to);
      }

      paint(location, to);

      location = to;
      
      /*
       * If the Particle didn't collide with anything, then we're finished.
       */
      if (!collided) {
        break;
      }
    }

    /*
     * Apply the accleration due to gravity.
     */
    velocity.y += GRAVITY;
  }
}

/*
 * Include this commented-out Javascript to play sound.
 */

//var mtof = [0, 8.661957, 9.177024, 9.722718, 10.3, 10.913383, 11.562325, 12.25, 12.978271, 13.75, 14.567617, 15.433853, 16.351599, 17.323914, 18.354048, 19.445436, 20.601723, 21.826765, 23.124651, 24.5, 25.956543, 27.5, 29.135235, 30.867706, 32.703197, 34.647827, 36.708096, 38.890873, 41.203445, 43.65353, 46.249302, 49., 51.913086, 55., 58.27047, 61.735413, 65.406395, 69.295654, 73.416191, 77.781746, 82.406891, 87.30706, 92.498604, 97.998856, 103.826172, 110., 116.540939, 123.470825, 130.81279, 138.591309, 146.832382, 155.563492, 164.813782, 174.61412, 184.997208, 195.997711, 207.652344, 220., 233.081879, 246.94165, 261.62558, 277.182617, 293.664764, 311.126984, 329.627563, 349.228241, 369.994415, 391.995422, 415.304688, 440., 466.163757, 493.883301, 523.25116, 554.365234, 587.329529, 622.253967, 659.255127, 698.456482, 739.988831, 783.990845, 830.609375, 880., 932.327515, 987.766602, 1046.502319, 1108.730469, 1174.659058, 1244.507935, 1318.510254, 1396.912964, 1479.977661, 1567.981689, 1661.21875, 1760., 1864.655029, 1975.533203, 2093.004639, 2217.460938, 2349.318115, 2489.015869, 2637.020508, 2793.825928, 2959.955322, 3135.963379, 3322.4375, 3520., 3729.31, 3951.066406, 4186.009277, 4434.921875, 4698.63623, 4978.031738, 5274.041016, 5587.651855, 5919.910645, 6271.926758, 6644.875, 7040., 7458.620117, 7902.132812, 8372.018555, 8869.84375, 9397.272461, 9956.063477, 10548.082031, 11175.303711, 11839.821289, 12543.853516, 13289.75];
//var context = new webkitAudioContext();  
//
//function Maxim(t) {
//
//  this.loadFile = function(filename) {
//    var audio = new XMLHttpRequest();
//    var source = null;
//    var myAudioBuffer = null;
//    var playing=false;
//    var isLooping=false;
//    var startTime=0;
//    var endTime = 0;
//    var currentSpeed = 1.0;
//    var sampleLength = 1.0;
//    var volume = 1.0;
//    var gainNode = null;
//    var filter = null;
//    var analyser = null;
//    var analysing = true;
//    var attack = 0;
//    var release = 0;
//    var envTime = 0;
//    var flux = 0;
//    var averageSpectrumPower = 0;
//    var FFTData = null;
//    audio.open('GET', filename, true);
//    audio.responseType = 'arraybuffer';
//    audio. {
//      //      alert("sound loaded"); //test
//      context.decodeAudioData(audio.response, function(buffer) {
//        myAudioBuffer = buffer;
//        //       alert("sound decoded"); //test
//        source = context.createBufferSource();
//        gainNode = context.createGainNode();
//        filter = context.createBiquadFilter();
//        analyser = context.createAnalyser();
//        filter.type = 0;
//        filter.frequency.value = 20000;
//        envTime = 1.0;
//        source.buffer = myAudioBuffer;
//        source.playbackRate.value = currentSpeed;
//        source.connect(filter);
//        filter.connect(gainNode);
//        gainNode.gain.value = volume;
//        gainNode.connect(context.destination);
//        sampleLength = source.buffer.duration*1000;
//      }
//      );
//    }
//
//    audio.send();
//    audio.isPlaying = function() {
//
//      return playing;
//    }
//
//    audio.setLooping = function(t) {
//      isLooping=t;
//    }
//
//    audio.cue = function(time) {
//
//      startTime=time/1000;
//    }
//
//    audio.speed = function(speed) {
//      if (source) {
//
//        currentSpeed = speed;
//
//        source.playbackRate.value = speed;
//      }
//    }
//
//    audio.getLengthMs = function() {
//      if (source) {
//        //        alert(source.buffer.duration*1000);
//        return sampleLength;
//      }
//    }
//    
//    audio.volume = function(gain) {
//
//      volume=gain;
//
//      if (playing) {
//        gainNode.gain.value = volume;
//      }
//    }
//
//    audio.play = function() {
//      if (source) {
//      if (!playing) {
//        source = context.createBufferSource();
//        gainNode = context.createGainNode()
//        filter = context.createBiquadFilter();
//        filter.type = 0;
//        filter.frequency.value = 20000;
//        envTime = 1.0;
//        source.buffer = myAudioBuffer;
//        source.playbackRate.value = currentSpeed;
//        sampleLength = source.buffer.duration*1000;
//        source.connect(filter);
//        filter.connect(gainNode);
//        gainNode.connect(context.destination);
//        gainNode.gain.value = volume;
//        //          alert("source connected"); //test
//        if (isLooping) source.loop = true;
//        //          source.loopStart = startTime/1000;
//        //          source.loopEnd = source.buffer.duration;
//        source.noteGrainOn(0, startTime, source.buffer.duration-startTime);
//        playing=true;
//      }
//      if (analysing==true) {
//          gainNode.connect(analyser);
//          FFTData = new Float32Array(analyser.frequencyBinCount);
//          analyser.getFloatFrequencyData(FFTData);
//        }
//    }
//    }
//
//    audio.stop = function() {
//      if (source) {
//        source.noteOff(0);
//        playing=false;
//      }
//    }
//
//    audio.setFilter = function(freq, res) {
//
//      filter.frequency.value = freq;
//      filter.Q.value = res;
//    }
//
//    audio.filterRamp = function(freq, envTime) {
//
//      filter.frequency.cancelScheduledValues(context.currentTime);
//      filter.frequency.linearRampToValueAtTime(filter.frequency.value, context.currentTime);   // THIS IS THE CHANGE FROM PREVIOUS CODE EXAMPLE
//      filter.frequency.linearRampToValueAtTime(freq, context.currentTime + envTime/1000.);
//    }
//
//    //This function allows you to set the amplitude of the waveform
//    audio.setAmplitude = function(amplitude) {
//
//      gainNode.gain.cancelScheduledValues(context.currentTime);
//      gainNode.gain.linearRampToValueAtTime(gainNode.gain.value, context.currentTime);
//      gainNode.gain.linearRampToValueAtTime(amplitude, context.currentTime + 10);
//    }
//
//    audio.ramp = function(amplitude, envTime) {
//
//      gainNode.gain.cancelScheduledValues(context.currentTime);
//      gainNode.gain.linearRampToValueAtTime(gainNode.gain.value, context.currentTime);
//      gainNode.gain.linearRampToValueAtTime(amplitude, context.currentTime + envTime/1000.);
//    }
//    
//    audio.getAveragePower = function() {
//      averageSpectrumPower = 0
//      for (var i=0;i<analyser.frequencyBinCount;i++) {
//      
//              averageSpectrumPower+=FFTData[i]
//          }
//      return (100+(averageSpectrumPower/analyser.frequencyBinCount))*0.01; 
//    }
//    
//      audio.getFlux = function() {
//      flux=0;
//      var FFTData1 = new Float32Array(analyser.frequencyBinCount);
//      for (var i=0;i<analyser.frequencyBinCount;i++) {
//      
//              flux+=FFTData[i]-FFTData1[i];
//          }
//            FFTData1=FFTData;
//      return (100+(flux/analyser.frequencyBinCount))*0.01; 
//    }
//
//    return audio;
//  }
//}
//
//
//
////This is the constructor for our waveform generator. 
//Synth = function() {
//  var that = this;
//  this.phase = 0;
//  this.context = context;
//  this.node = context.createJavaScriptNode(512, 2, 2);
//  this.node. { 
//    that.process(audioContext)
//    };
//    this.sample_rate = 44100;
//  this.frequency = 220;
//  this.amplitude = 1.0;
//  this.gainNode = context.createGainNode();
//  this.delayGain = context.createGainNode();
//  this.filter = context.createBiquadFilter();
//  this.delay = context.createDelayNode(2);
//  this.delayAmt = 0.75;
//  this.delayGain.gain.value = 0.75;
//  this.filter.type = 0;
//  this.envTime = 1.0;
//  this.isPlaying = false;
//  this.waveFormSize = 514;
//  this.wave = new Array(this.waveFormSize);
//
//  for (var i = 0; i < this.waveFormSize + 1 ; i++) {
//
//    this.wave[i]=Math.sin(i/(this.waveFormSize-2) * (Math.PI * 2));
//  }
//}
//
//Synth.prototype.waveTableSize = function(size) {
//
//  this.waveFormSize=size;
//}
//
//Synth.prototype.loadWaveTable = function(waveTable) {
//
//  for (var i = 0; i < this.waveFormSize ; i++) {
//
//    this.wave[i] = waveTable[i];
//  }
//  //  alert("all done");
//}
//
//
////This function is the waveform generator's buffer method
////Hack here to create new waveforms
//Synth.prototype.process = function(audioContext) {
//  var data = audioContext.outputBuffer.getChannelData(0);
//  for (var i = 0; i < data.length; i++) {
//    var remainder;
//    this.phase += (this.waveFormSize-2) / (this.sample_rate / this.frequency);
//    if (this.phase >= (this.waveFormSize-3) ) this.phase -= (this.waveFormSize-2) ;
//    remainder = this.phase - Math.floor(this.phase);
//    data[i]=(1-remainder) * this.wave[1+Math.floor(this.phase)] + remainder * this.wave[2+Math.floor(this.phase)];
//  } 
//  //  console.log('data = ' + this.frequency);
//}
//
////This function allows you to 'play' the waveform
//Synth.prototype.play = function() {
//  this.node.connect(this.filter);
//  this.filter.connect(this.gainNode);
//  this.gainNode.connect(this.context.destination);
//  this.gainNode.connect(this.delay);
//  this.delay.connect(this.delayGain);
//  this.delayGain.connect(this.delay);
//  this.delay.connect(this.context.destination);
//  this.isPlaying=true;
//}
//
////This function allows you to set the frequency of the waveform
//Synth.prototype.setFrequency = function(frequency) {
//  this.frequency = frequency;
//}
//
////This function allows you to set the amplitude of the waveform
//Synth.prototype.setAmplitude = function(amplitude) {
//
//  this.gainNode.gain.cancelScheduledValues(context.currentTime);
//  this.gainNode.gain.linearRampToValueAtTime(this.gainNode.gain.value, context.currentTime);
//  this.gainNode.gain.linearRampToValueAtTime(amplitude, context.currentTime + 10);
//}
//
//Synth.prototype.ramp = function(amplitude, envTime) {
//
//  this.gainNode.gain.cancelScheduledValues(context.currentTime);
//  this.gainNode.gain.linearRampToValueAtTime(this.gainNode.gain.value, context.currentTime);
//  this.gainNode.gain.linearRampToValueAtTime(amplitude, context.currentTime + envTime/1000.);
//}
//
////This allows us to stop the waveform generator
//Synth.prototype.stop = function() {
//  this.node.disconnect();
//  this.isPlaying=false;
//}
//
//Synth.prototype.setDelayTime = function(t) {
//
//  this.delay.delayTime.value = t;
//
//}
//
//Synth.prototype.setDelayAmount = function(t) {
//  
//  this.delayGain.gain.value = t;
//
////  this.delayGain.gain.cancelScheduledValues(context.currentTime);
////  this.delayGain.gain.linearRampToValueAtTime(this.delayGain.gain.value, context.currentTime);
////  this.delayGain.gain.linearRampToValueAtTime(this.delayGain.gain.value, context.currentTime,100);
//
//}
//
//Synth.prototype.setFilter = function(freq, res) {
//
//  this.filter.frequency.value = freq;
//  this.filter.Q.value = res;
//}
//
//Synth.prototype.filterRamp = function(freq, envTime) {
//
//  this.filter.frequency.cancelScheduledValues(context.currentTime);
//  this.filter.frequency.linearRampToValueAtTime(this.filter.frequency.value, context.currentTime);   // THIS IS THE CHANGE FROM PREVIOUS CODE EXAMPLE
//  this.filter.frequency.linearRampToValueAtTime(freq, context.currentTime + envTime/1000.);
//  //  this.filter.frequency.value = freq;
//  //  this.filter.Q.value = res;
//}

/*******************************************************************************
 * A Sound is a very simple abstraction of a sound that can be played at
 * a specified volume.  The baseline volume is 1.0.
 *
 * @author Gregory Bush
 */
public interface Sound {
  public void play(float volume);
}

/*******************************************************************************
 * A PlayerSound is a type of Sound that is played by a delegate player at a
 * predefined speed and specified volume.
 *
 * @author Gregory Bush
 */
public class PlayerSound implements Sound {
  private final Player player;

  private final float speed;

  public PlayerSound(Player player, float speed) {
    this.player = player;
    this.speed = speed;
  }

  public void play(float volume) {
    player.play(speed, volume);
  }
}

/*******************************************************************************
 * A Scale can produce a list of frequency multipliers necessary to produce the
 * notes in a specified range.
 *
 * Note 0 is the root of the scale and integer offsets below and above 0 are
 * lower and higher notes in the scale, respectively.
 *
 * For example, in a C major scale, there are 12 notes in an octave, where
 * 0 is middle C, 4 is 12 is high C.
 *
 * @author Gregory Bush
 */
public interface Scale {
  /**
   * Get the frequency multipliers needed to produce the note offsets in the
   * range from low (inclusive) to high (exclusive).
   */
  public float[] getFrequencyFactors(int low, int high);
}

/*******************************************************************************
 * A RationalScale is divided into octaves where the same pattern of frequency
 * ratios is repeated relative to the overall octave multiplier.
 *
 * @author Gregory Bush
 */
public static class RationalScale implements Scale {
  private final ArrayList factors = new ArrayList();

  public RationalScale() {
  }

  /*
   * Create a cyclic scale from an array of ratios.
   */
  public RationalScale(float[] ratios) {
    if (ratios.length > 0) {
      float rootRatio = ratios[0];
      for (float ratio : ratios) {
        addFrequencyFactor(ratio / rootRatio);
      }
    }
  }

  public void addFrequencyFactor(float factor) {
    factors.add(factor);
  }

  private float getFrequencyFactor(int noteOffset) {
    int cycleLength = factors.size();

    int cyclePosition = noteOffset % cycleLength;

    if (cyclePosition < 0) {
      cyclePosition += cycleLength;
    }

    /*
     * The frequency multiplier is 2^(octave offset) * (specified frequency)
     */
    return pow(2.0, int(noteOffset / cycleLength)) * (Float) factors.get(cyclePosition);
  }

  public float[] getFrequencyFactors(int low, int high) {
    int rangeLength = high - low;

    float[] result = new float[rangeLength];

    for (int i = 0; i < rangeLength; i++) {
      result[i] = getFrequencyFactor(low + i);
    }

    return result;
  }
}

/*******************************************************************************
 * An EqualTemperamentScale divides octaves into uniform logarithmic intervals.
 *
 * Modern Western music uses scales based on subsets of 12 tone equal
 * temperament.
 *
 * @author Gregory Bush
 */
public static class EqualTemperamentScale implements Scale {
  private final int cycleLength;

  public EqualTemperamentScale(int cycleLength) {
    this.cycleLength = cycleLength;
  }

  private float getFrequencyFactor(int noteOffset) {
    /*
     * The frequency multiplier is 2^(noteOffset / cycleLength).
     */
    return pow(2.0, (float) noteOffset / cycleLength);
  }

  public float[] getFrequencyFactors(int low, int high) {
    int rangeLength = high - low;

    float[] result = new float[rangeLength];

    for (int i = 0; i < rangeLength; i++) {
      result[i] = getFrequencyFactor(low + i);
    }

    return result;
  }
}

/*******************************************************************************
 * Some interesting scales.  The pentatonic scales (the ones with 5 ratios
 * defined) are particularly nice for randomly generated music, since many
 * notes can be combined with little dissonance.
 *
 * @author Gregory Bush
 */
public static class ScaleFactory {
  public static Scale createPentatonicMinor() {
    return new RationalScale(new float[] {
      30, 36, 40, 45, 54
    }
    );
  }

  public static Scale createPentatonicMajor() {
    return new RationalScale(new float[] {
      24, 27, 30, 36, 40
    }
    );
  }

  public static Scale createEgyptianSuspended() {
    return new RationalScale(new float[] {
      24, 27, 32, 36, 40
    }
    );
  }

  public static Scale createBluesMinor() {
    return new RationalScale(new float[] {
      15, 18, 20, 24, 27
    }
    );
  }

  public static Scale createBluesMajor() {
    return new RationalScale(new float[] {
      24, 27, 32, 36, 40
    }
    );
  }

  public static Scale createPentatonicPythagorean() {
    return new RationalScale(new float[] {
      54, 64, 72, 81, 96
    }
    );
  }

  /*
   * The diatonic scale is not pentatonic.  (It has seven notes per cycle
   * instead of five.)  It creates a more dissonant effect.
   */
  public static Scale createDiatonic() {
    return new RationalScale(new float[] {
      24, 27, 30, 32, 36, 40, 45
    }
    );
  }

  /*
   * The chromatic scale has a highly dissonant effect with 12 notes per
   * cycle.
   */
  public static Scale createChromatic() {
    return new EqualTemperamentScale(12);
  }
}

/*******************************************************************************
 * You can randomly select a Sound from a SoundBank.
 *
 * @author Gregory Bush
 */
public interface SoundBank {
  public Sound getRandomSound();
}

/*******************************************************************************
 * A ScaledSampleSoundBank contains a basic sound loaded from a file and
 * different tunings of the same sound according to a specified scale and note
 * range.
 *
 * @author Gregory Bush
 */
public class ScaledSampleSoundBank implements SoundBank {
  private Sound[] sounds;

  public ScaledSampleSoundBank(Maxim maxim, String sampleFile, Scale scale, int lowNote, 
  int highNote, int polyphony, float amplification, float customSampleLength) {
    PolyphonicPlayer pp = new PolyphonicPlayer();
    for (int i = 0; i < polyphony; i++) {
      Player p;
      if (customSampleLength > 0.0) {
        p = new SamplePlayer(maxim.loadFile(sampleFile), customSampleLength);
      } 
      else {
        p = new SamplePlayer(maxim.loadFile(sampleFile));
      }
      if (amplification != 1.0) {
        p = new AmplifiedPlayer(p, amplification);
      }
      pp.addPlayer(p);
    }

    float[] frequencyFactors = scale.getFrequencyFactors(lowNote, highNote);

    int soundCount = frequencyFactors.length;

    sounds = new Sound[soundCount];

    for (int i = 0; i < soundCount; i++) {
      sounds[i] = new PlayerSound(pp, frequencyFactors[i]);
    }
  }

  public Sound getRandomSound() {
    return sounds[int(random(0, sounds.length))];
  }
}

/*******************************************************************************
 * Hello, darkness, my old friend...
 *
 * THE_SOUND_OF_SILENCE is inaudible when played.
 *
 * @author Gregory Bush
 */
Sound THE_SOUND_OF_SILENCE = new Sound() {
  public void play(float volume) {
  }
};

/*******************************************************************************
 * A SilentSoundBank contains only THE_SOUND_OF_SILENCE.
 *
 * @author Gregory Bush
 */
public class SilentSoundBank implements SoundBank {
  public Sound getRandomSound() {
    return THE_SOUND_OF_SILENCE;
  }
}



