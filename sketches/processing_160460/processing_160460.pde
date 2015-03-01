
import java.awt.EventQueue;
import java.awt.FileDialog;
import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.swing.JFileChooser;

import processing.core.PApplet;
import ddf.minim.AudioPlayer;
import ddf.minim.Minim;

private Minim minim;
private AudioPlayer player;

private String currentMp3FileName = null;
private String currentMp3ShortName = null;

private Playlist playlist = new Playlist();

// some variables for tracking the audio player
private boolean playing = false;
private int duration;

//private AudioMetaData meta;
private long timeLeft = 0;

// setup - I was going for a less frenetic music player, increase framerate for faster visualizations
public void setup() {
  size(600, 400);
  background(random(255));
  colorMode(HSB);
  rectMode(CENTER);
  ellipseMode(CENTER);
  background(random(255));
  frameRate(24);
}

// the main draw routine
public void draw() {
  if  (playing) {
    defaultVisualise();
    timeLeft = duration -  player.position();
    //System.out.println("" + player.position() + "," + player.length());
    if (timeLeft < 1000) {
      player.pause();
      background(random(255));
      playing = false; 
      playNextSong();
    }
  }
}

// a riff on the visualization shown in http://www.reddit.com/r/processing/comments/1dypdi/made_a_lil_gif_to_show_how_my_usual_process_in/
public void defaultVisualise() {
  float s1;
  float s2;
  String timeLeftStr = currentMp3ShortName + "   " + String.format("%d:%02d", timeLeft/1000/60, timeLeft/1000%60);
  text(timeLeftStr, (width-textWidth(timeLeftStr))/2, 40);
  copy(1, 1, width-2, height-2, 0, 0, width, height);

  if (frameCount % 10 == 0) {
    fill(random(255), random(255), random(255));
    text(timeLeftStr, (width-textWidth(timeLeftStr))/2, 40);
    s1 = random(width/2);
    s2 = random(height/2);
    if (frameCount % 7 == 0) {
      ellipse(random(width), random(height), s1, s2);
    }
    else if (frameCount % 23 == 0) {
      triangle(random(width), random(height), s1, s2, random(width), random(height));
    }
    else if (frameCount % 4 == 0) {
      rect(random(width), random(height), s1, s1, random(50));
    }
    else {
      rect(random(width), random(height), s1, s2, random(50));
    }
  }
}

// start playing
private boolean startPlaying(String fileName) {
  minim = new Minim(this);  // do I need to create this for each song, or can I reuse the old one?
  currentMp3FileName = fileName;
  File file = new File(currentMp3FileName);
  currentMp3ShortName = file.getName();
  player = minim.loadFile(fileName);
  //meta = player.getMetaData();  // use title and artist from mp3 tags instead of filename in display?
  playing = true; 
  player.play();
  duration = player.length();
  return playing;
}

// play the next song in the playlist
private void playNextSong() {
  String nextSongFilename = playlist.getNextSongInPlayList();
  startPlaying(nextSongFilename);
}

// callback for load playlist
public void fileSelectedInput(File inputFile) {
  if (inputFile == null) {
    PApplet.println("Window was closed or the user hit cancel.");
  } 
  else {
    PApplet.println("User selected " + inputFile.getAbsolutePath());
    playlist.loadPlayList(inputFile.getAbsolutePath());
    playNextSong();
  }
}

// callback for save playlist
public void fileSelectedOutput(File outputFile) {
  if (outputFile == null) {
    PApplet.println("Window was closed or the user hit cancel.");
  } 
  else {
    PApplet.println("User selected " + outputFile.getAbsolutePath());
    playlist.savePlayList(outputFile.getAbsolutePath());
    playNextSong();
  }
}

// callback for add file to playlist
public void fileAddInput(File fileToAdd) {
  if (fileToAdd == null) {
    PApplet.println("Window was closed or the user hit cancel.");
  } 
  else {
    PApplet.println("User selected " + fileToAdd.getAbsolutePath());
    playlist.addFileToPlayList(fileToAdd.getAbsolutePath());
    playNextSong();
  }
}

// callback for add file to playlist
public void fileAddInputs(File[] files) {
  if (files == null) {
    PApplet.println("Window was closed or the user hit cancel.");
  } 
  else {
    for (File file: files) {
      playlist.addFileToPlayList(file.getAbsolutePath());
    }
    playNextSong();
  }
}


