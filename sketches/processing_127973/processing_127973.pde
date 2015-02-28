
RawFont font;
int i=0;

void setup() { 
  size(300, 300); 
  frameRate(6);
  fill(255, 255, 255, 60);
  noStroke();
  loadTTFFont("DiscoMo.ttf");
}

void draw() { 
  background(0);
  i++;  if (i==100)i=0;
  text("JavaScript online TTF-font loading to shape", 20, 20);
 drawGlyph( font, i, this,30,120,250);
}

void loadTTFFont(String fileName) {        
  XMLHttpRequest req = new XMLHttpRequest();
  req.open( "GET", fileName , false );
  overrideMimeType(req);  
  req.send(null);  //        String txt=req.responseText;       text(txt,10,10,0);
  font = new RawFont( new a3d.ByteArray( req.responseText, a3d.Endian.BIG ) );
}



