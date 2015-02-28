
PImage [] theFire;
PImage [] theRain;
int fcurrentFrame = 0;
int rcurrentFrame = 0;

float fire_ypos = 50;
float rain_ypos = 50;

float FIRE_HEIGHT = 0;
float RAIN_HEIGHT = 0;

float MAX_FHEIGHT = 0;
float MAX_RHEIGHT = 0;
float fImgWidth = 0;
float rImgWidth = 0;

float fire_volume = 0;
float rain_volume = 0;
boolean sfireplaying = false;
boolean swaterplaying = false;
float red = 0;
float blue = 0;

Maxim maxim;
AudioPlayer sfire;
AudioPlayer swater;
float speedAdjust=1.0;

float map_height(float position, float max_height) {
  float h = 0;
  if (position <= height/2) {
    h = map(position, 0 , height/2, 50, max_height);
  } 
  else {
     h = map(position, height , height/2, 50, max_height);
  }
//  println("   map_height=> h:"+h+" pos:"+position+" max_height:"+max_height+ " height:"+ height);
  return h ;
}

float map_volume(float position, float max_vol) {
  float v = 0;
  if (position <= height/2) {
    v = map(position, 0 , height/2, 0.3, max_vol);
  } 
  else {
     v = map(position, height , height/2, 0.3, max_vol);
  }
  return v ;
}

float map_color(float position) {
  float c = 0;
  if (position <= height/2) {
    c = map(position, 0 , height/2, 0,255);
  } 
  else {
    c = map(position, height , height/2, 0, 255);
  }
  return c ;
}

void setup() 
{ 
 size(768,600);
 imageMode(CENTER); 
 theFire = loadImages("fire",".jpg",132);
 theRain = loadImages("rain",".jpg",132);
 maxim = new Maxim(this);
 sfire = maxim.loadFile("sound_fire.wav");
 sfire.setLooping(true);
 swater = maxim.loadFile("sound_water.wav");
 swater.setLooping(true);
 background(10);
}

void draw() {
  background(red, 0 , blue);
  
  imageMode(CENTER);
  if (MAX_FHEIGHT == 0 && theFire[0].height > 0) {
     MAX_FHEIGHT = width/2 * theFire[0].height / theFire[0].width;
     FIRE_HEIGHT = map_height(fire_ypos, MAX_FHEIGHT);
     fImgWidth = FIRE_HEIGHT  * theFire[0].width / theFire[0].height;
  }
  image(theFire[fcurrentFrame], width/4, fire_ypos, fImgWidth, FIRE_HEIGHT);
  fcurrentFrame++;
  if (fcurrentFrame >= theFire.length){
    fcurrentFrame = 0;
  }
 
  if (MAX_RHEIGHT == 0  && theRain[0].height > 0) {
   MAX_RHEIGHT = width/2 * theRain[0].height / theRain[0].width;
   RAIN_HEIGHT = map_height(rain_ypos, MAX_RHEIGHT);
   rImgWidth = RAIN_HEIGHT  * theRain[0].width / theRain[0].height;
  }
  image(theRain[rcurrentFrame], width/2 + width/4, rain_ypos, rImgWidth, RAIN_HEIGHT);
  rcurrentFrame++;
  if (rcurrentFrame >= theRain.length){
    rcurrentFrame = 0;
  }
}

void mouseDragged() {

  if(mouseY < 0) {
      mouseY = 0;
    }
    else if (mouseY > height){
      mouseY = height;
    }  
  if(mouseX < width/2) {
   FIRE_HEIGHT = map_height(mouseY, MAX_FHEIGHT);
   fImgWidth = FIRE_HEIGHT  * theFire[0].width / theFire[0].height;
   fire_ypos = mouseY;
   if (fire_ypos - FIRE_HEIGHT/2 < 0) {
      fire_ypos = FIRE_HEIGHT/2;
     }
    else if ( fire_ypos + FIRE_HEIGHT/2 > height ) {
      fire_ypos = height - FIRE_HEIGHT/2 ;
    }
  }
  else {
    RAIN_HEIGHT = map_height(mouseY, MAX_RHEIGHT);
    rImgWidth = RAIN_HEIGHT  * theRain[0].width / theRain[0].height;
    rain_ypos = mouseY;
    if (rain_ypos - RAIN_HEIGHT/2 < 0) {
      rain_ypos = RAIN_HEIGHT/2 ;
     }
    else if ( rain_ypos + RAIN_HEIGHT/2 > height ) {
      rain_ypos = height - RAIN_HEIGHT/2 ;
    }    
  }
   fire_volume = map_volume(fire_ypos, 10);
   rain_volume = map_volume(rain_ypos, 1);
  
  sfire.volume(fire_volume);
//  if (!sfire.isPlaying()) {
//    sfire.play();
//    sfire.speed(speedAdjust);
//  }
  swater.volume(rain_volume);
//  if (!swater.isPlaying()) {
//    swater.play();
//    swater.speed((swater.getLengthMs()/sfire.getLengthMs())*speedAdjust);
//  }

   red = map_color(fire_ypos);
   blue = map_color(rain_ypos);
}

