
/** 
 *   Di Lucidius Sermo (ttyrec player) by Krystof Pesek 2012
 *   relased under GPL 3.0 license
 */


color palette[];

TTYParser parser;
Terminal terminal;

float SPEED = 1;

int BEGIN_TIME;


void setup() {
  size(820, 480, P2D);
  frameRate(30);

  parser = new TTYParser("video.tty");

  imageMode(CENTER);

  textFont(loadFont("Monaco-9.vlw"));
  textMode(SCREEN);

  terminal = new Terminal(200, 80);

  palette = new color[16];
  palette[0] = color(  0, 0, 0);
  palette[1] = color(192, 0, 0);
  palette[2] = color(  0, 192, 0);
  palette[3] = color(192, 192, 0);
  palette[4] = color(  0, 0, 192);
  palette[5] = color(192, 0, 192);
  palette[6] = color(  0, 192, 192);
  palette[7] = color(255, 255, 255);
  palette[8] = color(  0, 0, 0);
  palette[9] = color(255, 0, 0);
  palette[10] = color(  0, 255, 0);
  palette[11] = color(255, 255, 0);
  palette[12] = color(  0, 0, 255);
  palette[13] = color(255, 0, 255);
  palette[14] = color(  0, 255, 255);
  palette[15] = color(192, 192, 192);
}

void draw() {
  background(0);


  for (int i = 0; i < parser.frames.size();i++) {
    DataFrame fr = (DataFrame)parser.frames.get(i);
    fr.update();
  }

  text(terminal.to_String(), 10, 20);
}

class TTYParser {
  byte[] raw;
  String[] txt;
  String filename;

  ArrayList frames;

  TTYParser(String _filename) {
    filename = _filename;
    raw = loadBytes(filename);
    //txt = loadStrings(filename);

    println(raw.length);
    createFrames();
  }

  void createFrames() {
    frames = new ArrayList();
    int len = 0;
    for (int i = 0 ; i < raw.length - 12;i += len+12) {

      byte bsec[] = {
        raw[i], raw[i+1], raw[i+2], raw[i+3]
      };
      int sec = toInt(bsec, 0); 
      byte busec[] = {
        raw[i+4], raw[i+5], raw[i+6], raw[i+7]
      };
      int usec = toInt(busec, 0);
      byte blen[] = {
        raw[i+8], raw[i+9], raw[i+10], raw[i+11]
      };
      len = toInt(blen, 0);

      String data = "";
      try {
        data = new String(raw, i+12, len, "UTF-8");
      }
      catch(Exception e) {
        ;
      }


      if (data.length()>0)
        frames.add(new DataFrame(frames.size(), sec, usec, data));
    }
    println("has frames "+frames.size());
  }

  void parse() {
    for (int i = 0 ; i < frames.size();i++) {
      DataFrame tmp = (DataFrame)frames.get(i);
    }
  }


  int toInt(byte b[], int i)
  {
    int  n = 0;
    int  f = 1;
    for (int k = 0; k < 4; k++) {
      n = n + f * bconv(b[i+k]);
      f = f * 0x100;
    }
    return n;
  }

  int bconv(byte b)
  {
    if (b < 0)
      return b + 256;
    return b;
  }
}



class DataFrame {
  int sec, usec;
  String data;
  String text;
  int id;
  double time;

  boolean written = false;

  DataFrame(int _id, int _sec, int _usec, String _data) {
    id = _id;
    sec = _sec;
    usec = _usec;
    data=_data;

    if (id==0)
      BEGIN_TIME = sec;

    time = ((double)(sec-BEGIN_TIME) + (double)usec / 1000000.0);
    time *= 1000.0 / SPEED;
  }
  
  void resetTime(){
   time = ((double)((sec-BEGIN_TIME)+millis()/1000.0) + (double)usec / 1000000.0);
    time *= 1000.0 / SPEED;
    
    
  }

  void update() {
    if (((float)millis() >= (float)time) && !written) {
      write();
      written = true;
      if(parser.frames.indexOf(this)==parser.frames.size()-1){
       for(int i = 0;i < parser.frames.size();i++){
        DataFrame d = (DataFrame)parser.frames.get(i);
       d.resetTime(); 
       d.written = false;
       }
      }
    }
  }

  void write() {
    terminal.write(data);
  }
}


