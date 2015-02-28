
/*  Plan is to expand the DJ Tube App to have more turntable like features and Feel.
  Will Submit the this project in 2 phases for peer assignment.
  Phase 1 features 
      Beat detection bars for each wav
      For now dragging over records adjusts the speed
      Records are played independant of one another.
      stop/start buttons (as the records in phase 2 will hopefully have scratching/mixing) 
  Phase 2 possible options (will need to understand audioplayer to achieve these);
      scratching (on record icons)
      reverse play (record icons)
      Speed bar
      Choosing "records" (wavs) to play.
      Improve the look
      A DJ rating in the bottom half based on the user's attempt to synch beats (mixing)
  Dave Dooley.
*/

int tvx, tvy;
int animx, animy;
int deck1x, deck1y;
int deck2x, deck2y;
int but1x, but1y;
int but2x, but2y;
int margin = width/40;
int powerFactor = 200;

boolean deck1Playing = false;
boolean deck2Playing = false;
boolean locked = false;
boolean record1Selected = false;

float rotateDeck1 = 0;
float rotateDeck2 = 0;
float currentFrame = 0;
float speedAdjustDeck1=1.0;
float speedAdjustDeck2=1.0;
float videoSpeed=1.0;
float distanceFactor = 0.3;

PImage [] images;
PImage [] recordPlayer;
PImage TV;

Maxim maxim;
AudioPlayer player1;
AudioPlayer player2;


void setup()
{
  size(768,1024);
  imageMode(CENTER);
  images = loadImages("Animation_data/movie", ".jpg", 134);
  recordPlayer = loadImages("black-record_", ".png", 36);
  TV = loadImage("TV.png");
  maxim = new Maxim(this);
  
  background(10);
  // DDooley, Moving Deck positions into setup, no need to do it each time
  deck1x = (width/2)-recordPlayer[0].width/2-(margin*10);
  deck1y = TV.height+recordPlayer[0].height/2+margin;
  deck2x = (width/2)+recordPlayer[0].width/2+(margin*10);
  deck2y = TV.height+recordPlayer[0].height/2+margin;
  but1x = (width/2)-recordPlayer[0].width - 50;
  but1y = TV.height+recordPlayer[0].height;
  but2x = (width/2)+recordPlayer[0].width + 50;
  but2y = TV.height+recordPlayer[0].height;
  
  // Select Records maybe in the future
  //selectInput("Select a wav File to play as a Record on Deck 1:", "fileSelected");
  //interrupt();
  
  //selectInput("Select a file to process:", "fileSelected");
  player1 = maxim.loadFile("beat2.wav");
  player1.setLooping(true);
  //player1.setAnalysing(true);

  player2 = maxim.loadFile("beat2.wav");
  player2.setLooping(true);
  //player2.setAnalysing(true);
  //noLoop();
}


void draw()
{
  // DDooley Clear Screen for power buttons
  background(10);
  //float power1 = player1.getAveragePower();
  //float power2 = player2.getAveragePower();
  
  image(images[(int)currentFrame], width/2, images[0].height/2+margin, images[0].width, images[0].height);
  image(TV, width/2, TV.height/2+margin, TV.width, TV.height);
  image(recordPlayer[(int) rotateDeck1], deck1x, deck1y, recordPlayer[0].width, recordPlayer[0].height);
  image(recordPlayer[(int) rotateDeck2], deck2x, deck2y, recordPlayer[0].width, recordPlayer[0].height);
  // DDooley. Add ellipse buttons
  if (deck1Playing){
    // Draw power meter
    // Constrain power to float bewteen 0.0 and 1.0
    constrain(power1, 0.0, 1.0);
    fill(0, (power1*powerFactor), 0);
    rect(but1x-10, but1y-20, 10, -(power1*powerFactor));
    fill(255, 0, 0);
  }
  else {
    fill(0, 255, 0);
  }
  // draw the stop/ start button
  ellipse(but1x, but1y, 20, 20);
  
  if (deck2Playing){
    // Draw power meter
    // Constrain power to float bewteen 0.0 and 1.0
    constrain(power2, 0.0, 1.0);
    fill(0, (power2*powerFactor), 0);
    rect(but2x-10, but2y-20, 10, -(power2*powerFactor));
    fill(255, 0, 0);
  }
  else {
    fill(0, 255, 0);
  }
  // draw the stop/ start button
  ellipse(but2x, but2y, 20, 20);
  

  if (deck1Playing) {
    player1.speed(speedAdjustDeck1);
    rotateDeck1 += 1*speedAdjustDeck1;
    if (rotateDeck1 >= recordPlayer.length) {
      rotateDeck1 = 0;
    }
    videoSpeed = speedAdjustDeck1;
  }

  if (deck2Playing) {
    player2.speed(speedAdjustDeck2);
    rotateDeck2 += 1*speedAdjustDeck2;
    if (rotateDeck2 >= recordPlayer.length) {
      rotateDeck2 = 0;
    }
    videoSpeed = speedAdjustDeck2;
  }
  
  if (deck1Playing && deck2Playing) {    
    // Video plays to the maximum Speed
    videoSpeed = max(speedAdjustDeck1, speedAdjustDeck2);
  }
  
  if (deck1Playing || deck2Playing) {
    // No synching now
    // player1.speed(speedAdjust);
    // player2.speed((player2.getLengthMs()/player1.getLengthMs())*speedAdjust);
    currentFrame= currentFrame+1*videoSpeed;
  }
  
  if (currentFrame >= images.length) {
    currentFrame = 0;
  }
  
}


