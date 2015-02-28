

void mode1() {
  //textSize(36);
  ////text("Mode 1", width/4, height/2);
  if (currentTime > timer) {
    mode = 2;
    timer = currentTime + 2000;  // One second
  } 
}

void mode2() {
  image(img01, 0, 0, 1000, 667);
  //textSize(36);
  ////text("Mode 2", width/4, height/2);
  if (currentTime > timer) {
    mode = 3;
    timer = currentTime + 1000;  // Two seconds
  } 
}

void mode3() {
  image(img02, 0, 0, 1000, 667);
  //textSize(36);
  ////text("Mode 3", width/4, height/2);
  if (currentTime > timer) {
    mode = 4;
    timer = currentTime + 1000;  // Half second
  } 
}

void mode4() {
  //textSize(36);
  image(img52, 0, 0, 1000, 667);
  //text("Mode 4", width/4, height/2);
  if (currentTime > timer) {
    mode = 5;
    timer = currentTime + 1000;  // Half second
  } 
}

void mode5() {
  //textSize(36);
  image(img03, 0, 0, 1000, 667);
  //text("Mode 5", width/4, height/2);
  if (currentTime > timer) {
    mode = 6;
    timer = currentTime + 1000;  // Half second
  } 
}


void mode6() {
  //textSize(36);
  image(img05, 0, 0, 1000, 667);
  //text("Mode 6", width/4, height/2);
  if (currentTime > timer) {
    mode = 7;
    timer = currentTime + 1667;  // Half second
  } 
}


void mode7() {
  //textSize(36);
  image(img06, 0, 0, 1000, 667);
  //text("Mode 7", width/4, height/2);
  if (currentTime > timer) {
    mode = 8;
    timer = currentTime + 2000;  // Half second
  } 
}

void mode8() {
  //textSize(36);
  image(img07, 0, 0, 1000, 667);
  //text("Mode 8", width/4, height/2);
   if (currentTime > timer) {
    // Set a 50/50 chance to go to Mode 1 or Mode 4
    float r = random(1.0);
    if (r > 0.5) {
     mode = 9;
     timer = currentTime + 1000;  // Half second
     } else {
      mode = 25;
      timer = currentTime + 1000;  // Three seconds
     } 
    } 
   }

//------test2-------//

  void mode9() {
  //textSize(36);
  image(img08, 0, 0, 1000, 667);
  //text("Mode 9", width/4, height/2);
  if (currentTime > timer) {
    mode = 10;
    timer = currentTime + 1000;  // Half second
  } 
}
  
  
  void mode10() {
  //textSize(36);
  image(img09, 0, 0, 1000, 667);
  //text("Mode 10", width/4, height/2);
  if (currentTime > timer) {
    mode = 11;
    timer = currentTime + 500;  // Half second
  } 
}


  void mode11() {
  //textSize(36);
  image(img10, 0, 0, 1000, 667);
  //text("Mode 11", width/4, height/2);
  if (currentTime > timer) {
    mode = 12;
    timer = currentTime + 500;  // Half second
  } 
}


  void mode12() {
  //textSize(36);
  image(img11, 0, 0, 1000, 667);
  //text("Mode 12", width/4, height/2);
   if (currentTime > timer) {
    // Set a 50/50 chance to go to Mode 1 or Mode 4
    float r = random(1.0);
    if (r > 0.5) {
     mode = 13;
     timer = currentTime + 1000;  // Half second
     } else {
      mode = 17;
      timer = currentTime + 1000;  // Three seconds
     } 
    } 
   }


  void mode13() {
  //textSize(36);
  image(img12, 0, 0, 1000, 667);
  //text("Mode 13", width/4, height/2);
  if (currentTime > timer) {
    mode = 14;
    timer = currentTime + 500;  // Half second
  } 
}


  void mode14() {
  //textSize(36);
  image(img13, 0, 0, 1000, 667);
  //text("Mode 14", width/4, height/2);
  if (currentTime > timer) {
    mode = 15;
    timer = currentTime + 2000;  // Half second
  } 
}


  void mode15() {
  //textSize(36);
  image(img15, 0, 0, 1000, 667);
  //text("Mode 15", width/4, height/2);
  if (currentTime > timer) {
    mode = 16;
    timer = currentTime + 3000;  // Half second
  } 
}

  void mode16() {
  //textSize(36);
  image(img14, 0, 0, 1000, 667);
  //text("Mode 16", width/4, height/2);
  if (currentTime > timer) {
    mode = 1;
    timer = currentTime + 500;  // Half second
  } 
}


