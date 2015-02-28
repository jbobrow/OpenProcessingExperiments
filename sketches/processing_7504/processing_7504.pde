
// parse open processing's rss

import java.awt.geom.Rectangle2D;

ArrayList applets;

void setup() {
  size( 600, 400 );
  applets = new ArrayList();
  textFont( loadFont( "DejaVuSansMono-12.vlw" ) );
  String url_base = "http://openprocessing.org/tools/";
  String fName = "latestVisualsRSS.php";
  XMLElement rss = new XMLElement(this, url_base + fName);
  // Get the <description> element from inside <channel>
  XMLElement[] items = rss.getChild("channel").getChildren("item");
  for( int i = 0; i < items.length; i++ ) {
    if( items[i].getName().equals("item") ) {

      XMLElement content = items[i].getChild("media:content");
      if( content != null ) {
        String thumbnail = null;
        thumbnail = content.getStringAttribute("url");
        thumbnail = thumbnail.replaceAll("/visuals/\\.\\.","");
        println( thumbnail );
        String title = items[i].getChild("title").getContent();
        println( title );
        String applet_url = items[i].getChild( "link" ).getContent();
        println( applet_url );
        OpenProcessingApplet ape = new OpenProcessingApplet( thumbnail, title, applet_url );
        applets.add( ape );
      }
    }
  }
  noLoop();
}

void draw() {
  background( 0 );
  int v_total = 0;
  int h_total = 0;
  for( int i = 0; i < applets.size(); i++ ) {
    OpenProcessingApplet opa = (OpenProcessingApplet) applets.get(i); 
    opa.y = v_total;
    opa.x = h_total;
    opa.display();
    h_total += 2*opa.wd;
    if( h_total > width ) {
      h_total = 0;
      v_total += opa.ht;
    }
  }
}

void mouseMoved() {
  for( int i = 0; i < applets.size(); i++ ) {
    OpenProcessingApplet opa = (OpenProcessingApplet) applets.get(i); 
    if( opa.mouseOver() ) { 
      opa.drawBorder = true; 
    } 
    else { 
      opa.drawBorder = false; 
      opa.clicked = false;
    }
  }
  redraw();
}

void mouseClicked() {
  for( int i = 0; i < applets.size(); i++ ) {
    OpenProcessingApplet opa = (OpenProcessingApplet) applets.get(i); 
    if( opa.mouseOver() ) { 
      opa.clicked = true; 
      link( opa.url );
    } 
    else { 
      opa.clicked = false; 
    }
  }
  redraw();
}

class OpenProcessingApplet {

  PImage thumbnail;
  String title;
  String url;
  int x;
  int y;
  float ht;
  float wd;
  boolean drawBorder;
  boolean clicked;

  OpenProcessingApplet( String thumbnail, String title, String url ) {
    if( thumbnail == null ) { 
      println( "it's null, dude" ); 
    }
    this.thumbnail = loadImage( thumbnail, "jpg" );
    this.title = title;
    this.url = url; 
    if( thumbnail == null ) {
      this.thumbnail = loadImage( "no_img.jpg" );
    } 
    ht = this.thumbnail.height;
    wd = this.thumbnail.width;
  }

  void display() {
    stroke( 255, 0, 200 );
    if( clicked ) {
      stroke( 255, 255, 100 );
    }
    image(thumbnail, x, y);
    if( drawBorder ) {
      strokeWeight( 4 );
      noFill();
      rect( x, y, wd*2, ht ); 
    }
    text(title, x+wd+5, y, 95, 100);
  }

  void setX( int x ) {
    this.x = x;
  }

  void setY( int y ) {
    this.y = y;
  }

  boolean mouseOver() {
    Rectangle2D r = new Rectangle2D.Float( x, y, wd*2, ht );
    return r.contains( mouseX, mouseY );
  }
}