void mouseClicked()
{
  //locked = true;
  // DDooley Stop-Start now controlled by buttons
  if(dist(mouseX, mouseY, but1x, but1y) < 10){
    deck1Playing = !deck1Playing;
  }

  if (deck1Playing) {
    player1.play();
  } 
  else {
    player1.stop();
  }

  if(dist(mouseX, mouseY, but2x, but2y) < 10){
    deck2Playing = !deck2Playing;
  }

  if (deck2Playing) {
    player2.play();
  } 
  else {
    player2.stop();
  }
}

// DDooley.  Mouse Dragged will be used to alter Speed/ attempt Scratching.
// DoTo as need to know more about Maxim and Audio to play in reverse and detect the direction
void mouseDragged() {
  float distancedragged;
  //float direction;
  // if within deck, change speed.... later version will hopefully scratch!
  if (dist(pmouseX, pmouseY, deck1x, deck1y) < recordPlayer[0].width/2) {
    // If both current and previous mouse postions are within the record
    if (dist(mouseX, mouseY, deck1x, deck1y) < recordPlayer[0].width/2) {
      // get the distance 
      distancedragged = constrain((distanceFactor*(dist(pmouseX, pmouseY, mouseX, mouseY))), 0.0, 2.0);
      // For now will just use the distanceDragged to change the speed
      speedAdjustDeck1=map(distancedragged,0,2,0,2);
    } else {
      // If the final mouse position is outside the record set speed adjust back to 1
      speedAdjustDeck1=1.0;
    }
  }
  
  // if within deck, change speed.... later version will hopefully scratch!
  if (dist(pmouseX, pmouseY, deck2x, deck2y) < recordPlayer[0].width/2) {
    // If both current and previous mouse postions are within the record
    if (dist(mouseX, mouseY, deck2x, deck2y) < recordPlayer[0].width/2) {
      // get the distance 
      distancedragged = constrain((distanceFactor*(dist(pmouseX, pmouseY, mouseX, mouseY))), 0.0, 2.0);
      // For now will just use the distanceDragged to change the speed
      speedAdjustDeck2=map(distancedragged,0,2,0,2);
    } else {
      // If the final mouse position is outside the record set speed adjust back to 1
      speedAdjustDeck2=1.0;
    }
  }
  
}

void mouseReleased() {
  //locked = false;
  //deck1Playing = true;
}

// To Do, make this generic and work on file selects.
//void fileSelected(File selection) {
//  if (selection == null) {
//    println("Window was closed or the user hit cancel.  Will Use default beat1.wav.");
//    player1 = maxim.loadFile("beat1.wav");
//  } else {
//    println("User selected " + selection.getAbsolutePath());
//    player1 = maxim.loadFile(selection.getAbsolutePath());
//  }
//  player1.setLooping(true);
//  player1.setAnalysing(true);
//  record1Selected= true;
//}

//void interrupt() {
//  while (!record1Selected) {
//    delay(200);
//  }
//  loop();
//}



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