void mousePressed() {
   if(mouseX < width/2) {
     sfireplaying = ! sfireplaying;
     if (sfireplaying) {
          sfire.play();
          sfire.speed(speedAdjust);
          red = map_color(fire_ypos);
     }
     else {
       sfire.stop();
       red = 0;
     }
   }
  else {
        swaterplaying = ! swaterplaying;
     if (swaterplaying) {
         swater.play();
         swater.speed((swater.getLengthMs()/sfire.getLengthMs())*speedAdjust);
         blue = map_color(rain_ypos);
     }
     else {
       swater.stop();
       blue = 0;
     }
  } 
}
//The MIT License (MIT)

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


PImage [] loadImages(String stub, String extension, int numImages)
{
  PImage [] images = new PImage[0];
  for(int i =0; i < numImages; i++)
  {
    PImage img = loadImage(stub+i+extension);
    if(img != null)
    {
      images = (PImage [])append(images,img);
    }
    else
    {
      break;
    }
  }
  return images;
}


var mtof = [0, 8.661957, 9.177024, 9.722718, 10.3, 10.913383, 11.562325, 12.25, 12.978271, 13.75, 14.567617, 15.433853, 16.351599, 17.323914, 18.354048, 19.445436, 20.601723, 21.826765, 23.124651, 24.5, 25.956543, 27.5, 29.135235, 30.867706, 32.703197, 34.647827, 36.708096, 38.890873, 41.203445, 43.65353, 46.249302, 49., 51.913086, 55., 58.27047, 61.735413, 65.406395, 69.295654, 73.416191, 77.781746, 82.406891, 87.30706, 92.498604, 97.998856, 103.826172, 110., 116.540939, 123.470825, 130.81279, 138.591309, 146.832382, 155.563492, 164.813782, 174.61412, 184.997208, 195.997711, 207.652344, 220., 233.081879, 246.94165, 261.62558, 277.182617, 293.664764, 311.126984, 329.627563, 349.228241, 369.994415, 391.995422, 415.304688, 440., 466.163757, 493.883301, 523.25116, 554.365234, 587.329529, 622.253967, 659.255127, 698.456482, 739.988831, 783.990845, 830.609375, 880., 932.327515, 987.766602, 1046.502319, 1108.730469, 1174.659058, 1244.507935, 1318.510254, 1396.912964, 1479.977661, 1567.981689, 1661.21875, 1760., 1864.655029, 1975.533203, 2093.004639, 2217.460938, 2349.318115, 2489.015869, 2637.020508, 2793.825928, 2959.955322, 3135.963379, 3322.4375, 3520., 3729.31, 3951.066406, 4186.009277, 4434.921875, 4698.63623, 4978.031738, 5274.041016, 5587.651855, 5919.910645, 6271.926758, 6644.875, 7040., 7458.620117, 7902.132812, 8372.018555, 8869.84375, 9397.272461, 9956.063477, 10548.082031, 11175.303711, 11839.821289, 12543.853516, 13289.75];
var context = new webkitAudioContext();  

