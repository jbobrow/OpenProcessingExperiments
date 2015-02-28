


/* @pjs preload="Background.png,ScreenHolder.png,PurplePlayBtnUP.png,PurplePauseBtnUP.png,
PurpleReplayBtnUP.png,YellowPlayBtnUP.png,YellowPauseBtnUP.png,YellowReplayBtnUP.png,
Track1GainDisplayLvl0.png,Track2GainDisplayLvl0.png,Track1GainSlider.png,Track1TempoSlider.png,
FaderSlider.png,Track2GainSlider.png,Track2TempoSlider.png"; */

//Images
PImage imgBG;
PImage imgScreenHolder;
PImage imgTrack1GainSlider;
PImage imgTrack1TempoSlider;
PImage imgFaderSlider;
PImage imgTrack2GainSlider;
PImage imgTrack2TempoSlider;
PImage imgPurplePauseBtnUP;
PImage imgPurplePlayBtnUP;
PImage imgPurpleReplayBtnUP;
PImage imgYellowPauseBtnUP;
PImage imgYellowPlayBtnUP;
PImage imgYellowReplayBtnUP;
PImage imgTrack1GainDisplay;
PImage imgTrack2GainDisplay;

//Data
Boolean blnTrack1Playing = false;
Boolean blnTrack2Playing = false;
float fltSpeedAdjust=1.0;

//Audio
Maxim maxim;
AudioPlayer Track1Player;
AudioPlayer Track2Player;

void setup() {
  size(987, 658);
  imgBG = loadImage("Background.png");
  imgScreenHolder = loadImage("ScreenHolder.png");
  imgPurplePlayBtnUP = loadImage("PurplePlayBtnUP.png");
  imgPurplePauseBtnUP = loadImage("PurplePauseBtnUP.png");
  imgPurpleReplayBtnUP = loadImage("PurpleReplayBtnUP.png");
  imgYellowPlayBtnUP = loadImage("YellowPlayBtnUP.png");
  imgYellowPauseBtnUP = loadImage("YellowPauseBtnUP.png");
  imgYellowReplayBtnUP = loadImage("YellowReplayBtnUP.png");
  imgTrack1GainDisplay = loadImage("Track1GainDisplayLvl0.png");
  imgTrack2GainDisplay = loadImage("Track2GainDisplayLvl0.png");
  imgTrack1GainSlider = loadImage("Track1GainSlider.png");
  imgTrack1TempoSlider = loadImage("Track1TempoSlider.png");
  imgFaderSlider = loadImage("FaderSlider.png");
  imgTrack2GainSlider = loadImage("Track2GainSlider.png");
  imgTrack2TempoSlider = loadImage("Track2TempoSlider.png");
  
  //Audio setup
  maxim = new Maxim(this);
  Track1Player = maxim.loadFile("VEE Electro Loop 001.wav");
  Track1Player.setLooping(true);
  Track2Player = maxim.loadFile("VEE Electro Loop 099.wav");
  Track2Player.setLooping(true);
}

void draw() {
  //Drawing in the images
  background(imgBG);
  image(imgScreenHolder,280,1);
  image(imgPurplePlayBtnUP,74,180);
  image(imgPurplePauseBtnUP,142,180);
  image(imgYellowReplayBtnUP,209,180);
  image(imgYellowPlayBtnUP,724,179);
  image(imgYellowPauseBtnUP,794,179);
  image(imgYellowReplayBtnUP,861,179);
  image(imgTrack1GainDisplay,442,275);
  image(imgTrack2GainDisplay,505,274);
  image(imgTrack1TempoSlider,24,365);
  image(imgTrack1GainSlider,441,302);
  image(imgFaderSlider,471,560);
  image(imgTrack2TempoSlider,893,365);
  image(imgTrack2GainSlider,502,301);
}

void mousePressed(){
  //SIDE A
  //These if statements are used to check the location of the mouse
  //when pressed, and determine what control they're over
  
// Side A Play Button
  if (mouseX > 74 && mouseX < 131 && mouseY > 180 && mouseY < 210) {
    Track1Player.play();
    blnTrack1Playing = true;}
//Side A Pause Button    
  if (mouseX > 140 && mouseX < 197  && mouseY > 180 && mouseY < 210) {
    Track1Player.stop();
    blnTrack1Playing = false;}
//Side A Restart Button    
  if (mouseX > 209 && mouseX < 266  && mouseY > 180 && mouseY < 210) {
    Track1Player.cue(0);}

  //SIDE B
// Side B Play Button
  if (mouseX > 724 && mouseX < 781 && mouseY > 180 && mouseY < 210) {
    Track2Player.play();
    blnTrack2Playing = true;}
//Side B Pause Button    
  if (mouseX > 790 && mouseX < 847  && mouseY > 180 && mouseY < 210) {
    Track2Player.stop();
    blnTrack2Playing = false;}
//Side B Restart Button    
  if (mouseX > 857 && mouseX < 914  && mouseY > 180 && mouseY < 210) {
    Track2Player.cue(0);}    
}

// FIN.


