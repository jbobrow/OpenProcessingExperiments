
//Nevizuāls eksperiments | 2013-4 by Clarissa Rodrigues

void header() //for the two above lines + logo + title to appear
{
  fill(255);
  rect(0, widthNumber, width, 2);
  rect(0, 2, width, 2);
  rect(0, height-5, width, 2);

  image(header, 0, 15, width, widthNumber-25); //white bg
  image(stopButton, widthNumber+widthPortrait+margin, 39, heightButton, heightButton);
  image(textButton, widthNumber+widthPortrait+margin*1.5+heightButton, 39, heightButton, heightButton);
  image(title, widthNumber-3, 15, 425, 82);
  image(corner, 20, 26, 67, 65);
  image(logos, width-285, 31, 270, 50);
}

void cursorHand () //function for the cursor to become a hand instead of an ARROW each time it is over a clickable area
{
  switch(numberOfPortraits) {
  case 0:
    if (mouseX<widthNumber && mouseX>0 && mouseY<widthNumber+9+heightNumber && mouseY>widthNumber+9) {
      cursor(HAND);
      break;
    }
  case 1:
    if (mouseX<widthNumber && mouseX>0 && mouseY<widthNumber+9+heightNumber*2 && mouseY>heightNumber*2) {
      cursor(HAND);
      break;
    }
  case 2:
    if (mouseX<widthNumber && mouseX>0 && mouseY<widthNumber+9+heightNumber*3 && mouseY>heightNumber*3) {
      cursor(HAND);
      break;
    }
  case 3:
    if (mouseX<widthNumber && mouseX>0 && mouseY<widthNumber+9+heightNumber*4 && mouseY>heightNumber*4) {
      cursor(HAND);
      break;
    }
  case 4:
    if (mouseX<widthNumber && mouseX>0 && mouseY<widthNumber+9+heightNumber*5 && mouseY>heightNumber*5) {
      cursor(HAND);
      break;
    }
  case 5:
    if (mouseX<widthNumber && mouseX>0 && mouseY<widthNumber+9+heightNumber*6 && mouseY>heightNumber*6) {
      cursor(HAND);
      break;
    }
  case 6:
    if (mouseX<widthNumber && mouseX>0 && mouseY<widthNumber+9+heightNumber*7 && mouseY>heightNumber*7) {
      cursor(HAND);
      break;
    }

  case 7:
    //rollover behavior stop button
    if (mouseX>widthNumber+widthPortrait+margin && mouseX<widthNumber+widthPortrait+margin+heightButton 
    && mouseY<39+heightButton && mouseY>heightButton) 
    { 
      cursor(HAND);
      break;
    }
  case 8:
    //rollover behavior hide sentences button
    if (mouseX>widthNumber+widthPortrait+margin*1.5+heightButton 
      && mouseX<widthNumber+widthPortrait+margin*1.5+heightButton*2 && mouseY<39+heightButton && mouseY>heightButton) 
    { 
      cursor(HAND);
      break;
    }
  default:
    cursor(ARROW);
  }
}

