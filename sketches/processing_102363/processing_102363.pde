

Maxim maxim;
AudioPlayer player1; 
AudioPlayer player2;
float speedAdjust = 1.0; //music&animation speeed
boolean volumeBox = false;
float[] vol = new float[2];
float playTime = 0; //variable used to determine where the music stopped
int frRate = 60; //frameRate
PImage[] TV;
int currTV = 0;
int TVleftMargin = 48;
int TVupMargin = 165;
PImage[] buttons; //vector with buttons images
int buttonDiam = 60; //buttons diameter
PImage[] slider;
int[] sliderYpos = new int[2]; //volume sliders Y position
int sliderXpos; //speed slider X position
boolean eqBox = false;
int[] eqSlidYpos = new int[3];

PImage[] movie;
float currFrame = 0;
int movH, movW;
int zoom = 0;
boolean video = false; //true - movie, false - audioVisualisation Algorithm

String[] audioFiles; //vector of string with names of audio files
int maxNameLength = 0; //the maximul length of a string in vector

boolean play = false; //is the player1, player2 playing
boolean stop = false; //was stop button pressed?
boolean loop = true;
boolean mute = false;

boolean help = false;

boolean selectedPlayer; //true - player1, false - player2
boolean selectBox = false; //box with audio files
int xSB, ySB; //x,y coordinates of the select box

float magnify = 300; // This is how big we want the rose to be.
float phase = 0; // Phase Coefficient : this is basically how far round the circle we are going to go
float amp = 0; // Amp Coefficient : this is basically how far from the origin we are.
int elements = 128;// This is the number of points and lines we will calculate at once. 1000 is alot actually. 
float threshold = 0.35;// try increasing this if it jumps around too much
int wait=0;
float time = 0;

PImage[] lockScr;
int currLs = 0;
boolean lock = false; //if the screen is locked
boolean prelock = false; //if the user clicked on the designated zone to unlock
int xClick; //remember sa first point of the mouseDragged
String[] slname = {
  "elem", "amp", "mag"
};
int shape = 0;
float xMult = 3, yMult = 1;

void setup()
{
  size(480, 700); //my htc hd2 resolution
  background(128);

  audioFiles = new String[4]; //vector of string with names of audio files
  audioFiles[0] = "atmos1.wav";
  audioFiles[1] = "bass_snare.wav";
  audioFiles[2] = "beat1.wav";
  audioFiles[3] = "beat2.wav";
  for (int i =0; i<audioFiles.length; i++) //calculate the maximul length
  {
    if ( maxNameLength < audioFiles[i].length()) {
      maxNameLength = audioFiles[i].length();
    }
  }

  imageMode(CENTER);
  lockScr = loadImages("Lockscreen/lockscreen", ".jpg", 4);
  TV = new PImage[2];
  TV[0] = loadImage("tv_frame_1.png");
  TV[1] = loadImage("tv_frame_2.png");
  slider = loadImages("Slider/slider", ".png", 10); //load slider images
  buttons = loadImages("Buttons/button", ".png", 12); //load buttons images
  movie = loadImages("Animation_data/movie", ".jpg", 105); //load animation
  movW = movie[0].width; //resize the animation to fit the screen
  if (movW > width) movW = width - TVleftMargin;
  movH = movie[0].height;
  if (movH > height - (buttonDiam+10)) movH = height - (buttonDiam+10) - TVupMargin;

  frameRate(frRate); //set frameRate
  /* if in a second there are 60 frames, the using this we can 
   determine the aproximate millisecond the audio stopped on 
   if we have 354 frames, then we do 354 * 1000/60 and we get the 
   aproximate millisecond when the audio stopped */

  maxim = new Maxim(this);
  player1 = maxim.loadFile("Beats/beat1.wav");
  player2 = maxim.loadFile("Beats/beat2.wav");
  vol[0] = vol[1] = 1.0;
  initPlayers();

  for (int i = 0; i < sliderYpos.length; i++)
  {
    sliderYpos[i] = (int)(height - (buttonDiam + 20) - 100 * vol[i]);
  }
  sliderXpos = (int)(50 + 75 * speedAdjust);

  eqSlidYpos[0] = (int)map(elements, 50, 1000, 0, 100);
  eqSlidYpos[1] = (int)map(amp, -3, 3, 0, 100);
  eqSlidYpos[2] = (int)map(magnify, 100, 1000, 0, 100);
  for (int i = 0; i< eqSlidYpos.length; i++)
  {
    eqSlidYpos[i] = height - (buttonDiam + 70) - eqSlidYpos[i];
  }
}

