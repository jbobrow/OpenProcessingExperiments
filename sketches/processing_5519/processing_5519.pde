
import ddf.minim.*; //import all data required, minim audio player, and images
import ddf.minim.signals.*; 
import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.effects.*;
import javax.sound.sampled.*;
Minim minim;
AudioPlayer[] song; //audio file array
AudioInput input; //input for oscillator
AudioOutput out; //output for volume controller

PImage bg, playb, stopb, rwdb, fwdb, vol, eq, rpt, shf, volup, voldwn, base, pglow, sglow, bglow, fglow, vglow; //image files
PFont font; 

int s = 4;

void setup(){ 
  size(600, 500, P2D); //set window size
  minim = new Minim(this); //create minim
  input = minim.getLineIn();
  out = minim.getLineOut();

  song = new AudioPlayer[6];
  song[0] = minim.loadFile("Everyone Knows.mp3"); //load audio files
  song[1] = minim.loadFile("Fireflies.mp3");
  song[2] = minim.loadFile("Russian Gun Dogs - Let You Go.mp3");
  song[3] = minim.loadFile("Longer.mp3");
  song[4] = minim.loadFile("Out Of My Mind.mp3");
  

  bg = loadImage("bg2.jpg");  //load images
  playb = loadImage("PlayPause2.png");
  pglow = loadImage("Pglow.png");
  stopb = loadImage("Stop2.png");
  sglow = loadImage("Sglow.png");
  rwdb = loadImage("SkipB2.png");
  bglow = loadImage("Bglow.png");
  fwdb = loadImage("SkipF2.png");
  fglow = loadImage("Fglow.png");
  vol = loadImage("Volume2.png");
  vglow = loadImage("Vglow.png");
  eq = loadImage("EQ2.png");
  rpt = loadImage("Loop2.png");
  shf = loadImage("Shuffle2.png");
  font = loadFont("Captureit-48.vlw");
  volup = loadImage("vol+.png");
  voldwn = loadImage("vol-.png");
  base = loadImage("revolution2.jpg");
  
  

  //player.play();
}

void draw(){
  background(0); //display background, black
  //fill(0,255,0); //(red, green, blue) colour value
  //rect(10, 10, 20, 20); //(xpos, ypos, xsize, ysize) shape value, rectangle
  //fill(255,0,0);
  //rect(10, 40, 20, 20); 
  //fill(0,0,255);
  //rect(10, 70, 20, 20);
  //saved old code for buttons as comment....just in case
  image(bg, 70, 0);
  image(base, 0, 400);
  image(playb, 3, 20, 50, 50); //display image, xpos, ypos, xsize, ysize
  image(stopb, 6, 55, 45, 45);
  image(rwdb, -12, 90, 80, 50);
  image(fwdb, -10, 125, 80, 50);

  image(vol, 70, 100);
  image(eq, 220, 125);
  image(rpt, 300, 125);
  image(shf, 400, 125);
  image(volup, 60, 140, 20, 20);
  image(voldwn, 165, 140, 20, 20);
  
  float val =  -48;

  //Progress bar
  float playPos = song[s].position ();
  float playLen = song[s].length ();
  float xpos = (playPos / playLen) * width;

  //beginnings of progress bar
  //need to call functions song.length()and song.position() //see above
  stroke(255, 200, 200, 200); 
  //noStroke();
  fill(200,0, 0, 90);
  rect(0, 185, 770, 20);
  rect(0, 185, xpos, 20);
   
  noStroke();
  rect(0, 215, 600, 200);

  stroke(200, 0, 0, 60); 
  
//code for oscillator from: http://code.compartmental.net/tools/minim/manual-minim/
  for(int i = 0; i < out.bufferSize() - 1; i++) 
  { 
    line(i, 280 + song[s].left.get(i)*50, i+1, 285 + song[s].left.get(i+1)*50); 
    line(i, 350 + song[s].right.get(i)*50, i+1, 350 + song[s].right.get(i+1)*50); 
  } 




  //println("Russian Gun Dogs - Everyone Knows");
  textFont(font, 20);
  fill(255, 240, 240);
  
  //displays track info for current song
  if (song[0].isPlaying()){
    int s = 0;
    text("Now playing:  " + song[0].getMetaData().author() + " - " + song[0].getMetaData().title(), 90, 40);
  }
  if (song[1].isPlaying()){
    int s = 1;
    text("Now playing:  " + song[1].getMetaData().author() + " - " + song[1].getMetaData().title(), 90, 40);
  }
  if (song[2].isPlaying()){
    int s = 2;
    text("Now playing:  " + song[2].getMetaData().author() + " - " + song[2].getMetaData().title(), 90, 40);
  }
  if (song[3].isPlaying()){
    int s = 3;
    text("Now playing:  " + song[3].getMetaData().author() + " - " + song[3].getMetaData().title(), 90, 40);
  }
  if (song[4].isPlaying()){
    int s = 4;
    text( "Now playing: " + song[4].getMetaData().author() + " - " + song[4].getMetaData().title(), 90, 40);
  }
  //displays track list
  text("1. " + song[0].getMetaData().author() + " - " + song[0].getMetaData().title(), 20, 240);
  text("2. " + song[1].getMetaData().author() + " - " + song[1].getMetaData().title(), 20, 280);
  text("3. " + song[2].getMetaData().author() + " - " + song[2].getMetaData().title(), 20, 320);
  text("4. " + song[3].getMetaData().author() + " - " + song[3].getMetaData().title(), 20, 360);
  text("5. " + song[4].getMetaData().author() + " - " + song[4].getMetaData().title(), 20, 400);


  //  if (!song5.isPlaying()){
  //    text(song5.getMetaData().author() + " - " + song5.getMetaData().title(), 90, 40);
  //  }

  if(mouseX>220 && mouseX<450)  //additional features - unavailable
    if(mouseY>125 && mouseY<170){
      text("this feature will ibe available in revolution.2!!!", 20, 495);
    }
    else{
      text("Alliance Media presents: Revolution.ibeta", 20, 495);
    }
    
    if(mouseX>15 && mouseX<45) //mouseover button glow effect
    if(mouseY>30 && mouseY<55) 
      image(pglow, 3, 20, 50, 50);
      
    if(mouseX>15 && mouseX<45)  //stop button
    if(mouseY>65 && mouseY<87)
      image(sglow, 6, 55, 45 , 45);
      
    if(mouseX>10 && mouseX<45)  //rewind button
    if(mouseY>100 && mouseY<125)
      image(bglow, -12, 90, 80, 50);
      
    if(mouseX>15 && mouseX<45)  //skip forwards button
    if(mouseY>140 && mouseY<160)
      image(fglow, -10, 125, 80, 50);
      
    if(mouseX>60 && mouseX<180) //volume button
    if(mouseY>125 &&mouseY<175)
       image(vglow, 70, 100);
      
    
      



  //test code for volume from: http://code.compartmental.net/tools/minim/manual-controller/
  //   if ( out.hasControl(Controller.VOLUME) )
  //{
  // map the mouse position to the range of the volume
  //  float val = map(mouseX, 0, width, 1, 0);
  // if a volume control is not available, this will do nothing
  //  out.setVolume(val); 
  // if a volume control is not available this will report zero
  //   text("The current volume is " + out.getVolume() + ".", 5, 15);
  // }
  // else
  // {
  //   text("There is no volume control for this output.", 5, 15);  //there was no volume control, use gain control instead
  // } 
 

}





