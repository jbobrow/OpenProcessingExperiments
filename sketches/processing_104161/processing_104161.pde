


// these functions are called by draw() depending on the current state

void normalProgram () {
  // state normal program. 
  // 
  // background
  if (img!=null)
    background(img);
  else
    background(0);
  // 
  // show progress bar
  buttonProgressFrame.display();
  if (!(meta==null)) 
    buttonProgressData.w = map(song.position(), 0, meta.length(), 0, width-24 );
  buttonProgressData.display();
  //
  // show pause button
  buttonPause.display();
  //
  showOtherScreenElements() ;
  //
  buttonFolder.display();
  //
  // show song list or show info table 
  if ( showSongList ) {
    //
    // show song list 
    if ( meta.author()!=null )
      headline = meta.author() + ", " + meta.album();
    else
      headline = ""; 
    showListFunction(headline, namesFiles, indexFile);
  } // if 
  else {
    // show meta data 
    showMeta() ;
  } // else 
  // 
  // song over? go next song (but not if just paused)
  try {
    if (!song.isPlaying() && !paused) 
    {
      // go To Next Song 
      command( buttonNext.commandNumber );
    }
  }
  catch (Exception e) {
    // do nothing
  }
  //
  if (showMp3Image) {
    if (mp3Image!=null) {
      image(mp3Image, width-mp3Image.width, height-mp3Image.height);
    }
  }
  //
  // yellow mouse over tool tip 
  checkMouseOver();
  //
} // func 

void stateFileManagerFunction() {
  // file manager 
  // background
  if (imgForFileManager!=null)
    background(imgForFileManager);
  else
    background(0);
  fill(255);
  if ( !pathGlobal.exists() ) {
    folderDoesExist=false;
  }
  else {
    folderDoesExist=true;
  }
  if (folderDoesExist)
    textTab ("No songs found in \n"
      + pathGlobal
      + "\nPlease use \"open folder\" to change folder. "
      + "Please note that \nthe folder itself (not only its subfolders) must contain mp3s.", 20, 20 );
  else 
    textTab ("Folder does not exist:\n"
    + pathGlobal
    + "\nPlease use \"open folder\" to change folder. "
    + "Please note that \nthe folder itself (not only its subfolders) must contain mp3s.", 20, 20 );

  buttonFolderUp.display();
  buttonHome.display();
  buttonPreviousFolder.display();
  buttonNextFolder.display();

  if (folderDoesExist)
    headline="folder contains ";
  else
    headline="folder does not exist";
  showListFunction(headline, namesFolders, -1);

  // yellow mouse over tool tip 
  checkMouseOver();
  //
} // func 

void stateDrivesFunction() {
  // Drives  
  // background
  if (imgForFileManager!=null)
    background(imgForFileManager);
  else
    background(0);
  fill(255);
  textTab ("Drives  \n"
    + "\nPlease use \"open folder\" to change folder. "
    + "Please note that\nthe folder itself (not only its subfolders) must contain mp3s.", 20, 20 );

  // showDrivesListFunction();
  headline="Drives are";
  showListFunction(headline, namesFolders, -1);

  buttonHome.display();
  buttonPreviousFolder.display();
  buttonNextFolder.display();

  // yellow mouse over tool tip 
  checkMouseOver();

  statusMsg.statusMsgShow();
  //
} // func 
//
void showHelp() {
  //  // the help screen
  final int xs = 10;   // x start-pos
  final int ys = 115;  // y start-pos
  final int yi = 16;   // y line difference 
  //
  int y = ys;
  int i = 0;

  // background
  if (img!=null)
    background(img);
  else
    background(111);

  fill(255);
  text("Help for song player ", xs, y);
  y+=yi*2;
  textTab("* Remember to set pathGlobalDefault *", xs, y);
  y+=yi*2;
  textTab("During a song ***** ", xs, y);
  y+=yi;
  textTab("H\tfor this help", xs, y);
  y+=yi;
  textTab("0..9\tsong number ", xs, y);
  y+=yi;
  textTab("f\tFFT display on/off", xs, y);
  y+=yi;
  textTab("k\tshow in explorer ", xs, y);
  y+=yi;
  textTab("I\tImage from MP3 off (shift-i) ", xs, y);
  y+=yi;
  textTab("i\tImage from MP3 on ", xs, y);
  //
  y+=yi*2;
  textTab("During folder navigation *****", xs, y);
  y+=yi;
  textTab("Mouse wheel\t scroll", xs, y);
  y+=yi;
  textTab("cursor key\t scroll", xs, y);
  y+=yi;
  textTab("Home key\tstart of list", xs, y);
  y+=yi;
  textTab("End key\tend of list", xs, y);
  y+=yi;
  textTab("Page up\t parent folder", xs, y);
  y+=yi;
}
//


