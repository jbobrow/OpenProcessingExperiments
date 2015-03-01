
//import processing.opengl.*;

ArrayList<Sentence> sentence_list;
ArrayList<String>   text_lines;
int FONTSIZE=12;

void setup(){
 size(800,800);
 background(255);
 ellipseMode(RADIUS);
 colorMode(HSB,100);
 smooth();
 textSize(FONTSIZE);
 sentence_list = new ArrayList<Sentence>();
 sentence_list.add( new Sentence( "" ) );
 text_lines = new ArrayList<String>();
 frameRate(30);
}

void draw(){
  
  
  background(100,44,30);  
  for( int i=0; i<sentence_list.size(); ++i ){
    pushMatrix();
    Sentence sen = (Sentence)sentence_list.get(i);
    sen.draw();
    popMatrix();
  }

  for( int i=0; i<text_lines.size(); i++ ){
    if( i > 7 ){ break; }
    fill( 0, 0, 100-max(0,i-4)*20 );
    int idx = text_lines.size()-1-i;
    text( text_lines.get(idx), 10, height-10-(i+1)*(int)(FONTSIZE*1.2), width-10, height-10 );
  }  
}

void add_char( char c ){
  if( ( c == RETURN ) || ( c == ENTER ) ){
    sentence_list.add( new Sentence( "" ) );
    return;
  }
  Sentence curr = (Sentence)sentence_list.get( sentence_list.size()-1 );
  if( c == BACKSPACE ){ 
    curr.remove();
  } else {
    curr.add( c );
  }
  update_lines();
}

void update_lines(){
 text_lines.clear();
 for( int i=0; i<sentence_list.size(); ++i ){
    String str = sentence_list.get(i).getString();
    String word = "";
    String line = "";
    if( str.length() == 0 ){ continue; }
    while( str.length() != 0 ){
      if( str.charAt(0) == ' ' ){
        line = line + " " + word;
        word = "";
        str = str.substring(1);        
        continue;
      }
      word = word + str.charAt(0);
      str = str.substring(1);
      if( textWidth( line+" "+word ) > width-20 ){
        text_lines.add( line );
        line = "";
      }
    }
    line = line + " " + word;
    text_lines.add( line );
  }
}
int color_counter = 0;
color nextColor(){
  color c = color(100*5/14*color_counter%100, 50, 100 );
  color_counter++;
  return( c );
}

class CharElement {
  // This is shape element related to a character
  CharElement( char c_, color col_ ){
    c = c_;
    if( c >= 'a' ){ // lower case
      scale = 30 + int( (float(int(c))*5/14*15) )%10;
      angle = 4.0;
    } else { // upper case
      scale = 40 + int( (float(int(c))*5/14*15) )%10;
      angle = 6.0;
    }
    col   = col_;
    draw_counter = 0;
  }  
  public void draw(){
    int l = (int)( scale * min( (float)draw_counter/max_count, 1.0 ) ); 
    fill( col );
    noStroke();
    arc( 0, 0, l, l, radians( -angle/2 ), radians( angle/2 ) );
    
    draw_counter++;
  }
  public  float getScale(){ return scale; }
  public  float getAngle(){ return angle; }

  private char  c;
  private float scale;
  private float angle;
  private color col;
  private int   draw_counter;
  
  private final int max_count = 30;
}

class WordElement {
  // This is shape element related to a word, which has some characters as array of CharElement
  WordElement( String w_, color col_ ){
    w   = w_;
    col = col_;
    dir = random(1.0) > 0.5 ? 1.0 : -1.0;
    String w_lower = w.toLowerCase();
    chars = new ArrayList< CharElement >();
    for( int i=0; i<w.length(); ++i ){
      chars.add( new CharElement( w_lower.charAt(i), col ) );
    }
  }
  public void add( char c_ ){
    w = w + c_;
    chars.add( new CharElement( c_, col ) );
  }
  public void remove(){
    if( !chars.isEmpty() ){
      w = w.substring( 0, w.length()-1 );
      chars.remove( chars.size()-1 );
    }
  }
  public boolean isEmpty(){
    return chars.isEmpty();
  }
  public void draw(){
    /*
    float arc_angle = degrees(atan2( screenY(1,0)-screenY(0,0), screenX(1,0)-screenX(0,0) ) );
    float cnt_angle = degrees(atan2( height/2-screenY(0,0), width/2-screenX(0,0) ) );
    float diff = arc_angle - cnt_angle;
    if( diff > 180.0 )  diff -= 180.0;
    if( diff < -180.0 ) diff += 180.0;
    println( diff );
    float dir = diff > 0.0 ? -1.0 : 1.0;
    */
    for( int i=0; i<chars.size(); i++ ){
      CharElement ce = (CharElement)chars.get(i);
      if( i != 0 ){
        rotate( radians( dir*( ce.getAngle()/2 ) ) );
        translate( 0, 0, 5 );
      }
      ce.draw();
      if( i != chars.size()-1 ){
        rotate( radians( dir*( ce.getAngle()/2+5.0 ) ) );
      } else {
        translate( ce.getScale(), 0 );
      }    
    }
  }

