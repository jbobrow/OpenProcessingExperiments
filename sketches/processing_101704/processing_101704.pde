
import java.awt.Graphics2D;
import java.awt.Font;
import java.awt.font.FontRenderContext;
import java.awt.font.GlyphVector;
import java.awt.Shape;
import java.awt.geom.PathIterator;
import java.awt.datatransfer.*;
import java.awt.Toolkit; 
import java.io.IOException;


ClipHelper cp = new ClipHelper();

float x0 = 25, y0 = 170; 
PathIterator iterator;
String fontName = "Arial";
 Glyph mGlyph;
int currentLetter=0;

public void setup() { size(800, 800);
 stroke(0); // frameRate(15);
 noLoop();
 noFill();
 mGlyph=new Glyph(); 
 mGlyph.export(mGlyph.chars);
 cp.copyString(mGlyph.exportString);// exit();
}



public void draw() { background(255); 
//mGlyph.make("q");mGlyph.draw();
fill(0);textAlign(LEFT);
text("made "+mGlyph.chars.length+" Glyph-Shapes.",20,20);
text("See them in my next Sketch.",20,50);
text("Glyph-Arry copyed to clipboard.",20,80);
text(mGlyph.chars,20,120);
text(mGlyph.exportString,20,150);
}
void text(	String[] letters,float x,float y){
	String allLetters="";	for(int i=0;i<letters.length;i++){allLetters+=letters[i];	}
	text(allLetters,x,y);}

class Glyph{
 String[] chars = {
"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
"ö","ü","ä","Ö","Ü","Ä",",",".","!","-","?"," "
}; 
// XMLElement xmlGlyphs;
 
 GlyphPoint[] addElement(GlyphPoint[] org, GlyphPoint added) {GlyphPoint[] result =new GlyphPoint[org.length+1];
 for(int i=0; i<result.length-1;i++){result[i]=org[i];} result[org.length] = added; return result; }
GlyphPoint[] mGlyphPoints;
 private void draw(){ for(int i=0;i<mGlyphPoints.length;i++){mGlyphPoints[i].draw();} }
 private void draw(String letter) { make(letter);draw();}
 private void export(String[] letter) {
	  exportString="Glyph[] allLetters={\n";
	 for(int i=0;i<letter.length;i++){export( letter[i]);}
	 exportString=exportString+"};";
	 println(exportString);
	 }
 String exportString;
 private void export(String letter) {
 make(letter); 
 exportString+="new Glyph(\""+letter+"\",new GlyphPoint[]{";
 for(int i=0;i<mGlyphPoints.length;i++){
 exportString=exportString+"new GlyphPoint(";
 exportString=exportString+
 mGlyphPoints[i].x+"f,"+
 mGlyphPoints[i].y+"f,"+
 mGlyphPoints[i].xc1+"f,"+
 mGlyphPoints[i].yc1+"f,"+
 mGlyphPoints[i].xc2+"f,"+
 mGlyphPoints[i].yc2+"f,"+
 mGlyphPoints[i].x1+"f,"+
 mGlyphPoints[i].y1+"f,"+
 mGlyphPoints[i].seg_type+")";
 if(i!=mGlyphPoints.length-1) exportString=exportString+",";

 }  exportString+="}),\n"; }



class GlyphPoint{
 float xStart, yStart; // Segment start
 float x, y, x1, y1; // Current and end points
 float xc1, yc1, xc2, yc2; // Cubic control points
 float xc, yc; // Quadratic control point
 int seg_type;