void draw()
{
  colorMode(RGB);
  stroke(1);
  rectMode(CORNER);
  fill(20);
  rect(0, 0, width, height - (buttonDiam + 10));
  imageMode(CENTER);
  if (video) //show movie
  {
    image(movie[(int)currFrame], width/2, (height - (buttonDiam + 10))/2, movW + zoom, movH + zoom);
    image(TV[currTV], width/2, (height - (buttonDiam + 10))/2, width, height - (buttonDiam + 10));
    image(buttons[10], width/2, height - (buttonDiam + 37), 40, 40);
    fill(255);
    textSize(15);
    textAlign(CORNER);
    if (loop) {
      text("repeat on", 35, 70);
    }
    else {
      text("repeat off", 35, 70);
    }
  }
  else //show AudioVisual Algorithm
  {
    audioVisualAlg();
    image(TV[currTV], width/2, (height - (buttonDiam + 10))/2, width, height - (buttonDiam + 10));
    image(buttons[9], width/2, height - (buttonDiam + 37), 40, 40);
    fill(255);
    textSize(15);
    textAlign(CORNER);
    if (loop) {
      text("repeat on", 35, 70);
    }
    else {
      text("repeat off", 35, 70);
    }
    text("elements = " + elements, 35, 88);
    text("amplitude = " + amp, 35, 106);
    text("magnify = " + magnify, 35, 124);
    if (shape == 0) {
      text("shape = " + "ellipse", 35, 142);
    }
    else if (shape == 1) {
      text("shape = " + "rectangle", 35, 142);
    }
    else text("shape = " + "line", 35, 142);
    text("xMult = " + xMult, 35, 160);
    text("yMult = " + yMult, 35, 178);
  }
  fill(80);
  noStroke();
  rect(0, height - (buttonDiam + 10), width, 120);
  speedSlid();

  if (play) // is the program playing 
  {
    if (player1.isPlaying() == false || player2.isPlaying() == false)
    {
      play = false;
      playTime = 0;
    }
    else
    {
      playTime++;
      currFrame = currFrame+1*speedAdjust;
      if (currFrame >= movie.length) {
        currFrame = 0;
      }
      image(buttons[1], width/2 - 1.5 * buttonDiam - 15, height-(buttonDiam/2 + 5), buttonDiam, buttonDiam);
    }
  }
  else {
    image(buttons[0], width/2 - 1.5 * buttonDiam - 15, height-(buttonDiam/2 + 5), buttonDiam, buttonDiam);
  }
  showButtons();

  if (selectBox)
  {
    chooseSong();
  }
  if (volumeBox)
  {
    showVolumeBox();
  }
  if (eqBox)
  {
    eqSlidYpos[0] = (int)map(elements, 50, 1000, 0, 100);
    eqSlidYpos[1] = (int)map(amp, -3, 3, 0, 100);
    eqSlidYpos[2] = (int)map(magnify, 100, 1000, 0, 100);
    for (int i = 0; i< eqSlidYpos.length; i++)
    {
      eqSlidYpos[i] = height - (buttonDiam + 70) - eqSlidYpos[i];
    }
    showEqBox();
  }
  if (help) {
    showHelp();
  }
  lockScreen();
  if (lock)
  {
    imageMode(CENTER);
    tint(40);
    for (int i = 0; i < lockScr.length; i++)
    {
      if (i != currLs && i > currLs) {
        image(lockScr[i], width/4 * i, -height/10+30, width/5, height/5);
      }
      else if (i != currLs) {
        image(lockScr[i], width/4 * (i+1), -height/10+30, width/5, height/5);
      }
    }
    tint(255);
  }
}