  public String getString(){ return w; }
  
  private String w;
  private ArrayList< CharElement > chars;
  private color col;
  private float dir;
}

class Sentence {
  Sentence(){
    words = new ArrayList< WordElement >();
  }    
  Sentence( String s_ ){
    this();
    s = s_;
    String[] ss = splitTokens( s, " " );
    for( int i=0; i<ss.length; i++ ){
      words.add( new WordElement( ss[i], nextColor() ) );
    }
    if( words.isEmpty() ) words.add( new WordElement( "", nextColor() ) );
    int x_ = int( random(width/2) - width/4 );
    int y_ = int( random(height/2) - width/4 );
    t = -1*atan2( y_, -x_ );
    x = x_ + width/2;
    y = y_ + height*2/5;  
  }

  public void add( char c ){
    WordElement we = (WordElement)(words.get( words.size()-1 ));
    if( c==' ' ){
      if( we.isEmpty() ) return; // If last WordElement has no CharElements, do nothing.
      words.add( new WordElement( "", nextColor() ) ); 
    } else {
      we.add( c ) ;
    }
    s += str(c);
  }

  public void remove(){
    WordElement we = (WordElement)(words.get( words.size()-1 ));
    if( s.isEmpty() ) return;
    char last = s.charAt( s.length()-1 );
    s = s.substring( 0, s.length()-1 );
    if( last != ' ' ){
      we.remove();
      return;
    }
    if( s.charAt( s.length()-1 ) == ' ' ) return;
    if( we.isEmpty() ){
      words.remove( words.size()-1 );
    }
  }

  public void draw(){
    translate( x, y );
    rotate( t );
    for( int i=0; i<words.size(); i++ ){
      WordElement we = (WordElement)words.get(i);
      we.draw();
    }
  }

  public String getString(){ return s; }
  
  private ArrayList< WordElement > words;
  private String s;   
  private int   x;
  private int   y;
  private float t;
}

BufferedReader file_reader = null;
String line_rest = "";
int    last_frame = 0;
int    load_speed = 3;
boolean punk_mark = false;

void fileSelected( File selected ){
  if( selected == null ){
      return;
  }
  file_reader = createReader( selected.getAbsolutePath() );
  line_rest = "";
}

void readLine(){
  if( frameCount - last_frame < load_speed ){ return; }
  if( file_reader == null ){ return; }
  if( line_rest == null ){ return; }
  if( line_rest.length() == 0 ){
    add_char( RETURN );
    try{
      line_rest = file_reader.readLine();
    } catch (IOException e){
      e.printStackTrace();
      line_rest = null;
      file_reader = null;
    }
  } else {
    if( punk_mark && line_rest.charAt(0)==' ' ){
      add_char( RETURN );
      punk_mark = false;
    } else {
      add_char( line_rest.charAt(0) );
    }
    if( line_rest.charAt(0) == '.' ){ punk_mark = true; }
    // else if( line_rest.charAt(0) == ',' ){ punk_mark = true; }
    else if( line_rest.charAt(0) == '?' ){ punk_mark = true; }
    else if( line_rest.charAt(0) == '!' ){ punk_mark = true; }
    else { punk_mark = false; }
    line_rest = line_rest.substring( 1 );
  }
  last_frame = frameCount;
}

void keyPressed() {
  if( key==CODED ){
    if( keyCode == CONTROL ){
      sentence_list.clear();
      sentence_list.add( new Sentence( "" ) );
      text_lines.clear();
    }
  } else if( key == TAB ){
    selectInput( "Select text file for display", "fileSelected" );
  } else if( key == ESC ){
    exit();
  } else {
    add_char( key );
  }
}int color_counter = 0;
color nextColor(){
  color c = color(100*5/14*color_counter%100, 50, 100 );
  color_counter++;
  return( c );
}

