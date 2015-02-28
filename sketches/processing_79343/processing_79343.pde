
//MOST OF CODE CHOPPED AND SAMPLED FROM MINIM AUDIO LIBRARY EXAMPLES
//CODE ''CURATED'' BY CALE WEIR

/*TO DO: make more boxes to control other samples and different types of data(volume/pan). may need to re-write entire program.
 also fix buggy selection of loop start and end points.
 */


//INSTRUCTIONS: click ANYwhere in box, press play to begin sample playback, drag mouse around to refine the size of the looping sound.
// if the sound stops playing, press s to restart it. pressing w will set the ntire samples length to loop.
import ddf.minim.*;


//box 1
float bx;
float by;

int boxSizeX = 150;
int boxSizeY = 150;
boolean overBox = false;
boolean locked = false; 
float xOffset = 0.0; 
float yOffset = 0.0; 



int loopstart; //start of loop
int loopend; // end of loop
int skip;

Minim minim;
AudioPlayer groove;
AudioMetaData meta;
WaveformRenderer waveform;

void setup() 
{
  size(displayWidth, displayHeight, P3D); //size of sketch to match screen size, render in P3D mode
  background(255);
  minim = new Minim(this); //load audio
  groove = minim.loadFile("KJAWRKH.wav"); //load sample file
  meta = groove.getMetaData(); //get metadata from file
  bx = width/2.0; //xpos of box1
  by = height/2.0; //ypos of box1
  rectMode(CENTER); //draw rectangle around central point
  textFont(createFont("Arial", 12));

  waveform = new WaveformRenderer(); //initiate waveform renderer
  groove.addListener(waveform); //start listening to audio output
}
void keyPressed()
{

  if ( key == 's' ) groove.pause(); // press s to pause playing.
  if ( key == 'p' ) {
    groove.rewind(); // press p to reset sample to beginning
    groove.loop(); //pressing p also tells the sample to loop infinitely, as there is a bug in which certain mouse pos. stop playback
  }
  if (key == 'w') groove.setLoopPoints(loopstart =0, loopend = groove.length()); //loop entire sample
}

void draw() 
{ 
  background(255);
  waveform.draw();
  stroke(0);
  line(bx+87, by+20 + groove.left.get(501)*50, bx+162, by+20 + groove.left.get(500+1)*50); //waveform display, left channel only

  float x = map(groove.position(), 0, groove.length(), bx+87, bx+162); //setting an area from playback position visualization to occur in
  line(x, by - 5, x, by+ 5); //line representingplayback position
  line(bx+87, by, bx+162, by); //line representing entire sample length

  //display metadata info
  text("file name:" + meta.fileName(), 15, 500);
  text("length: " + meta.length(), 15, 510);
  text("title: " + meta.title(), 15, 520);
  text("author: " + meta.author(), 15, 530);
  text("album: " + meta.album(), 15, 540);
  text("date: " + meta.date(), 15, 550);
  text("comment: " + meta.comment(), 15, 560);
  text("track: " + meta.track(), 15, 570);
  text("genre: " + meta.genre(), 15, 580);
  text("copyright: " + meta.copyright(), 15, 590);
  text("disc: " + meta.disc(), 15, 600);
  text("composer: " + meta.composer(), 15, 610);
  text("orchestra: " + meta.orchestra(), 15, 620);
  text("publisher: " + meta.publisher(), 15, 630);
  text("encoded: " + meta.encoded(), 15, 640);
  //control explanation controls
  text("controls", 15, 705);
  text("play: p", 15, 715);
  text("stop: s", 15, 725);
  text("loop all: w", 15, 735);

  if ( groove.isPlaying() ) //testing to see if the sample is playing using the isPlaying function
  {

    text("looping", bx+87, by-65); //if sample is playing, write "looping" into the info section of the control box
  }
  else
  {

    text("dead", bx+87, by-65); //if sample is not play, write 'dead' into info section
  }

  // Test if the cursor is over the box 
  if (mouseX > bx-boxSizeX && mouseX < bx+boxSizeY && 
  /*if the mouse x coordinate is more than the position bx minus the width of the box
   */
  mouseY > by-boxSizeX && mouseY < by+boxSizeY) {
    /* if the mouse y coordinates is more than the position by minus the height of the box
     */
    overBox = true;  
    if (!locked) { 
      stroke(0); //if the mouse is hovering over the box change it's outine colour to black
    }
  } 
  else {
    stroke(153);
    fill(153);
    overBox = false; //if mouse is not over box leave the colour alone
  }


  // Draw the box
  noFill(); //make box hollow

  rect(bx, by, boxSizeX, boxSizeY);
  text(by, bx+115, by-20); //write y position of box into control section, loop start
  text("end:", bx+87, by-20);
  text(bx, bx+115, by-35); //write x position of box into control section, loop start
  text("start:", bx+87, by-35);
}

void mousePressed() {
  if (overBox) { 
    locked = true;
    stroke(153);
  }

  else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by;
}
void mouseDragged() {
  if (locked == true) {
    groove.skip(skip);
    groove.setLoopPoints(groove.length()-mouseX, groove.length() - mouseY);
    bx = mouseX-xOffset; 
    by = mouseY-yOffset;
    skip =+ 150;
    text("<<updating frame>>", bx+90, by+65);
  }
}


void mouseReleased() {
  locked = false;
}

void stop()
{
  // always close Minim audio classes when you are done with them
  groove.close();
  // always stop Minim before exiting.
  minim.stop();

  super.stop();
}

// WAVEFORM CLASS SAMPLED FROM MINIM EXAMPLE LIBRARY


class WaveformRenderer implements AudioListener
{
  private float[] left;
  private float[] right;
  
  WaveformRenderer()
  {
    left = null; 
    right = null;
  }
  
  synchronized void samples(float[] samp)
  {
    left = samp;
  }
  
  synchronized void samples(float[] sampL, float[] sampR)
  {
    left = sampL;
    right = sampR;
  }
  
  synchronized void draw()
  {
    // we've got a stereo signal if right is not null
    if ( left != null && right != null )
    {
      noFill();
      stroke(255);
      beginShape();
      for ( int i = 0; i < left.length; i++ )
      {
        vertex(i, height/4 + left[i]*50);
      }
      endShape();
      beginShape();
      for ( int i = 0; i < right.length; i++ )
      {
        vertex(i, 3*(height/4) + right[i]*50);
      }
      endShape();
    }
    else if ( left != null )
    {
      noFill();
      stroke(255);
      beginShape();
      for ( int i = 0; i < left.length; i++ )
      {
        vertex(i, height/2 + left[i]*50);
      }
      endShape();
    }
  }
}