void mousePressed()
{
  xClick = mouseX;
  if (lock && !help)
  {
    if (mouseY <= 30)
    {
      boolean change = false;
      for (int i = 0; i < lockScr.length; i++)
      {
        if (i != currLs && i > currLs && !change) {
          if (mouseX >= width/4 * i - width/10 && 
            mouseX <= width/4 * i + width/10) {
            currLs = i;
            change = true;
            println("> " + currLs);
          }
        }
        else if (i != currLs && !change) {
          if (mouseX >= width/4 * (i+1) - width/10 && 
            mouseX <= width/4 * (i+1) + width/10) {
            currLs = i;
            change = true;
            println("< " + currLs);
          }
        }
      }
      println(currLs);
    }
  }
  else if (!help)
  {
    if (mouseButton == RIGHT)
    {
      currTV++;
      if (currTV >= TV.length) currTV = 0;
    }

    else 
    {
      if (eqBox)
      {
        //if outside
        if (mouseX < width*3/4 - 52 || mouseY < height - (buttonDiam + 125) -70||
          mouseX > width*3/4 + 52 || mouseY > height - (buttonDiam + 125) + 70)
        {
          eqBox = false;
        }
      }
      else if (selectBox)
      {
        for (int i = 0; i < audioFiles.length; i++)
        {
          if (mouseX > xSB + 5 && mouseY > ySB + 3 - 21 * (audioFiles.length + 1 - i) + i * 1
            && mouseX < xSB + 5 + 12 * maxNameLength&& mouseY < ySB + 3 - 21 * (audioFiles.length + 1 - i) + i * 1 + 22)
          {
            fill(0, 0, 180, 120);
            rect(xSB + 5, ySB + 3 - 21 * (audioFiles.length + 1 - i) + i * 1, 12 * maxNameLength, 22);

            stopPlayers();
            if (selectedPlayer) {
              player1 = maxim.loadFile("Beats/" + audioFiles[i]);
            }
            else {
              player2 = maxim.loadFile("Beats/" + audioFiles[i]);
            }
            initPlayers();
          }
        }
        selectBox = false;
      }
      else  /* - Equalizer button for audioVisual - */
      if (!video && dist(mouseX, mouseY, width*3/4, height - (buttonDiam + 37)) < 15)
      {
        eqBox = true;
        selectBox = false;
        volumeBox = false;
      }
      /* - Play/Pause button */
      else if (dist(mouseX, mouseY, width/2 - 1.5 * buttonDiam - 15, height - (buttonDiam/2 + 5)) < buttonDiam/2)
      {
        playButton();
      }
      /* - Stop button - */
      else if (dist(mouseX, mouseY, width/2 - 0.5 * buttonDiam - 5, height - (buttonDiam/2 + 5)) < buttonDiam/2)
      {
        stopPlayers();
        selectBox = false;
        volumeBox = false;
        eqBox = false;
      }
      /* - Player1 songs list button - */
      else if (dist(mouseX, mouseY, width/2 - 1.5 * buttonDiam - 15 + (2 * (buttonDiam + 10)), height - (buttonDiam/2 + 5)) < (buttonDiam-10)/2)
      {
        selectedPlayer = true;
        selectBox = true;
        xSB = mouseX;
        ySB = mouseY;
        volumeBox = false;
        eqBox = false;
      }
      /* - Player2 songs list button - */
      else if (dist(mouseX, mouseY, width/2 - 1.5 * buttonDiam - 15 + (3 * (buttonDiam + 10)), height - (buttonDiam/2 + 5)) < (buttonDiam - 10)/2)
      {
        selectedPlayer = false;
        selectBox = true;
        xSB = mouseX;
        ySB = mouseY;
        volumeBox = false;
        eqBox = false;
      }
      /* - Volume Button - */
      else if (dist(mouseX, mouseY, width/2 - 1.5 * buttonDiam - 15 + (4 * (buttonDiam + 10)), height - (buttonDiam/2 + 5)) < (buttonDiam - 10)/2)
      {
        if (volumeBox) // double-click on volume button
        {
          volumeBox = false;
          mute = !mute;
          if (mute)
          {
            player1.volume(0);
            player2.volume(0);
          }
        }
        else 
        {
          player1.volume(vol[0]);
          player2.volume(vol[1]);
          mute = false;
          selectBox = false;
          volumeBox = true;
          eqBox = false;
        }
      }
      else  if (volumeBox) //volumeBox active
      {
        //if mouseX, mouseY outside box then close volumeBox
        if (mouseX < width/2 - 1.5 * buttonDiam - 15 + (4 * (buttonDiam + 10)) - 35 || mouseY < height - (buttonDiam + 70) - 65 ||
          mouseX > width/2 - 1.5 * buttonDiam - 15 + (4 * (buttonDiam + 10)) + 35 || mouseY > height - (buttonDiam + 70) + 65)
        {
          volumeBox = false;
        }
      }
      /* - Video change button - */
      else if (dist(mouseX, mouseY, width/2, height - (buttonDiam + 37)) < 20) 
      {
        video = !video; //change between movie and AudioVisual Algorithm
        selectBox = false;
        volumeBox = false;
        eqBox = false;
      }  
      /* - Loop button - */
      else if (dist(mouseX, mouseY, width/2 - 2.5 * buttonDiam - 25, height - (buttonDiam/2 + 5)) < (buttonDiam - 10)/2)
      {
        loop = !loop;
        player1.setLooping(loop);
        player2.setLooping(loop);
        selectBox = false;
        volumeBox = false;
        eqBox = false;
      }
      else {
        selectBox = false;
        volumeBox = false;
        eqBox = false;
      }
    }
  }
}