class CharElement {
  // This is shape element related to a character
  CharElement( char c_, color col_ ){
    c = c_;
    if( c >= 'a' ){ // lower case
      scale = 30 + int( (float(int(c))*5/14*15) )%10;
      angle = 4.0;
    } else { // upper case
      scale = 40 + int( (float(int(c))*5/14*15) )%10;
      angle = 6.0;
    }
    col   = col_;
    draw_counter = 0;
  }  
  public void draw(){
    int l = (int)( scale * min( (float)draw_counter/max_count, 1.0 ) ); 
    fill( col );
    noStroke();
    arc( 0, 0, l, l, radians( -angle/2 ), radians( angle/2 ) );
    
    draw_counter++;
  }
  public  float getScale(){ return scale; }
  public  float getAngle(){ return angle; }

  private char  c;
  private float scale;
  private float angle;
  private color col;
  private int   draw_counter;
  
  private final int max_count = 30;
}

class WordElement {
  // This is shape element related to a word, which has some characters as array of CharElement
  WordElement( String w_, color col_ ){
    w   = w_;
    col = col_;
    dir = random(1.0) > 0.5 ? 1.0 : -1.0;
    String w_lower = w.toLowerCase();
    chars = new ArrayList< CharElement >();
    for( int i=0; i<w.length(); ++i ){
      chars.add( new CharElement( w_lower.charAt(i), col ) );
    }
  }
  public void add( char c_ ){
    w = w + c_;
    chars.add( new CharElement( c_, col ) );
  }
  public void remove(){
    if( !chars.isEmpty() ){
      w = w.substring( 0, w.length()-1 );
      chars.remove( chars.size()-1 );
    }
  }
  public boolean isEmpty(){
    return chars.isEmpty();
  }
  public void draw(){
    /*
    float arc_angle = degrees(atan2( screenY(1,0)-screenY(0,0), screenX(1,0)-screenX(0,0) ) );
    float cnt_angle = degrees(atan2( height/2-screenY(0,0), width/2-screenX(0,0) ) );
    float diff = arc_angle - cnt_angle;
    if( diff > 180.0 )  diff -= 180.0;
    if( diff < -180.0 ) diff += 180.0;
    println( diff );
    float dir = diff > 0.0 ? -1.0 : 1.0;
    */
    for( int i=0; i<chars.size(); i++ ){
      CharElement ce = (CharElement)chars.get(i);
      if( i != 0 ){
        rotate( radians( dir*( ce.getAngle()/2 ) ) );
        translate( 0, 0, 5 );
      }
      ce.draw();
      if( i != chars.size()-1 ){
        rotate( radians( dir*( ce.getAngle()/2+5.0 ) ) );
      } else {
        translate( ce.getScale(), 0 );
      }    
    }
  }

  public String getString(){ return w; }
  
  private String w;
  private ArrayList< CharElement > chars;
  private color col;
  private float dir;
}

class Sentence {
  Sentence(){
    words = new ArrayList< WordElement >();
  }    
  Sentence( String s_ ){
    this();
    s = s_;
    String[] ss = splitTokens( s, " " );
    for( int i=0; i<ss.length; i++ ){
      words.add( new WordElement( ss[i], nextColor() ) );
    }
    if( words.isEmpty() ) words.add( new WordElement( "", nextColor() ) );
    int x_ = int( random(width/2) - width/4 );
    int y_ = int( random(height/2) - width/4 );
    t = -1*atan2( y_, -x_ );
    x = x_ + width/2;
    y = y_ + height*2/5;  
  }

  public void add( char c ){
    WordElement we = (WordElement)(words.get( words.size()-1 ));
    if( c==' ' ){
      if( we.isEmpty() ) return; // If last WordElement has no CharElements, do nothing.
      words.add( new WordElement( "", nextColor() ) ); 
    } else {
      we.add( c ) ;
    }
    s += str(c);
  }

  public void remove(){
    WordElement we = (WordElement)(words.get( words.size()-1 ));
    if( s.isEmpty() ) return;
    char last = s.charAt( s.length()-1 );
    s = s.substring( 0, s.length()-1 );
    if( last != ' ' ){
      we.remove();
      return;
    }
    if( s.charAt( s.length()-1 ) == ' ' ) return;
    if( we.isEmpty() ){
      words.remove( words.size()-1 );
    }
  }

  public void draw(){
    translate( x, y );
    rotate( t );
    for( int i=0; i<words.size(); i++ ){
      WordElement we = (WordElement)words.get(i);
      we.draw();
    }
  }

  public String getString(){ return s; }
  
  private ArrayList< WordElement > words;
  private String s;   
  private int   x;
  private int   y;
  private float t;
}
void keyPressed() {
  if( key==CODED ){
    if( keyCode == CONTROL ){
      sentence_list.clear();
      sentence_list.add( new Sentence( "" ) );
      text_lines.clear();
    }
 } else if( key == ESC ){
    exit();
  } else {
    add_char( key );
  }
}
