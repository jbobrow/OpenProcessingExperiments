
//EVENTS
// This is for all the mouse and keyboard related events

//Keyboard navigation (Key presses)

void keyPressed() {

  if (key == 'p' ) {

    if ( !player[counter].isPlaying() ) { 
      println("PLAY/pause");
      player[counter].play();
    } 
    else { 
      println("play/PAUSE");
      player[counter].pause();
    }/* end if */
  } /* end P key */

  if (key == 'f' ) {

    if (counter < (player.length-1) ) {
      println("SKIP FORWARD");
      player[counter].pause();
      player[counter].rewind();
      counter++;
      metadata = player[counter].getMetaData();
      player[counter].play();
    } 
    else {
      println("SKIP FORWARD");     
      /* so if the value of int counter is greater than player.length-1 (the amount of songs currently in the playlist, return to 0) */
      player[counter].pause(); 
      player[counter].rewind();
      counter = 0;
      metadata = player[counter].getMetaData();
      player[0] = minim.loadFile("kingsandqueens.mp3", 2048);
      player[counter].play();
    }
  } // end F key

    if (key == 'b' ) {

    if (counter != 0 ) {
      println("SKIP BACKWARDS");
      player[counter].pause();
      player[counter].rewind();
      counter--;
      metadata = player[counter].getMetaData();
      player[counter].play();
    } 
    else {
      println("SKIP BACKWARDS");
      player[counter].pause(); 
      player[counter].rewind();
      counter = player.length-1;
      metadata = player[counter].getMetaData();
      player[counter].play();
    }
  } // end B key

    if (key == 'q') {
    println("QUIT");
    kill();
  } // end Q key

  if (key == 's') {

    //  When the user presses S to stop, then presses P to play
    //  a split-second of audio can be heard before the rewind().
    //  This is believed to be a bug in minim surrounding the buffer.

    player[counter].pause(); 
    player[counter].rewind();
    if (counter == 0) {
      println("STOP");
      //do nothing
    } 
    else {
      println("STOP");
      //   counter--;
    }
  } //end 'S' key
} //end keyPressed

// Mouse navigation


void mousePressed() {
  if ( mouseX> (winWidth-40) ) {
    if ( (mouseY > 0)  && mouseY < 50 ) {

      //playpause
      if ( !player[counter].isPlaying() ) { 
        println("mouse PLAY/pause");
        player[counter].play();
      } 
      else { 
        println("mouse play/PAUSE");
        player[counter].pause();
      }/* end if */
    } //end Playpause

      //stop
    if ( (mouseY > 50)  && mouseY < 90 ) {
      println("mouse STOP");
      player[counter].pause(); 
      player[counter].rewind();
    } /* end stop */

    //prev
    if ( (mouseY > 100)  && mouseY < 130 ) {
      if (counter != 0 ) {
        println("mouse SKIP BACKWARDS !0");
        player[counter].pause();
        player[counter].rewind();
        counter--;
        metadata = player[counter].getMetaData();
        player[counter].play();
      } 
      else {
        println("mouse SKIP BACKWARDS 0");
        player[counter].pause(); 
        player[counter].rewind();
        counter = player.length-1;
        metadata = player[counter].getMetaData();
        player[counter].play();
      }
    }// end prev
    //next
    if ( (mouseY > 140)  && mouseY < 160 ) {
      if (counter < (player.length-1) ) {
        println("mouse SKIP FORWARD <-1");
        player[counter].pause();
        player[counter].rewind();
        counter++;
        metadata = player[counter].getMetaData();
        player[counter].play();
      } 
      else {
        println("mouse SKIP FORWARD else");     
        /* so if the value of int counter is greater than player.length-1 (the amount of songs currently in the playlist, return to 0) */
        player[counter].pause(); 
        player[counter].rewind();
        counter = 0;
        metadata = player[counter].getMetaData();
        player[0] = minim.loadFile("kingsandqueens.mp3", 2048);
        player[counter].play();
      }
    }
    //quit

    if (mouseY > 160) {

      println("QUIT");
      kill();
    } // end Q key
  }// end if mouseX
} //mousePressed  