function Maxim(t) {

  this.loadFile = function(filename) {
    var audio = new XMLHttpRequest();
    var source = null;
    var myAudioBuffer = null;
    var playing=false;
    var isLooping=false;
    var startTime=0;
    var endTime = 0;
    var currentSpeed = 1.0;
    var sampleLength = 1.0;
    var volume = 1.0;
    var gainNode = null;
    var filter = null;
    var analyser = null;
    var analysing = true;
    var attack = 0;
    var release = 0;
    var envTime = 0;
    var flux = 0;
    var averageSpectrumPower = 0;
    var FFTData = null;
    audio.open('GET', filename, true);
    audio.responseType = 'arraybuffer';
    audio. {
      //      alert("sound loaded"); //test
      context.decodeAudioData(audio.response, function(buffer) {
        myAudioBuffer = buffer;
        //       alert("sound decoded"); //test
        source = context.createBufferSource();
        gainNode = context.createGainNode();
        filter = context.createBiquadFilter();
        analyser = context.createAnalyser();
        filter.type = 0;
        filter.frequency.value = 20000;
        envTime = 1.0;
        source.buffer = myAudioBuffer;
        source.playbackRate.value = currentSpeed;
        source.connect(filter);
        filter.connect(gainNode);
        gainNode.gain.value = volume;
        gainNode.connect(context.destination);
        sampleLength = source.buffer.duration*1000;
      }
      );
    }

    audio.send();
    audio.isPlaying = function() {

      return playing;
    }

    audio.setLooping = function(t) {
      isLooping=t;
    }

    audio.cue = function(time) {
      if (source) {
        source.noteOff(0);
        playing=false;
      }
      startTime=time/1000;
    }

    audio.speed = function(speed) {
      if (source) {

        currentSpeed = speed;

        source.playbackRate.value = speed;
      }
    }

    audio.getLengthMs = function() {
      if (source) {
        //        alert(source.buffer.duration*1000);
        return sampleLength;
      }
    }

    audio.volume = function(gain) {

      volume=gain;

      if (playing) {
        gainNode.gain.value = volume;
      }
    }

    audio.play = function() {
      if (source) {
      if (!playing) {
        source = context.createBufferSource();
        gainNode = context.createGainNode()
        filter = context.createBiquadFilter();
        filter.type = 0;
        filter.frequency.value = 20000;
        envTime = 1.0;
        source.buffer = myAudioBuffer;
        source.playbackRate.value = currentSpeed;
        sampleLength = source.buffer.duration*1000;
        source.connect(filter);
        filter.connect(gainNode);
        gainNode.connect(context.destination);
        gainNode.gain.value = volume;
        //          alert("source connected"); //test
        if (isLooping) source.loop = true;
        //          source.loopStart = startTime/1000;
        //          source.loopEnd = source.buffer.duration;
        source.noteGrainOn(0, startTime, source.buffer.duration-startTime);
        playing=true;
      }
      if (analysing==true) {
          gainNode.connect(analyser);
          FFTData = new Float32Array(analyser.frequencyBinCount);
          analyser.getFloatFrequencyData(FFTData);
        }
    }
    }

    audio.stop = function() {
      if (source) {
        source.noteOff(0);
        playing=false;
      }
    }

    audio.setFilter = function(freq, res) {

      filter.frequency.value = freq;
      filter.Q.value = res;
    }

    audio.filterRamp = function(freq, envTime) {

      filter.frequency.cancelScheduledValues(context.currentTime);
      filter.frequency.linearRampToValueAtTime(filter.frequency.value, context.currentTime);   // THIS IS THE CHANGE FROM PREVIOUS CODE EXAMPLE
      filter.frequency.linearRampToValueAtTime(freq, context.currentTime + envTime/1000.);
    }

    //This function allows you to set the amplitude of the waveform
    audio.setAmplitude = function(amplitude) {

      gainNode.gain.cancelScheduledValues(context.currentTime);
      gainNode.gain.linearRampToValueAtTime(gainNode.gain.value, context.currentTime);
      gainNode.gain.linearRampToValueAtTime(amplitude, context.currentTime + 10);
    }

    audio.ramp = function(amplitude, envTime) {

      gainNode.gain.cancelScheduledValues(context.currentTime);
      gainNode.gain.linearRampToValueAtTime(gainNode.gain.value, context.currentTime);
      gainNode.gain.linearRampToValueAtTime(amplitude, context.currentTime + envTime/1000.);
    }
    
    audio.getAveragePower = function() {
      averageSpectrumPower = 0
      for (var i=0;i<analyser.frequencyBinCount;i++) {
      
              averageSpectrumPower+=FFTData[i]
          }
      return (100+(averageSpectrumPower/analyser.frequencyBinCount))*0.01; 
    }
    
      audio.getFlux = function() {
      flux=0;
      var FFTData1 = new Float32Array(analyser.frequencyBinCount);
      for (var i=0;i<analyser.frequencyBinCount;i++) {
      
              flux+=FFTData[i]-FFTData1[i];
          }
            FFTData1=FFTData;
      return (100+(flux/analyser.frequencyBinCount))*0.01; 
    }

    return audio;
  }
}



