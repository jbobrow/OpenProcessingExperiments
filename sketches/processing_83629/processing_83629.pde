
class Soundspot {
  float x;
  float y;
  float w;
  float h;
  AudioSnippet voice;
  int activeTime;         // time when spot becomes activated
  boolean firstTrigger;   // used to suppress sound until spot is active
  int triggerTime;        // when spot is triggered with mouseover (once active)
  boolean nowPlaying;     // true when clip is actually playing; switches to false when done
  boolean mouseOn;        // used so doesn't continuously play if mouse hovering

  Soundspot(float _x, float _y, AudioSnippet _voice, int _activeTime) {
    x = _x;
    y = _y;
    w = width/numCols;
    h = height/numRows;
    voice = _voice;
    activeTime = _activeTime;
    firstTrigger = false;
    triggerTime = 0;
    nowPlaying = false;
    mouseOn = false;
  }

  void trigger() {
    voice.play();
    triggerTime = millis();
    nowPlaying = true;
//    firstTrigger = true; // relevant first time only
  }

  void silentDisplay() {
    noFill();
    stroke(map(millis() - activeTime, 0, 2000, 255, 0));
    rect(x, y, w, h);
  }

  void display() {
    noFill();
    stroke(map(millis() - triggerTime, 0, 2000, 255, 0));
    rect(x, y, w, h);
  }
}