// keyboard input
public void keyPressed() {
  //System.out.println("in keypressed..." + key);
  if (key == ' ') { // spacebar to play/pause
    if (player.isPlaying()) {
      player.pause();
      playing = false;
    }
    else {
      player.play();
      playing = true;
    }
  }
  else if (key == 'a') { // add files to playlist
    selectInputMulti("Add files to playlist:", "fileAddInputs", this);
  }
  else if (key == 'c') { // clear playlist
      playlist = new Playlist();
      player.pause();
      playing = false;
  }
  else if (key == 'f') { // add a single file to playlist
    selectInput("Add file to playlist:", "fileAddInput");
  }
  else if (key == 'l') { // load a playlist
    selectInput("Load playlist:", "fileSelectedInput", null, this);
  }
  else if (key == 'n') { // next song
    if (player != null) {
      player.pause();
    }
    background(random(255));
    playing = false;
    playNextSong();
  }
  else if (key == 's') { // save the playlist
    selectOutput("Save playlist:", "fileSelectedOutput", null, this);
  }
  // 0 for devault visualization, 1 = another one etc.
}


// this method shows a file chooser that supports input of multiple files
protected void selectInputMulti(final String prompt, final String callbackMethod, 
final Object callbackObject) {
  EventQueue.invokeLater(new Runnable() {
    public void run() {
      File[] selectedFiles = null;
      if (PApplet.useNativeSelect) {
        FileDialog dialog = new FileDialog(SimpleMusicPlayer.this.frame, prompt, FileDialog.LOAD);
        dialog.setMultipleMode(true);
        dialog.setVisible(true);
        selectedFiles = dialog.getFiles();
      }
      else {
        JFileChooser chooser = new JFileChooser();
        chooser.setMultiSelectionEnabled(true);
        chooser.setDialogTitle(prompt);
        int result = -1;
        result = chooser.showOpenDialog(SimpleMusicPlayer.this);
        if (result == 0) {
          selectedFiles = chooser.getSelectedFiles();
        }
      }
      selectCallbackMulti(selectedFiles, callbackMethod, callbackObject);
    }
  }
  );
}

// this method drives the callback for a file chooser that supports input of multiple files
private void selectCallbackMulti(File[] selectedFiles, String callbackMethod, 
Object callbackObject) {
  try {
    Class<?> callbackClass = callbackObject.getClass();
    Method selectMethod = callbackClass.getMethod(callbackMethod, 
    new Class[] { 
      File[].class
    }
    );
    selectMethod.invoke(callbackObject, new Object[] { 
      selectedFiles
    }
    );
  }
  catch (IllegalAccessException iae) {
    System.err.println(callbackMethod + "() must be public");
  }
  catch (InvocationTargetException ite) {
    ite.printStackTrace();
  }
  catch (NoSuchMethodException nsme) {
    System.err.println(callbackMethod + "() could not be found");
  }
}

import java.util.ArrayList;
import java.util.List;

class Playlist {

  private PApplet parent = null;

  private int nextSong = -1;

  private List<String> songs = new ArrayList<String>();

  public Playlist() {
    this.parent  = null;
  }

  public Playlist(PApplet parent) {
    this.parent  = parent;
  }

  void setup() {
  } 

  public void addFileToPlayList(String fileName) {
    songs.add(fileName);
  }

  public String getNextSongInPlayList() {
    String result = null;
    if (size() > 0) {
      if (nextSong == -1) {
        nextSong = 0;
      }
      if (nextSong >= size()) {
        nextSong = 0;
      }
      result = songs.get(nextSong);
      nextSong++;
    }
    return result;
  }

  public void savePlayList(String fileName) {
    String[] songArray = songs.toArray(new String[songs.size()]);
    parent.saveStrings(fileName, songArray);
  }


  public int size() {
    return songs.size();
  }


  public int loadPlayList(String fileName) {
    String[] data = parent.loadStrings(fileName);

    if (data.length > 0) {
      songs = new ArrayList<String>();
      for (String song: data) {
        songs.add(song);
      }
    }
    else {
      System.out.println("no data loaded for file = " + fileName);
    }
    return data.length;
  }


  public List<String> getSongs() {
    return songs;
  }


  public void setSongs(List<String> songs) {
    this.songs = songs;
  }
}