/* --- Doesn't work on Android version --- */
void keyPressed()
{
  String str = "";
  str += key;
  if (str.equals(" "))
  {
    playButton();
  }
  else if (str.equals("h")) {
    help = !help;
  }
  if (!video) {
    if (key == CODED)
    {
      if (keyCode == UP) {
        xMult += 0.5;
      }
      else if (keyCode == DOWN) {
        xMult -= 0.5;
      }
      else if (keyCode == RIGHT) {
        yMult += 0.5;
      }
      else if (keyCode == LEFT) {
        yMult -= 0.5;
      }
    }
    else {
      if (str.equals("+")) {
        zoom += 5;
        if (movie[0].width + zoom > width - TVleftMargin)
          zoom = width - TVleftMargin - movie[0].width;
        else if (movie[0].height + zoom > height - (buttonDiam+10) - TVupMargin)
          zoom = height - (buttonDiam+10) - TVupMargin - movie[0].height;
      }
      else if (str.equals("-")) {
        zoom -= 5;
        if (movie[0].width + zoom < movie[0].width/2)
          zoom = -movie[0].width/2;
        else if (movie[0].height + zoom < movie[0].height/2)
          zoom = -movie[0].height/2;
      }
      else if (str.equals(">") || str.equals(".")) {
        shape++;
        if (shape > 2) shape = 0;
      }
      else if (str.equals("<") || str.equals(",")) {
        shape--;
        if (shape < 0) shape = 2;
      }
      else if (str.equals("r"))
      {
        amp = 0; 
        elements = 128;
        magnify = 300;
      }
    }
  }
}

void mouseDragged() 
{
  if (volumeBox) {
    adjustVolume();
  }
  if (eqBox) {
    adjustEq();
  }

  adjustSpeed();

  // LockScreen :D 
  if (!lock && xClick > 0 && xClick < 50) {
    prelock = true;
  }
  else if (lock && xClick < width && xClick > width - 50) {
    prelock = true;
  }
  else {
    prelock = false;
  }
}

void mouseReleased()
{
  if (prelock && mouseX > width/2)
  {
    prelock = false;
    lock = true;
  }
  else if (prelock && mouseX < width/2)
  {
    prelock = false;
    lock = false;
  }
}

