
//Alūksnes mīļākā lieta | 2013-4 by Clarissa Rodrigues

void header() //for the two above lines + logo + title to appear
{
  image(title, interval, 0, 412, 107);
  image(corner, 10, 10, interval-20, interval-20);
  fill(0);
  rect(0, 101, width, 1);
  rect(0, 2, width, 1);
  
  image(stopButton, 572, 36, 35, 35);
  
  image(textButton, 620, 36, 35, 35);
}

void cursorHand () //function for the cursor to become a hand instead of an ARROW each time it is over a clickable area
{
  switch(numberOfPortraits) {
  case 0:
    if (mouseX<interval && mouseX>0 && mouseY<interval*2 && mouseY>interval) {
      cursor(HAND);
      break;
    }
  case 1:
    if (mouseX<interval && mouseX>0 && mouseY<interval*3 && mouseY>interval*2) {
      cursor(HAND);
      break;
    }
  case 2:
    if (mouseX<interval && mouseX>0 && mouseY<interval*4 && mouseY>interval*3) {
      cursor(HAND);
      break;
    }
  case 3:
    if (mouseX<interval && mouseX>0 && mouseY<interval*5 && mouseY>interval*4) {
      cursor(HAND);
      break;
    }
  case 4:
    if (mouseX<interval && mouseX>0 && mouseY<interval*6 && mouseY>interval*5) {
      cursor(HAND);
      break;
    }
  case 5:
    if (mouseX<interval && mouseX>0 && mouseY<interval*7 && mouseY>interval*6) {
      cursor(HAND);
      break;
    }
  case 6:
    if (mouseX>572 && mouseX<607 && mouseY<71 && mouseY>36) { //rollover behavior play button
      cursor(HAND);
      break;
    }
  case 7:
    if (mouseX>620 && mouseX<620+36 && mouseY<71 && mouseY>36) { //rollover behavior stop button
      cursor(HAND);
      break;
    }
  default:
    cursor(ARROW);
  }
}

void display() 
{ //to display the numbers, portraits and sentences
  image (number[0], 0, interval*1, interval, interval);  
  if ((mousePressed && mouseButton==LEFT) && (mouseX<interval && mouseX>0 && mouseY<interval*2 && mouseY>interval)) {
    image (portrait[0], interval, interval*1, 450, 643);
    image (sentence[0], interval*1+widthElements, interval*1, 450, 637);
    index = 0;
    if (index==0) {
      for (int l=1; l<tracks.length; l++) //load array of tracks
      {
        tracks[l].pause();
      }
    }
  }

  image (number[1], 0, interval*2, interval, interval);
  if ((mousePressed && mouseButton==LEFT) && (mouseX<interval && mouseX>0 && mouseY<interval*3 && mouseY>interval*2)) {
    image (portrait[1], interval, interval*1, 450, 643);
    image (sentence[1], interval*1+widthElements, interval*1, 450, 637);
    index=1;
    if ((!tracks[1].isPlaying())&&(index==1)) {
      for (int l=1; l<tracks.length; l++) //load array of tracks
      {
        tracks[l].pause();
      }
      tracks[1].rewind(); // rewind() ensures the sound starts from the beginning.
      tracks[1].play();
    }
  }


  image (number[2], 0, interval*3, interval, interval);
  if ((mousePressed && mouseButton==LEFT) && (mouseX<interval && mouseX>0 && mouseY<interval*4 && mouseY>interval*3)) {
    image (portrait[2], interval, interval*1, 450, 643);
    image (sentence[2], interval*1+widthElements, interval*1, 450, 637);
    index = 2;
    if ((!tracks[2].isPlaying())&&(index==2)) {
      for (int l=1; l<tracks.length; l++) //load array of tracks
      {
        tracks[l].pause();
      }
      tracks[2].rewind(); // rewind() ensures the sound starts from the beginning.
      tracks[2].play();
    }
  }

  image (number[3], 0, interval*4, interval, interval);
  if ((mousePressed && mouseButton==LEFT) && (mouseX<interval && mouseX>0 && mouseY<interval*5 && mouseY>interval*4)) {
    image (portrait[3], interval, interval*1, 450, 643);
    image (sentence[3], interval*1+widthElements, interval*1, 450, 637);
    index = 3;
    if ((!tracks[3].isPlaying())&&(index==3)) {
      for (int l=1; l<tracks.length; l++) //load array of tracks
      {
        tracks[l].pause();
      }
      tracks[3].rewind(); // rewind() ensures the sound starts from the beginning.
      tracks[3].play();
    }
  }

  image (number[4], 0, interval*5, interval, interval);
  if ((mousePressed && mouseButton==LEFT) && (mouseX<interval && mouseX>0 && mouseY<interval*6 && mouseY>interval*5)) {
    image (portrait[4], interval, interval*1, 450, 643);
    image (sentence[4], interval*1+widthElements, interval*1, 450, 637);
    index = 4;
    if ((!tracks[4].isPlaying())&&(index==4)) {
      for (int l=1; l<tracks.length; l++) //load array of tracks
      {
        tracks[l].pause();
      }
      tracks[4].rewind(); // rewind() ensures the sound starts from the beginning.
      tracks[4].play();
    }
  }

  image (number[5], 0, interval*6, interval, interval);
  if ((mousePressed && mouseButton==LEFT) && (mouseX<interval && mouseX>0 && mouseY<interval*7 && mouseY>interval*6)) {
    image (portrait[5], interval, interval*1, 450, 643);
    image (sentence[5], interval*1+widthElements, interval*1, 450, 637);
    index = 5;
    if ((!tracks[5].isPlaying())&&(index==5)) {
      for (int l=1; l<tracks.length; l++) //load array of tracks
      {
        tracks[l].pause();
      }
      tracks[5].rewind(); // rewind() ensures the sound starts from the beginning.
      tracks[5].play();
    }
  }
}

void stopAllSounds() //stop all the sounds by clicking in stop button
{  
  if ((mousePressed && mouseButton==LEFT)&&(mouseX>572 && mouseX<607 && mouseY<71 && mouseY>36)) 
  {
    for (int l=1; l<tracks.length; l++) //load array of tracks
    {
      tracks[l].pause();
    }
  }
}

void hideSentences() //to hide the sentences if clicking in the caption's button
{
  if ((mousePressed && mouseButton==LEFT)&&(mouseX>620 && mouseX<620+36 && mouseY<71 && mouseY>36))
  {
    //to display the png without sentence in the sentence space
    image(hideSentences, interval*1+widthElements, interval*1, 450, 637);
  }
}