//----test2b----//


  void mode17() {
  //textSize(36);
  image(img16, 0, 0, 1000, 667);
  //text("Mode 17", width/4, height/2);
  if (currentTime > timer) {
    mode = 18;
    timer = currentTime + 500;  // Half second
  } 
}


  void mode18() {
  //textSize(36);
  image(img17, 0, 0, 1000, 667);
  //text("Mode 18", width/4, height/2);
  if (currentTime > timer) {
    mode = 19;
    timer = currentTime + 500;  // Half second
  } 
}

  void mode19() {
  //textSize(36);
  image(img18, 0, 0, 1000, 667);
  //text("Mode 19", width/4, height/2);
  if (currentTime > timer) {
    mode = 20;
    timer = currentTime + 500;  // Half second
  } 
}

  void mode20() {
  //textSize(36);
  image(img19, 0, 0, 1000, 667);
  //text("Mode 20", width/4, height/2);
  if (currentTime > timer) {
    mode = 21;
    timer = currentTime + 2000;  // Half second
  } 
}  
  
  void mode21() {
  //textSize(36);
  image(img20, 0, 0, 1000, 667);
  //text("Mode 21", width/4, height/2);
  if (currentTime > timer) {
    mode = 22;
    timer = currentTime + 2000;  // Half second
  } 
}

  void mode22() {
  //textSize(36);
  image(img21, 0, 0, 1000, 667);
  //text("Mode 22", width/4, height/2);
  if (currentTime > timer) {
    mode = 23;
    timer = currentTime + 2000;  // Half second
  } 
}

  void mode23() {
  //textSize(36);
  image(img22, 0, 0, 1000, 667);
  //text("Mode 23", width/4, height/2);
  if (currentTime > timer) {
    mode = 24;
    timer = currentTime + 2000;  // Half second
  } 
}

  void mode24() {
  //textSize(36);
  image(img23, 0, 0, 1000, 667);
  //text("Mode 24", width/4, height/2);
  if (currentTime > timer) {
    mode = 1;
    timer = currentTime + 500;  // Half second
  } 
}


/*----Test3----*/

  void mode25() {
  //textSize(36);
  image(img24, 0, 0, 1000, 667);
  //text("Mode 25", width/4, height/2);
  if (currentTime > timer) {
    mode = 26;
    timer = currentTime + 500;  // Half second
  } 
}


  void mode26() {
  //textSize(36);
  image(img25, 0, 0, 1000, 667);
  //text("Mode 26", width/4, height/2);
  if (currentTime > timer) {
    mode = 27;
    timer = currentTime + 500;  // Half second
  } 
}


  void mode27() {
  //textSize(36);
  image(img26, 0, 0, 1000, 667);
  //text("Mode 27", width/4, height/2);
  if (currentTime > timer) {
    mode = 28;
    timer = currentTime + 500;  // Half second
  } 
}


  void mode28() {
  //textSize(36);
  image(img27, 0, 0, 1000, 667);
  //text("Mode 28", width/4, height/2);
   if (currentTime > timer) {
    // Set a 50/50 chance to go to Mode 1 or Mode 4
    float r = random(1.0);
    if (r > 0.5) {
     mode = 29;
     timer = currentTime + 1000;  // Half second
     } else {
      mode = 34;
      timer = currentTime + 1000;  // Three seconds
     } 
    } 
   }


/*----Test3b----*/


  void mode29() {
  //textSize(36);
  image(img28, 0, 0, 1000, 667);
  //text("Mode 29", width/4, height/2);
  if (currentTime > timer) {
    mode = 30;
    timer = currentTime + 500;  // Half second
  } 
}

  void mode30() {
  //textSize(36);
  image(img29, 0, 0, 1000, 667);
  //text("Mode 30", width/4, height/2);
  if (currentTime > timer) {
    mode = 31;
    timer = currentTime + 500;  // Half second
  } 
}

  void mode31() {
  //textSize(36);
  image(img30, 0, 0, 1000, 667);
  //text("Mode 31", width/4, height/2);
  if (currentTime > timer) {
    mode = 32;
    timer = currentTime + 500;  // Half second
  } 
}

  void mode32() {
  //textSize(36);
  image(img31, 0, 0, 1000, 667);
  //text("Mode 32", width/4, height/2);
  if (currentTime > timer) {
    mode = 33;
    timer = currentTime + 500;  // Half second
  } 
}

  void mode33() {
  //textSize(36);
  image(img32, 0, 0, 1000, 667);
  //text("Mode 33", width/4, height/2);
  if (currentTime > timer) {
    mode = 1;
    timer = currentTime + 500;  // Half second
  } 
}