void audioVisualAlg()
{
  colorMode(HSB);
  float pow1 = player1.getAveragePower();
  float pow2 = player2.getAveragePower();
  if ((pow1+pow2)/2 >threshold && wait < 0) {
    phase += pow1 * 6 + pow2 * 4;
    wait += 10;
  }
  wait--;
  time += 0.01;
  float spacing = TWO_PI/elements; // this is how far apart each 'node' will be - study it. 
  pushMatrix();
  translate(width*0.5, height*0.5);// we translate the whole sketch to the centre of the screen, so 0,0 is in the middle.
  noFill();
  strokeWeight(2);
  for (int i = 0; i < elements;i++) {
    stroke((i*2)%255, 255, 255, 150);
    pushMatrix();
    rotate(spacing*i*phase+time);
    translate(sin(spacing*amp*i)*magnify, 0);
    rotate(-(spacing*i*phase));
    rotate(i);
    //noStroke();
    //fill((i*2)%255, 255, 255, 5);
    if (shape == 0) {
      ellipse(0, 0, i*(pow1*10)*xMult, i*(pow2*10)*yMult);
    }
    else if (shape == 1) {
      rect(0, 0, i*(pow1*10)*xMult, i*(pow2*10)*yMult);
    }
    else {
      line(0, 0, i*(pow1*10)*xMult, -i*(pow2*10)*yMult);
    }
    popMatrix();
    stroke(255, 0, 0);
  }
  popMatrix();
}

void speedSlid()
{
  // Speed slider
  textAlign(CENTER);
  textSize(12);
  fill(255);
  text("Speed", 25, height - (buttonDiam + 37) + 5);
  image(slider[6], 50, height - (buttonDiam + 37) + 5, 9, 9);
  image(slider[7], 200, height - (buttonDiam + 37) + 5, 9, 9);
  imageMode(CORNER);
  image(slider[8], 53, height - (buttonDiam + 37) - 5 + 5, sliderXpos - 53, 9);
  image(slider[9], sliderXpos, height - (buttonDiam + 37) - 5 + 5, 197 - sliderXpos, 9);
  imageMode(CENTER);
  image(slider[5], sliderXpos, height - (buttonDiam + 37) + 5, 21, 21);
}

void stopPlayers()
{
  player1.stop();
  player2.stop();
  stop = true;
  if (play) play = !play;
  playTime = 0;
  currFrame = 0;
  selectBox = false;
  volumeBox = false;
  time = 0;
}

void adjustVolume()
{
  int x = (int)(width/2 - 1.5 * buttonDiam - 15 + (4 * (buttonDiam + 10)));
  for (int i = 0; i < 2; i++) 
  {
    if (mouseX >= x-17 + i*34-11 && mouseX <= x-17+i*34+11 &&
      mouseY > sliderYpos[i] - 11 && mouseY < sliderYpos[i] + 11)
    {
      int my = constrain(mouseY, height - (buttonDiam+20) - 100, height - (buttonDiam+20));
      sliderYpos[i] = my;
      vol[0] = (height - (buttonDiam+20) - sliderYpos[0])*0.01;
      player1.volume(vol[0]);
      vol[1] = (height - (buttonDiam+20) - sliderYpos[1])*0.01;
      player2.volume(vol[1]);
    }
  }
}

void adjustSpeed()
{
  int y = (int)(height - (buttonDiam + 37) - 5);
  if (mouseX >= sliderXpos - 11 && mouseX <= sliderXpos + 11 &&
    mouseY >= y - 11 && mouseY <= y + 11)
  {
    int mx = constrain(mouseX, 50, 200);
    sliderXpos = mx;
    speedAdjust = (float)(sliderXpos - 50) / 75;
    player1.speed(speedAdjust);
    player2.speed((player2.getLengthMs()/player1.getLengthMs())*speedAdjust);
  }
}

void initPlayers()
{
  player1.setAnalysing(true);
  player1.setLooping(loop);
  player1.speed(speedAdjust);
  player1.volume(vol[0]);
  player2.setAnalysing(true);
  player2.setLooping(loop);
  player2.speed((player2.getLengthMs()/player1.getLengthMs())*speedAdjust);
  player1.volume(vol[1]);
}