//This is the constructor for our waveform generator. 
Synth = function() {
  var that = this;
  this.phase = 0;
  this.context = context;
  this.node = context.createJavaScriptNode(512, 2, 2);
  this.node. { 
    that.process(audioContext)
    };
    this.sample_rate = 44100;
  this.frequency = 220;
  this.amplitude = 1.0;
  this.waveFormGain = 1.0;
  this.gainNode = context.createGainNode();
  this.delayGain = context.createGainNode();
  this.filter = context.createBiquadFilter();
  this.delay = context.createDelayNode(2);
  this.delayAmt = 0.75;
  this.delayGain.gain.value = 0.75;
  this.filter.type = 0;
  this.envTime = 1.0;
  this.isPlaying = false;
  this.waveFormSize = 514;
  this.wave = new Array(this.waveFormSize);

  for (var i = 0; i < this.waveFormSize + 1 ; i++) {

    this.wave[i]=Math.sin(i/(this.waveFormSize-2) * (Math.PI * 2));
  }
}

Synth.prototype.waveTableSize = function(size) {

  this.waveFormSize=size;
}

Synth.prototype.loadWaveTable = function(waveTable) {

  for (var i = 0; i < this.waveFormSize ; i++) {

    this.wave[i] = waveTable[i];
  }
  //  alert("all done");
}


//This function is the waveform generator's buffer method
//Hack here to create new waveforms
Synth.prototype.process = function(audioContext) {
  var data = audioContext.outputBuffer.getChannelData(0);
  for (var i = 0; i < data.length; i++) {
    var remainder;
    this.phase += (this.waveFormSize-2) / (this.sample_rate / this.frequency);
    if (this.phase >= (this.waveFormSize-3) ) this.phase -= (this.waveFormSize-2) ;
    remainder = this.phase - Math.floor(this.phase);
    data[i]=(1-remainder) * this.wave[1+Math.floor(this.phase)] + remainder * this.wave[2+Math.floor(this.phase)];
  } 
  //  console.log('data = ' + this.frequency);
}

//This function allows you to 'play' the waveform
Synth.prototype.play = function() {
  this.node.connect(this.filter);
  this.filter.connect(this.gainNode);
  this.gainNode.connect(this.context.destination);
  this.gainNode.connect(this.delay);
  this.delay.connect(this.delayGain);
  this.delayGain.connect(this.delay);
  this.delay.connect(this.context.destination);
  this.isPlaying=true;
}

//This function allows you to set the frequency of the waveform
Synth.prototype.setFrequency = function(frequency) {
  this.frequency = frequency;
}

//This function allows you to set the amplitude of the waveform
Synth.prototype.setAmplitude = function(amplitude) {

  this.gainNode.gain.cancelScheduledValues(context.currentTime);
  this.gainNode.gain.linearRampToValueAtTime(this.gainNode.gain.value, context.currentTime);
  this.gainNode.gain.linearRampToValueAtTime(amplitude, context.currentTime + 10);
}

Synth.prototype.ramp = function(amplitude, envTime) {

  this.gainNode.gain.cancelScheduledValues(context.currentTime);
  this.gainNode.gain.linearRampToValueAtTime(this.gainNode.gain.value, context.currentTime);
  this.gainNode.gain.linearRampToValueAtTime(amplitude, context.currentTime + envTime/1000.);
}

//This allows us to stop the waveform generator
Synth.prototype.stop = function() {
  this.node.disconnect();
  this.isPlaying=false;
}

Synth.prototype.setDelayTime = function(t) {

  this.delay.delayTime.value = t;

}

Synth.prototype.setWaveFormGain = function(t) {

  this.waveFormGain = t;

}

Synth.prototype.setDelayAmount = function(t) {
  
  this.delayGain.gain.value = t;

//  this.delayGain.gain.cancelScheduledValues(context.currentTime);
//  this.delayGain.gain.linearRampToValueAtTime(this.delayGain.gain.value, context.currentTime);
//  this.delayGain.gain.linearRampToValueAtTime(this.delayGain.gain.value, context.currentTime,100);

}

Synth.prototype.setFilter = function(freq, res) {

  this.filter.frequency.value = freq;
  this.filter.Q.value = res;
}

Synth.prototype.filterRamp = function(freq, envTime) {

  this.filter.frequency.cancelScheduledValues(context.currentTime);
  this.filter.frequency.linearRampToValueAtTime(this.filter.frequency.value, context.currentTime);   // THIS IS THE CHANGE FROM PREVIOUS CODE EXAMPLE
  this.filter.frequency.linearRampToValueAtTime(freq, context.currentTime + envTime/1000.);
  //  this.filter.frequency.value = freq;
  //  this.filter.Q.value = res;
}