/*----Test3a----*/

  void mode34() {
  //textSize(36);
  image(img33, 0, 0, 1000, 667);
  //text("Mode 34", width/4, height/2);
  if (currentTime > timer) {
    mode = 35;
    timer = currentTime + 500;  // Half second
  } 
}

  void mode35() {
  //textSize(36);
  image(img34, 0, 0, 1000, 667);
  //text("Mode 35", width/4, height/2);
  if (currentTime > timer) {
    mode = 36;
    timer = currentTime + 500;  // Half second
  } 
}

  void mode36() {
  //textSize(36);
  image(img35, 0, 0, 1000, 667);
  //text("Mode 36", width/4, height/2);
   if (currentTime > timer) {
    // Set a 50/50 chance to go to Mode 1 or Mode 4
    float r = random(1.0);
    if (r > 0.5) {
     mode = 37;
     timer = currentTime + 2000;  // Half second
     } else {
      mode = 45;
      timer = currentTime + 1000;  // Three seconds
     } 
    } 
   }

/*-------Test3a1--------*/

  void mode37() {
  //textSize(36);
  image(img36, 0, 0, 1000, 667);
  //text("Mode 37", width/4, height/2);
  if (currentTime > timer) {
    mode = 39;
    timer = currentTime + 2000;  // Half second
  } 
}

  /*void mode38() {
  //textSize(36);
  image(img37, 0, 0, 1000, 667);
  //text("Mode 38", width/4, height/2);
  if (currentTime > timer) {
    mode = 39;
    timer = currentTime + 2000;  // Half second
  } 
}
*/
  void mode39() {
  //textSize(36);
  image(img38, 0, 0, 1000, 667);
  //text("Mode 39", width/4, height/2);
  if (currentTime > timer) {
    mode = 40;
    timer = currentTime + 500;  // Half second
  } 
}

  void mode40() {
  //textSize(36);
  image(img39, 0, 0, 1000, 667);
  //text("Mode 40", width/4, height/2);
  if (currentTime > timer) {
    mode = 41;
    timer = currentTime + 500;  // Half second
  } 
}

  void mode41() {
  //textSize(36);
  image(img40, 0, 0, 1000, 667);
  //text("Mode 41", width/4, height/2);
  if (currentTime > timer) {
    mode = 42;
    timer = currentTime + 500;  // Half second
  } 
}

  void mode42() {
  //textSize(36);
  image(img41, 0, 0, 1000, 667);
  //text("Mode 42", width/4, height/2);
  if (currentTime > timer) {
    mode = 43;
    timer = currentTime + 500;  // Half second
  } 
}

  void mode43() {
  //textSize(36);
  image(img42, 0, 0, 1000, 667);
  //text("Mode 43", width/4, height/2);
  if (currentTime > timer) {
    mode = 44;
    timer = currentTime + 500;  // Half second
  } 
}

  void mode44() {
  //textSize(36);
  image(img43, 0, 0, 1000, 667);
  //text("Mode 43", width/4, height/2);
  if (currentTime > timer) {
    mode = 1;
    timer = currentTime + 3000;  // Half second
  } 
}


/*-------Test3ab--------*/

  void mode45() {
  //textSize(36);
  image(img44, 0, 0, 1000, 667);
  //text("Mode 45", width/4, height/2);
  if (currentTime > timer) {
    mode = 46;
    timer = currentTime + 2000;  // Half second
  } 
}


  void mode46() {
  //textSize(36);
  image(img45, 0, 0, 1000, 667);
  //text("Mode 46", width/4, height/2);
  if (currentTime > timer) {
    mode = 47;
    timer = currentTime + 2000;  // Half second
  } 
}


  void mode47() {
  //textSize(36);
  image(img46, 0, 0, 1000, 667);
  //text("Mode 47", width/4, height/2);
  if (currentTime > timer) {
    mode = 48;
    timer = currentTime + 2000;  // Half second
  } 
}

  void mode48() {
  //textSize(36);
  image(img47, 0, 0, 1000, 667);
  //text("Mode 48", width/4, height/2);
  if (currentTime > timer) {
    mode = 49;
    timer = currentTime + 1000;  // Half second
  } 
}

  void mode49() {
  //textSize(36);
  image(img48, 0, 0, 1000, 667);
  //text("Mode 49", width/4, height/2);
  if (currentTime > timer) {
    mode = 50;
    timer = currentTime + 500;  // Half second
  } 
}

  void mode50() {
  //textSize(36);
  image(img49, 0, 0, 1000, 667);
  //text("Mode 50", width/4, height/2);
  if (currentTime > timer) {
    mode = 51;
    timer = currentTime + 500;  // Half second
  } 
}

  void mode51() {
  //textSize(36);
  image(img50, 0, 0, 1000, 667);
  //text("Mode 51", width/4, height/2);
  if (currentTime > timer) {
    mode = 52;
    timer = currentTime + 500;  // Half second
  } 
}

  void mode52() {
  //textSize(36);
  image(img51, 0, 0, 1000, 667);
  //text("Mode 52", width/4, height/2);
  if (currentTime > timer) {
    mode = 1;
    timer = currentTime + 3000;  // Half second
  } 
}