void showButtons()
{
  if (player1.isPlaying() == false || player2.isPlaying() == false) {
    image(buttons[0], width/2 - 1.5 * buttonDiam - 15, height-(buttonDiam/2 + 5), buttonDiam, buttonDiam);
  }
  else {
    image(buttons[1], width/2 - 1.5 * buttonDiam - 15, height-(buttonDiam/2 + 5), buttonDiam, buttonDiam);
  }
  image(buttons[2], width/2 - 1.5 * buttonDiam - 15 + (buttonDiam + 10), height - (buttonDiam/2 + 5), buttonDiam, buttonDiam);
  for (int i = 2; i < 4; i++) //create the buttons
  {
    image(buttons[i+1], width/2 - 1.5 * buttonDiam - 15 + (i * (buttonDiam + 10)), height - (buttonDiam/2 + 5), buttonDiam - 10, buttonDiam - 10);
  }
  image(buttons[8], width/2 - 2.5 * buttonDiam - 25, height - (buttonDiam/2 + 5), buttonDiam - 10, buttonDiam - 10);

  /* Volume Button Image */
  if ((vol[0] + vol[1]) > 1.3 && !mute) {
    image(buttons[5], width/2 - 1.5 * buttonDiam - 15 + (4 * (buttonDiam + 10)), height - (buttonDiam/2 + 5), buttonDiam - 10, buttonDiam - 10);
  }
  else if ((vol[0] + vol[1]) > 0 && !mute) {
    image(buttons[6], width/2 - 1.5 * buttonDiam - 15 + (4 * (buttonDiam + 10)), height - (buttonDiam/2 + 5), buttonDiam - 10, buttonDiam - 10);
  }
  else {
    image(buttons[7], width/2 - 1.5 * buttonDiam - 15 + (4 * (buttonDiam + 10)), height - (buttonDiam/2 + 5), buttonDiam - 10, buttonDiam - 10);
  }
  if (!video) {
    image(buttons[11], width*3/4, height - (buttonDiam + 37), 30, 30);
  }
}

void chooseSong()
{
  textAlign(LEFT);
  textSize(20);
  stroke(220);
  strokeWeight(3);
  fill(150);
  int overEdge = 0;
  if (xSB + 5 +  12 * maxNameLength > width - 5)
  {
    overEdge = xSB + 5 +  12 * maxNameLength - width + 5;
  }
  rect(xSB + 5 - overEdge, ySB - 21 * (audioFiles.length + 1) + 3, 12 * maxNameLength, 21 * audioFiles.length + 3);
  for (int i = 0; i < audioFiles.length; i++)
  {
    fill(255);
    text(audioFiles[i], xSB + 8 - overEdge, ySB + 3 - 21 * (audioFiles.length - i)); 
    if (mouseX > xSB + 5 - overEdge && mouseY > ySB + 3 - 21 * (audioFiles.length + 1 - i) + i * 1
      && mouseX < xSB + 5 - overEdge + 12 * maxNameLength&& mouseY < ySB + 3 - 21 * (audioFiles.length + 1 - i) + i * 1 + 22)
    {
      strokeWeight(1);
      stroke(200);
      fill(0, 0, 180, 80);
      rectMode(CORNER);
      rect(xSB + 5 - overEdge, ySB + 3 - 21 * (audioFiles.length + 1 - i) + i * 1, 12 * maxNameLength, 21);
    }
  }
}

void adjustEq()
{
  int x = (int)(width*3/4);
  for (int i = -1; i <= 1; i++) 
  {
    if (mouseX >= x+i*34-11 && mouseX <= x+i*34+11 &&
      mouseY > eqSlidYpos[i+1] - 11 && mouseY < eqSlidYpos[i+1] + 11)
    {
      int my = constrain(mouseY, height - (buttonDiam + 70) - 100, height - (buttonDiam + 70));
      eqSlidYpos[i+1] = my;
      if ( i == -1) {
        elements = (int)map(height - (buttonDiam + 70) - eqSlidYpos[0], 0, 100, 50, 1000);
      }
      else if (i == 0) {
        amp = map(height - (buttonDiam + 70) - eqSlidYpos[1], 0, 100, -3, 3);
        println("amp = " + amp);
      }
      else if (i == 1) {
        magnify = map(height - (buttonDiam + 70) - eqSlidYpos[2], 0, 100, 100, 1000);
        println("magnify = " + magnify);
      }
    }
  }
}