void mousePressed() {
  if(mouseX>15 && mouseX<45) //co-ordinates for button area
    if(mouseY>30 && mouseY<55) 
      if (song[s].isPlaying()){  //button function, ie play/pause
        song[s].pause();
      }
    else{
      song[s].play();
    }

  if(mouseX>15 && mouseX<45)  //stop button
    if(mouseY>65 && mouseY<87){
      song[s].pause();
      song[s].rewind();
    }

  if(mouseX>15 && mouseX<45)  //rewind button
    if(mouseY>100 && mouseY<125){
      song[s].pause();
      song[s].rewind();
      s = s - 1;
      if( s == -1){
        s = 4;
      }
      song[s].play();
    }

  if(mouseX>10 && mouseX<40)  //skip forwards button
    if(mouseY>140 && mouseY<160){
      song[s].pause();
      song[s].rewind();
      s = s + 1;
      if(s == 5){
        s = 0;
      }
      song[s].play();
    }
    
     if (mouseX> 60 && mouseX<80) //volume up button
     if (mouseY> 140 && mouseY<160)
         song[s].setGain(song[s].getGain() + 5);
         
     if (mouseX> 160 && mouseX<190) //volume up button
     if (mouseY> 140 && mouseY<160)
         song[s].setGain(song[s].getGain() - 5);
         



  float pos = ((float) mouseX / width) * song[s].length();  //progress bar
  if (mouseY>185 && mouseY<205)
    song[s].cue((int)pos);


  /**
   * doubleclick taken from http://processinghacks.com/hacks/doubleclick
   * demonstrates checking for double click and extra mouse button events
   * using PApplet.mouseEvent
   * @author toxi
   */
  //void mousePressed() {
  // mouseEvent variable contains the current event information
  if (mouseEvent.getClickCount()==2) println("<double click>");
  if (mouseEvent.getButton()==MouseEvent.BUTTON3) println("<right button>");
  // this prints out the event in descriptive form
  println(mouseEvent);

  if(mouseX>20 && mouseX<500)           //playlist buttons
    if(mouseY>225 && mouseY<240)
      if (mouseEvent.getClickCount()==2){
        song[s].pause();
        song[s].rewind();
        s = 0;
        song[s].play();
      }

  if(mouseX>20 && mouseX<500)
    if(mouseY>260 && mouseY<290)
      if (mouseEvent.getClickCount()==2){
        song[s].pause();
        song[s].rewind();
        s = 1;
        song[s].play();
      }

  if(mouseX>20 && mouseX<500)
    if(mouseY>300 && mouseY<320)
      if (mouseEvent.getClickCount()==2){
        song[s].pause();
        song[s].rewind();
        s = 2;
        song[s].play();
      }

  if(mouseX>20 && mouseX<500)
    if(mouseY>340 && mouseY<360)
      if (mouseEvent.getClickCount()==2){
        song[s].pause();
        song[s].rewind();
        s = 3;
        song[s].play();
      }
          
  if(mouseX>20 && mouseX<500)
    if(mouseY>380 && mouseY<400)
      if (mouseEvent.getClickCount()==2){
        song[s].pause();
        song[s].rewind();
        s = 4;
        song[s].play();
      }

}


/* Press 'p' to play. <br />
 * Press 's' to stop. <br/>
 */
 
void keyPressed() {
  if (key == 'p' || key == 'P'){  //alternative controls for keyboard use
    if (song[s].isPlaying()){
      song[s].pause();
    }
    else{
      song[s].play();
    }
  }
  if (key == 's' || key == 'S')
    song[s].rewind();
}


void stop() {
  song[s].close();
  out.close();
  input.close();
  minim.stop();  //stops minim 
  super.stop();  //all done? soooooper :)
}















