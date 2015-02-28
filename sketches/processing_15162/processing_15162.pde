
class TweetParser{
  
  BufferedReader reader;
  ArrayList<String> redString; //anger
  ArrayList<String> blueString; //sadness
  ArrayList<String> greenString; //anticipation
  ArrayList<String> yellowString; //joy
  ArrayList<String> grayString; //fear
  ArrayList<String> pinkString; //trust 
  ArrayList<String> purpleString; //surprise
  
  float redBegin = 0;
  float blueBegin = 215;
  float greenBegin = 124;
  float yellowBegin = 48;
  float grayBegin = 70;
  float pinkBegin = 323;
  float purpleBegin = 282;
  
  TweetParser(){
    //reader = createReader("redString.rtf");
    //redString = loadFile(reader);
    redString = loadStringsFromFile("redString.txt");
    blueString = loadStringsFromFile("blueString.txt");
    greenString = loadStringsFromFile("greenString.txt");
    yellowString = loadStringsFromFile("yellowString.txt");
    grayString = loadStringsFromFile("grayString.txt");
    pinkString = loadStringsFromFile("pinkString.txt");
    purpleString = loadStringsFromFile("purpleString.txt");
    
    /*reader = createReader("blueString.rtf");
    blueString = loadFile(reader);
    
    reader = createReader("greenString.rtf");
    greenString = loadFile(reader);

    reader = createReader("yellowString.rtf");
    yellowString = loadFile(reader);

    reader = createReader("grayString.rtf");
    grayString = loadFile(reader);
    
    reader = createReader("pinkString.rtf");
    pinkString = loadFile(reader);
    
    reader = createReader("purpleString.rtf");
    purpleString = loadFile(reader);*/
  }
  
  ArrayList<String> loadFile(BufferedReader reader){
    String lineIn;
    ArrayList<String> result = new ArrayList<String>();
    
    try{
      lineIn = reader.readLine();
      println(lineIn);
       result.add(lineIn);
    }catch(Exception e){ }
    
    return result;
  }
  
  ArrayList<String> loadStringsFromFile(String filename){
    ArrayList<String> result = new ArrayList<String>();
    //println(filename);
    
    String lines[] = loadStrings(filename);
    for (int i=0; i < lines.length; i++) {
      //println(lines[i]);
      result.add(lines[i]);
    }
    return result;
  }
  
  Color getUSVColor(String tweet){
    Color result;
    float h,s,b;
    float red = 0,blue = 0,green = 0,yellow = 0,gray = 0,pink = 0,purple = 0;
    
    for(String temp : redString){
      if(match(tweet, temp) != null) 
        red ++;
    }
    
    for(String temp : blueString){
      if(match(tweet, temp) != null) 
        blue ++;
    }
    
    for(String temp : greenString){
      if(match(tweet, temp) != null) 
        green ++;
    }
    
    for(String temp : yellowString){
      if(match(tweet, temp) != null) 
        yellow ++;
    }
    
    for(String temp : grayString){
      if(match(tweet, temp) != null) 
        gray ++;
    }
    
    for(String temp : pinkString){
      if(match(tweet, temp) != null) 
        pink ++;
    }
    
    for(String temp : purpleString){
      if(match(tweet, temp) != null) 
        purple ++;
    }
    
    h = redBegin * red + blueBegin * blue + greenBegin * green + yellowBegin * yellow
        + pinkBegin * pink + purpleBegin * purple;
    h /= (red + blue + green + yellow + pink + purple + 1);
    h /= 3.6f;
   
    b = grayBegin * gray;
    b /= (red + blue + green + yellow + pink + purple + gray + 1);
    b = 60 - b;
    
    s = 100 * (red + blue + green + yellow + pink + purple + gray);
    s /= tweet.length() / 4;
    s = 100 - s;
    
    if(h!=0)
      println("H:"+h+";S:"+s+";B:"+b);
    else{
      b = 90;
      h = random(0,100);
      s = 30;
    }
    result = new Color(h,s,b);
    
    return result;
  }
}

class Color{
  float h,s,v;
  
  Color(float h,float s, float v){
    this.h = h;
    this.s = s;
    this.v = v;
  }
  
  float getH(){return h;}
  float getS(){return s;}
  float getV(){return v;}
  
  void setH(float h){this.h = h;}
  void setS(float s){this.s = s;}
  void setV(float v){this.v = v;}
}