void showEqBox()
{
  rectMode(CENTER);
  stroke(220);
  strokeWeight(3);
  fill(150);
  rect(width*3/4, height - (buttonDiam + 125), 105, 140);

  for (int i = -1; i < 2; i++)
  {
    int load = height - (buttonDiam + 75) - eqSlidYpos[i+1];
    pushMatrix();
    translate(width*3/4 + i * 34, height - (buttonDiam + 70));
    textSize(13);
    fill(255);
    textAlign(CENTER, CENTER);
    text(slname[i+1], 0, -118);
    rotate(-PI/2);
    imageMode(CENTER);
    image(slider[1], 0, 0);
    image(slider[2], 100, 0);
    imageMode(CORNER);
    image(slider[3], 4, -slider[3].height/2, load, slider[3].height);
    image(slider[4], load, -slider[4].height/2, 100 - load, slider[4].height);    
    popMatrix();
    imageMode(CENTER);
    image(slider[0], width*3/4 + i * 34, eqSlidYpos[i+1]);
  }
}

void showVolumeBox()
{
  rectMode(CENTER);
  stroke(220);
  strokeWeight(3);
  fill(150);
  rect(width/2 - 1.5 * buttonDiam - 15 + (4 * (buttonDiam + 10)), height - (buttonDiam + 70), 70, 130);

  pushMatrix();
  translate(width/2 - 1.5 * buttonDiam - 15 + (4 * (buttonDiam + 10)) - 17, height - (buttonDiam + 20));
  rotate(-PI/2);
  imageMode(CENTER);
  image(slider[1], 0, 0);
  image(slider[2], 100, 0);
  imageMode(CORNER);
  image(slider[3], 4, -slider[3].height/2, 100*vol[0], slider[3].height);
  image(slider[4], 100*vol[0], -slider[4].height/2, 100 - 100*vol[0], slider[4].height);
  popMatrix();

  pushMatrix();
  translate(width/2 - 1.5 * buttonDiam - 15 + (4 * (buttonDiam + 10)) + 17, height - (buttonDiam + 20));
  rotate(-PI/2);
  imageMode(CENTER);
  image(slider[1], 0, 0);
  image(slider[2], 100, 0);
  imageMode(CORNER);
  image(slider[3], 4, -slider[3].height/2, 100*vol[1], slider[3].height);
  image(slider[4], 100*vol[1], -slider[4].height/2, 100 - 100*vol[1], slider[4].height);
  popMatrix();

  imageMode(CENTER);
  image(slider[0], width/2 - 1.5 * buttonDiam - 15 + (4 * (buttonDiam + 10)) - 17, sliderYpos[0]);
  image(slider[0], width/2 - 1.5 * buttonDiam - 15 + (4 * (buttonDiam + 10)) + 17, sliderYpos[1]);
}

void lockScreen()
{
  imageMode(CENTER);
  if (prelock)
  {
    tint(50);
    image(lockScr[currLs], mouseX - width/2 + 10, height/2, width, height);
  }
  else if (lock) {
    tint(255);
    image(lockScr[currLs], width/2, height/2, width, height);
  }
  tint(255);
}

void playButton()
{
  if (!play) 
  {
    if (stop == false)
    {
      float sp2 = (player2.getLengthMs()/player1.getLengthMs())*speedAdjust;
      player1.cue((int)(playTime * 1000/frRate));
      player2.cue((int)(playTime * 1000/frRate * sp2));
    }
    else
    {
      player1.cue(0);
      player2.cue(0);
      stop = false;
    }
    player1.play();
    player2.play();
  }
  else
  {
    player1.stop();
    player2.stop();
  }
  play = !play;
  selectBox = false;
  volumeBox = false;
  eqBox = false;
}

void showHelp()
{
  rectMode(CORNER);
  stroke(3);
  fill(0, 0, 0, 150);
  rect(width/2 - 145, height/4 - 25, 290, 184);
  fill(255);
  textSize(20);
  textAlign(CENTER);
  text("Help", width/2, height/4);
  textSize(15);
  text("Right Click - change TV frame", width/2, height/4 + 18);
  textSize(17);
  text("Animation", width/2, height/4 + 43);
  textSize(15);
  text("+/- - zoom in/out", width/2, height/4 + 56);
  textSize(17);
  text("AudioVisual", width/2, height/4 + 81);
  textSize(15);
  text("UP/DOWN - increase/decrease xMult", width/2, height/4 + 99);
  text("LEFT/RIGHT - increase/decrease yMult", width/2, height/4 +117);
  text("</> - change shapes", width/2, height/4 + 135);
  text("r - reset elem, amp, mag", width/2, height/4 + 153);
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