 GlyphPoint(float xin,float yin,int insegtype){ x=xin; y=yin; seg_type=insegtype; }
 GlyphPoint(float xin,float yin,float xStartin,float yStartin,int insegtype){ xStart=xStartin; yStart=yStartin; x=xin; y=yin; seg_type=insegtype; }
 GlyphPoint(int unused,float xin,float yin,float x1in,float y1in,int insegtype){ x1=x1in; y1=y1in; x=xin; y=yin; seg_type=insegtype; }
 GlyphPoint(float xin, float yin, float xc1in, float yc1in, float xc2in, float yc2in, float x1in, float y1in,int insegtype){ xc1=xc1in; yc1= yc1in; xc2= xc2in; yc2= yc2in; x1= x1in; y1= y1in; x=xin; y=yin; seg_type=insegtype; }
 
 
 void draw() {
 switch (seg_type) {
 case PathIterator.SEG_MOVETO: break;
 case PathIterator.SEG_LINETO: line(x, y, x1, y1); break;
 case PathIterator.SEG_QUADTO:  bezier(x, y, xc1, yc1, xc2, yc2, x1, y1); break;
 case PathIterator.SEG_CUBICTO:  bezier(x, y, xc1, yc1, xc2, yc2, x1, y1);  break;
// case PathIterator.SEG_CLOSE: line(x, y, xStart, yStart); break;
 default: break;
 } } 
}

void make(String[] letters) { for(int l=0;l<letters.length;l++){ make(letters[l]);} }

void make(String theLetter) {
 x0 = 25; y0 = 170; // Java font for outline rendering
 Graphics2D g2d = ((PGraphicsJava2D)g).g2;
 FontRenderContext frc = g2d.getFontRenderContext();
 Font font = new Font(fontName, Font.PLAIN, 150);
 GlyphVector gv = font.createGlyphVector(frc, theLetter);
 Shape glyph = gv.getOutline(x0, y0);
 iterator = glyph.getPathIterator(null);
 PFont fontP = createFont(fontName, 150); textFont(fontP);
 textSize(20); textAlign(RIGHT);
 
 mGlyphPoints=new GlyphPoint[0];
 float xStart, yStart; // Segment start
 float x, y, x1, y1; // Current and end points
 float xc1, yc1, xc2, yc2; // Cubic control points
 float xc, yc; // Quadratic control point
 x = xStart = x0; y = yStart = y0;
 while (!iterator.isDone()) {
 float[] coordinates = new float[6];
 int segType = iterator.currentSegment(coordinates);
 switch (segType) { case PathIterator.SEG_MOVETO:
 x = coordinates[0]; y = coordinates[1];
 mGlyphPoints = addElement(mGlyphPoints,new GlyphPoint(x,y,segType));
 xStart = x; yStart = y; break;
 case PathIterator.SEG_LINETO:
 x1 = coordinates[0]; y1 = coordinates[1];
 mGlyphPoints = addElement(mGlyphPoints,new GlyphPoint(0,x,y,x1,y1,segType));
 x = x1; y = y1; break;
 case PathIterator.SEG_QUADTO:
 xc = coordinates[0];
 yc = coordinates[1];
 x1 = coordinates[2];
 y1 = coordinates[3];
 xc1 = x + 2.0f * (xc - x) / 3.0f; 
 yc1 = y + 2.0f * (yc - y) / 3.0f; 
 xc2 = xc1 + (x1 - x) / 3.0f; 
 yc2 = yc1 + (y1 - y) / 3.0f; 
 mGlyphPoints=addElement(mGlyphPoints,new GlyphPoint(x, y, xc1, yc1, xc2, yc2, x1, y1,segType));
 x = x1; y = y1; break;
 case PathIterator.SEG_CUBICTO:
 xc1 = coordinates[0];
 yc1 = coordinates[1];
 xc2 = coordinates[2];
 yc2 = coordinates[3];
 x1 = coordinates[4];
 y1 = coordinates[5];
 mGlyphPoints=addElement(mGlyphPoints,new GlyphPoint(x, y, xc1, yc1, xc2, yc2, x1, y1,segType));
 x = x1; y = y1; break;
 case PathIterator.SEG_CLOSE: mGlyphPoints=addElement(mGlyphPoints,new GlyphPoint(x, y, xStart, yStart,segType)); break;
 default: break;
 }
 iterator.next();
}}
} 


class ClipHelper {  Clipboard clipboard;  ClipHelper() {   getClipboard();  }
	  void getClipboard () {	    // this is our simple thread that grabs the clipboard
	    Thread clipThread = new Thread() {		public void run() {		  clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();	}  };  
	    if (clipboard == null) {try { clipThread.setDaemon(true); clipThread.start(); clipThread.join();} catch (Exception e) {}  }	 }
	  void copyString (String data) {	    copyTransferableObject(new StringSelection(data));  }
	  void copyTransferableObject (Transferable contents) {	  getClipboard();  clipboard.setContents(contents, null);  }
	  String pasteString () {   String data = null;	    try {data = (String)pasteObject(DataFlavor.stringFlavor);  }  catch (Exception e) {System.err.println("Error getting String from clipboard: " + e);  }  return data;  }
	  Object pasteObject (DataFlavor flavor)   throws UnsupportedFlavorException, IOException  {	 Object obj = null;	  getClipboard();	    Transferable content = clipboard.getContents(null);	    if (content != null)   obj = content.getTransferData(flavor);	      return obj;	  }
	}


