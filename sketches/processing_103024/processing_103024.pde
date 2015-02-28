



var context = new webkitAudioContext();
var audioStreamSource = {};



(function () { 
 
  navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
  
  window.URL = window.URL || window.webkitURL || window.mozURL || window.msURL; 

  function successCallback(stream) {
      
      // context defined in maxim    
      audioStreamSource = context.createMediaStreamSource( stream );
      audioStreamSource.available = true;
   }

   function errorCallback(error) {
      alert('Unable to get webcam stream.');
   }
  
  if (navigator.getUserMedia) {
     navigator.getUserMedia({video: false, audio:true}, successCallback, errorCallback);
  } else {
     alert('Native mic streaming (getUserMedia) not supported in this browser.');
  }
  

}());




function Maxim(t) {

  this.loadStream = function(stream) {

    var audio = {};

    var source = null;
    var playing = true;
    var volume = 1.0;
    var gainNode = null;
    var filter = null;
    var analyser = null;
    var analysing = true;
    var flux = 0;
    var averageSpectrumPower = 0;
    var FFTData = null;
    var recording = false;
    var recordingNode = null, recordBuffer = null;

    console.log("context.sampleRate " + context.sampleRate);

    recordBuffer = context.createBuffer(2, 1, context.sampleRate);

    function appendBuffer(buffer1, buffer2) {
      var numberOfChannels = Math.min(buffer1.numberOfChannels, buffer2.numberOfChannels);
      var tmp = context.createBuffer(numberOfChannels, (buffer1.length + buffer2.length), buffer1.sampleRate);
      for (var i = 0; i < numberOfChannels; i++) {
        var channel = tmp.getChannelData(i);
        channel.set(buffer1.getChannelData(i), 0);
        channel.set(buffer2.getChannelData(i), buffer1.length);
      }
      return tmp;
    }

    source = stream;
    gainNode = context.createGainNode();

    recordingNode = context.createScriptProcessor(4096, 2, 2);

    var i = 1;

    recordingNode. = function(e) {
      
      e.outputBuffer.getChannelData(0).set(e.inputBuffer.getChannelData(0));
      e.outputBuffer.getChannelData(1).set(e.inputBuffer.getChannelData(1));

      if (!recording)
        return;
      console.log("onaudioprocess - recording - " + i++);
      var tempBuffer = appendBuffer(recordBuffer, e.inputBuffer);
      recordBuffer = tempBuffer;
      
    }

    analyser = context.createAnalyser();

    analyser.fftSize = 2048;

    source.connect(recordingNode);

    recordingNode.connect(gainNode);

    gainNode.gain.value = volume;
    gainNode.connect(context.destination);

    gainNode.connect(analyser);

    FFTData = new Float32Array(analyser.getByteFrequencyData);
    analyser.getFloatFrequencyData(FFTData);

    audio.play = function() {
      if (analysing == true && playing) {
        gainNode.connect(analyser);
        FFTData = new Float32Array(analyser.frequencyBinCount);
        analyser.getFloatFrequencyData(FFTData);
      }
    }

    audio.startRecording = function() {
      recordBuffer = context.createBuffer(2, 1, context.sampleRate);
      recording = true;
    }

    audio.stopRecording = function() {
      recording = false;
    }

    audio.playRecording = function() {

      var recordSource = context.createBufferSource();
      recordSource.buffer = recordBuffer;
      recordSource.connect(gainNode);
      recordSource.noteGrainOn(0, 0, recordSource.buffer.duration);

    }
    

    audio.getAveragePower = function() {
      if (source) {
        averageSpectrumPower = 0
        for (var i = 0; i < analyser.frequencyBinCount; i++) {

          averageSpectrumPower += FFTData[i]
        }
        return (100 + (averageSpectrumPower / analyser.frequencyBinCount)) * 0.01;
      }
    }
    audio.getPowerSpectrum = function() {
      if (source) {
        return FFTData;
      }
    }

    audio.getFlux = function() {
      if (source) {
        flux = 0;
        var FFTData1 = new Float32Array(analyser.frequencyBinCount);
        for (var i = 0; i < analyser.frequencyBinCount; i++) {

          flux += FFTData[i] - FFTData1[i];
        }
        FFTData1 = FFTData;
        return (100 + (flux / analyser.frequencyBinCount)) * 0.01;
      }
    }

    return audio;
  }
}




//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


//When running on the iPad or iPhone, you won't see anything unless you tap the screen.
//If it doesn't appear to work first time, always try refreshing the browser.

Maxim maxim;
AudioPlayer player;
float go;
boolean playit = false;

boolean isRecording = false;

boolean loadedStream = false;

int elements = 20;// This is the number of points and lines we will calculate at once. 1000 is alot actually. 

void setup() {
  //The size is iPad Portrait.
  //If you want landscape, you should swap the values.
  size(768, 1024); 

  frameRate(25); // this is the framerate. Tweak for performance
  maxim = new Maxim(this);
  /*
  player = maxim.loadFile("mybeat.wav");
  player.setLooping(true);
  player.setAnalysing(true);
  */
  noStroke();
  rectMode(CENTER);
  background(0);
  colorMode(HSB);
}

void draw() {

  if (!audioStreamSource.available) return;
  
  if (!loadedStream) {
    player = maxim.loadStream(audioStreamSource);
    loadedStream = true;
  }
  
  if (true) {

    player.play();
    float power = player.getAveragePower();
    //console.log(power);
    if (power < 0 ) {power = 0.0;}
    go+=power*50;
    
    translate(width/2, height/2);// we translate the whole sketch to the centre of the screen, so 0,0 is in the middle.
    for (int i = elements; i > 0;i--) {
      fill((5*i+go)%5, power*512, 255); // this for loop calculates the x and y position for each node in the system and draws a line between it and the next.
      ellipse((mouseX-(width/2))*(elements-i)/elements, (mouseY-(height/2))*(elements-i)/elements, width*1.5/elements*i, height*1.5/elements*i);
    }
    //if (mousePressed){
    //player.speed((float) mouseX / (float) width);
    //}
  }
}

void mousePressed() {
  
  isRecording = !isRecording;

  if (isRecording) {

    player.startRecording();
  } 
  else {

    player.stopRecording();
    player.playRecording();
  }
}