void display() 
{ //to display the numbers, portraits and sentences
  image (number[0], 0, widthNumber+9, widthNumber, heightNumber);  
  if ((mousePressed && mouseButton==LEFT) && (mouseX<widthNumber && mouseX>0 
  && mouseY<(widthNumber+9)+heightNumber && mouseY>widthNumber+9)) {
    image (portrait[0], widthNumber-10, widthNumber+3, widthPortrait, widthPortrait);
    image (sentence[0], widthNumber+widthPortrait, widthNumber+2, widthSentence, widthPortrait);
    index = 0;
    if (index==0) {
      for (int l=1; l<tracks.length; l++) //load array of tracks
      {
        tracks[l].pause();
      }
    }
  }

  image (number[1], 0, widthNumber+9+heightNumber, widthNumber, heightNumber);
  if ((mousePressed && mouseButton==LEFT) && (mouseX<widthNumber && mouseX>0 
  && mouseY<(widthNumber+9)+heightNumber*2 && mouseY>widthNumber+9+heightNumber)) {
    image (portrait[1], widthNumber, widthNumber+2, widthPortrait, widthPortrait);
    image (sentence[1], widthNumber+widthPortrait, widthNumber+2, widthSentence, widthPortrait);
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


  image (number[2], 0, widthNumber+9+heightNumber*2, widthNumber, heightNumber);
  if ((mousePressed && mouseButton==LEFT) && (mouseX<widthNumber && mouseX>0 
  && mouseY<(widthNumber+9)+heightNumber*3 && mouseY>(widthNumber+9)+heightNumber*2)) {
    image (portrait[2], widthNumber, widthNumber+2, widthPortrait, widthPortrait);
    image (sentence[2], widthNumber+widthPortrait, widthNumber+2, widthSentence, widthPortrait);
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

  image (number[3], 0, widthNumber+9+heightNumber*3, widthNumber, heightNumber);
  if ((mousePressed && mouseButton==LEFT) && (mouseX<widthNumber && mouseX>0 
  && mouseY<(widthNumber+9)+heightNumber*4 && mouseY>(widthNumber+9)+heightNumber*3)) {
    image (portrait[3], widthNumber, widthNumber+2, widthPortrait, widthPortrait);
    image (sentence[3], widthNumber+widthPortrait, widthNumber+2, widthSentence, widthPortrait);
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

  image (number[4], 0, widthNumber+9+heightNumber*4, widthNumber, heightNumber);
  if ((mousePressed && mouseButton==LEFT) && (mouseX<widthNumber && mouseX>0 
  && mouseY<(widthNumber+9)+heightNumber*5 && mouseY>(widthNumber+9)+heightNumber*4)) {
    image (portrait[4], widthNumber, widthNumber+2, widthPortrait, widthPortrait);
    image (sentence[4], widthNumber+widthPortrait, widthNumber+2, widthSentence, widthPortrait);
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

  image (number[5], 0, widthNumber+9+heightNumber*5, widthNumber, heightNumber);
  if ((mousePressed && mouseButton==LEFT) && (mouseX<widthNumber && mouseX>0 
  && mouseY<(widthNumber+9)+heightNumber*6 && mouseY>(widthNumber+9)+heightNumber*5)) {
    image (portrait[5], widthNumber, widthNumber+2, widthPortrait, widthPortrait);
    image (sentence[5], widthNumber+widthPortrait, widthNumber+2, widthSentence, widthPortrait);
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

  image (number[6], 0, widthNumber+9+heightNumber*6, widthNumber, heightNumber);
  if ((mousePressed && mouseButton==LEFT) && (mouseX<widthNumber && mouseX>0 
  && mouseY<(widthNumber+9)+heightNumber*7 && mouseY>(widthNumber+9)+heightNumber*6)) {
    image (portrait[6], widthNumber, widthNumber+2, widthPortrait, widthPortrait);
    image (sentence[6], widthNumber+widthPortrait, widthNumber+2, widthSentence, widthPortrait);
    index = 6;
    if ((!tracks[6].isPlaying())&&(index==6)) {
      for (int l=1; l<tracks.length; l++) //load array of tracks
      {
        tracks[l].pause();
      }
      tracks[6].rewind(); // rewind() ensures the sound starts from the beginning.
      tracks[6].play();
    }
  }
}

void stopAllSounds() //stop all the sounds by clicking in stop button
{  
  if ((mousePressed && mouseButton==LEFT)&&
    (mouseX>widthNumber+widthPortrait+margin && mouseX<widthNumber+widthPortrait+margin+heightButton 
    && mouseY<39+heightButton && mouseY>heightButton))
  {
    for (int l=1; l<tracks.length; l++) //load array of tracks
    {
      tracks[l].pause();
    }
  }
}

void hideSentences() //to hide the sentences if clicking in the caption's button
{
  if ((mousePressed && mouseButton==LEFT)&&
    (mouseX>widthNumber+widthPortrait+margin*1.5+heightButton 
    && mouseX<widthNumber+widthPortrait+margin*1.5+heightButton*2 && mouseY<39+heightButton && mouseY>heightButton))
  {
    //to display the png without sentence in the sentence space
    image(hideSentences, widthNumber+widthPortrait, widthNumber+2, widthSentence, widthPortrait);
  }
}


