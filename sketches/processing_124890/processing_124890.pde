
// This sketch approximates an interpretation of Terry Riley's score "In C"
// The score specifies sound snippets and rules and recommendations for
// playing them. In the short time available for this project I won't be able
// to implement all the rules but I think it is possible to achieve an
// approximation that will be sufficiently interesting to play with

import ddf.minim.*;

// Named Constants

// There are 53 fragments in the score
int fragmentCount = 53;
// The score specifies a group of about 35 but that is impractical
// for our implementation for many reasons
int voiceCount = 4;
// Voices have a probability of repeat which starts at a
// default value and decreases every time a repeat happens
int defaultProbabilityOfRepeat = 80;
int deltaProbabilityOfRepeat = 20;
// Prefix path for web-based files
String prefixPath = "http://zilbermann.com/ComputationalArts/Final/Data/"; 
// Switch between local and web-based files
boolean webBased = false;
// Extension for the audio files
String extAudio = ".mp3";

// Global (class) variables and structures

// The Minim object
Minim minim;
// Mutex to prevent multiple iterations of the draw loop from
// entering simultaneously into the sequencing part
boolean sequencing;
// The implementation is based on files containing recorded fragments
// Each instrument (voice) will use a different player so that
// they can play simultaneously
AudioPlayer[] player;
// A special player, the pulse, plays continuously a C note
AudioPlayer thePulse;
// Each voice will be playing a specific fragment (0 to 52)
int[] voicePosition;
// Each voice may be in a muted state
boolean[] mutedState;
// We need to minimize delays when playing, using a flag array will enable us
// to trigger the samples with the shortest delay between them
boolean[] playNow;
// We will need a table of file names
// each voice in each row
// each fragment in each column
// Initially I will have only one instrument
// but in a future version this will give use the flexibility of having
// different instruments in each voice
// e.g., files for PianoAndStrings from 1 to 53 on voice 1
// files for Clarinet from 1 to 53 on voice 2, etc
String[][] voiceFile;
// the dynamic probability of repeat for each voice
int[] probabilityOfRepeat;
// Voice Density
int voiceDensity;
// Voice Density image
PImage[] voiceDensityImage;

// Initialize sketch
void setup()
{
  size(1280, 720);
  
  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);

  // Initialize all arrays  
  voiceFile = new String[voiceCount][fragmentCount]; 
  player = new AudioPlayer[voiceCount];
  voicePosition = new int[voiceCount];
  mutedState = new boolean[voiceCount];
  playNow = new boolean[voiceCount];
  probabilityOfRepeat = new int[voiceCount];
  voiceDensityImage = new PImage[voiceCount];

  initializeVoice(0,"PianoAndStrings", -0.50);
  initializeVoice(1,"PianoAndStrings",  0.50);
  initializeVoice(2,"PianoAndStrings", -0.75);
  initializeVoice(3,"PianoAndStrings",  0.75);
  
  thePulse = minim.loadFile("PianoAndStrings_00" + extAudio);
  thePulse.setGain(-10.0);
  thePulse.loop();
  
  background(0);
  fill(0);
  image(voiceDensityImage[voiceCount-1], 0, 412);  
  }

// Process iteration for sketch
void draw()
{ 
  if (!sequencing)
  {
    sequencing = true;
    calculateWhatToPlay();
    drawWaves();
    playIt();
    sequencing = false;  
  }
    
  if (true == areWeDone())
  {
    println("Closing down");
    thePulse.pause();
    minim.stop();
    exit();
  }
}

void keyReleased()
{
  switch (key)
  {
    case '1':
      image(voiceDensityImage[0], 0, 412);
      mutedState[1]=true;
      mutedState[2]=true;
      mutedState[3]=true;
      break;
    case '2':
      image(voiceDensityImage[1], 0, 412);
      mutedState[1]=false;
      mutedState[2]=true;
      mutedState[3]=true;
      break;
    case '3':
      image(voiceDensityImage[2], 0, 412);
      mutedState[1]=false;
      mutedState[2]=false;
      mutedState[3]=true;
      break;
    case '4':
      image(voiceDensityImage[3], 0, 412);
      mutedState[1]=false;
      mutedState[2]=false;
      mutedState[3]=false;
      break;
  }
}

// Do all the initialization for a voice
// voiceNumber = which voice to initialize
// instrumentName = which instrument files to load
// panning = left/right location for the voice (-1.0 to 1.0)
void initializeVoice(int voiceNumber, String instrumentName, float panning)
{
  if (voiceCount <= voiceNumber)
  {
    // Ignore attempts to initialize voices above the current voice count
    return;
  }
  
  voicePosition[voiceNumber] = 0;
  String formatter = webBased ? "http://zilbermann.com/ComputationalArts/Final/Data/%s_%02d" + extAudio:"%s_%02d" + extAudio;
  for (int fragmentIndex = 0; fragmentIndex < fragmentCount; ++fragmentIndex)
  {
    // The fragment names start at 01 but the array starts at 0 so we need to add 1
    // e.g., voice[1][0] = "PianoAndStrings_01.wav"
    voiceFile[voiceNumber][fragmentIndex]=String.format(formatter,instrumentName,fragmentIndex+1);
  }
  
  player[voiceNumber] = minim.loadFile(voiceFile[voiceNumber][0]);
  playNow[voiceNumber] = false;
  probabilityOfRepeat[voiceNumber] = defaultProbabilityOfRepeat;
  player[voiceNumber].setPan(panning);
  voiceDensityImage[voiceNumber] = loadImage(String.format("VoiceDensity_%02d.png", voiceNumber));
}

// Return true when the last voice is done 
boolean areWeDone()
{
  for (int voiceIndex = 0; voiceIndex < voiceCount ; ++voiceIndex)
  {
    if (voicePosition[voiceIndex] < fragmentCount || player[voiceIndex].isPlaying() )
    {
      return false;
    }
  }
  
  return true;
}

// Calculate which fragments to schedule and set the corresponding flags
void calculateWhatToPlay()
{
  //first determine what is playing, using flags to minimize delays
  boolean [] isPlaying = new boolean[voiceCount];
  for (int voiceIndex = 0; voiceIndex < voiceCount ; ++voiceIndex)
  {
    isPlaying[voiceIndex] = player[voiceIndex].isPlaying();
  }
  
  for (int voiceIndex = 0; voiceIndex < voiceCount ; ++voiceIndex)
  {
    if (!isPlaying[voiceIndex])
    {        
      float probabilityRoll = (int)random(0.0,100.0);     
      if (probabilityRoll >= probabilityOfRepeat[voiceIndex])
      {
        scheduleNextFragment(voiceIndex);
      } 
      else
      {
        scheduleCurrentFragment(voiceIndex);
      }
    }
  }
}

// Play the currently scheduled fragments according to the playNow flags
void playIt()
{
  for (int voiceIndex = 0; voiceIndex < voiceCount ; ++voiceIndex)
  {
    if (playNow[voiceIndex])
    {
      player[voiceIndex].mute();
      player[voiceIndex].play();
      if (!mutedState[voiceIndex])
      {
        player[voiceIndex].unmute();
      }
      playNow[voiceIndex] = false;
    }
  }
}

// Schedule a fragment that is not a repeat of the current one
// if we are past the end of the score stop the voice
// voiceIndex = the voice we are scheduling the fragment for
void scheduleNextFragment(int voiceIndex)
{
  if (fragmentCount > voicePosition[voiceIndex])
  {
    print("Playing", voiceIndex, voicePosition[voiceIndex], " ");
    println(voiceFile[voiceIndex][voicePosition[voiceIndex]]);
    player[voiceIndex].close();
    player[voiceIndex] = minim.loadFile(voiceFile[voiceIndex][voicePosition[voiceIndex]]);      
    voicePosition[voiceIndex]++;
    probabilityOfRepeat[voiceIndex] = defaultProbabilityOfRepeat; 
    playNow[voiceIndex] = true;
  }
  else
  {
    println("Ending ", voiceIndex);
    probabilityOfRepeat[voiceIndex] = 0;
  }        
}

// Schedule a repetition of the current fragment
// voiceIndex = the voice we are scheduling the fragment for
void scheduleCurrentFragment(int voiceIndex)
{
  println("Repeating ", voiceIndex);
  probabilityOfRepeat[voiceIndex] -= deltaProbabilityOfRepeat;
  player[voiceIndex].rewind();        
  playNow[voiceIndex] = true;
}

// draw waveforms for the first 4 voices
void drawWaves()
{
  int gain = 150; 
  stroke(0);
  rect(0, 0, 1280, 411);
  for(int i = 0; i < player[0].bufferSize() - 1; i++)
  {
    float x01 = map( i, 0, player[0].bufferSize(), 0, width );
    float x02 = map( i+1, 0, player[0].bufferSize(), 0, width );
    float x11 = map( i, 0, player[1].bufferSize(), 0, width );
    float x12 = map( i+1, 0, player[1].bufferSize(), 0, width );
    float x21 = map( i, 0, player[2].bufferSize(), 0, width );
    float x22 = map( i+1, 0, player[2].bufferSize(), 0, width );
    float x31 = map( i, 0, player[3].bufferSize(), 0, width );
    float x32 = map( i+1, 0, player[3].bufferSize(), 0, width );
    stroke(255, 255, 255);
    line( x01, 50 + player[0].mix.get(i)*gain, x02, 50 + player[0].mix.get(i+1)*gain );
    if (mutedState[1]) 
    {
      stroke(255, 0, 255);
    }
    line( x11, 150 + player[1].mix.get(i)*gain, x12, 150 + player[1].mix.get(i+1)*gain );
    if (mutedState[2]) 
    {
      stroke(255, 0, 255);
    }
    line( x21, 250 + player[2].mix.get(i)*gain, x22, 250 + player[2].mix.get(i+1)*gain );
    if (mutedState[3]) 
    {
      stroke(255, 0, 255);
    }
    line( x31, 350 + player[3].mix.get(i)*gain, x32, 350 + player[3].mix.get(i+1)*gain );
  }
}

