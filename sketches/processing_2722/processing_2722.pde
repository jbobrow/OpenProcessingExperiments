

import java.awt.Font;
import java.nio.*;

import javax.media.opengl.GL;
import javax.media.opengl.glu.GLU;
import com.sun.opengl.util.BufferUtil;

import processing.core.PApplet;
import processing.core.PFont;
import processing.core.PGraphics;
import processing.core.PImage;
import processing.opengl.PGraphicsOpenGL;

void setup(){
  size(320,320,OPENGL);
  frameRate(120);
}
private TaifDrawBuffer tdb;
private float[][] textMap;
private PFont usingFont;
void draw(){
  if (tdb==null){
    tdb = new TaifDrawBuffer(((PGraphicsOpenGL)g).gl);
    tdb.setupDrawQueue();
    tdb.myDrawQueue.initCombineTextureExtension(16,16);
    StringBuilder str = new StringBuilder();
    for(char k = 'A'; k <= 'Z'; k++){
      str.append(k);
    }
    for(char k = 'a'; k <= 'z'; k++){
      str.append(k);
    }
    for(char k = '0'; k <= '9'; k++){
      str.append(k);
    }
    str.append(", !?.()'-");
    char[] chars = str.toString().toCharArray();
    int lastChar = 1024;
    textMap = new float[lastChar][];
    usingFont = new PFont(new Font("Dialog", Font.PLAIN, 48), true, chars);
    for(int k = 0; k < chars.length; k++)
      textMap[chars[k]]=tdb.addTemporaryImage(usingFont.images[k]);
  }
    //Try taking the following out of this if, so that it runs every frame: performance is lower, 
    //but still not slow.
  if (frameCount%30==1){

    tdb.resetDrawQueue();
    String bigText = "Top Cat! The most effectual Top Cat! Who's intellectual close friends get to call him T.C., providing it's with dignity. Top Cat! The indisputable leader of the gang. He's the boss, he's a pip, he's the championship. He's the most tip top, Top Cat."+
     "Knight Rider, a shadowy flight into the dangerous world of a man who does not exist. Michael Knight, a young loner on a crusade to champion the cause of the innocent, the helpless in a world of criminals who operate above the law."+
      "This is my boss, Jonathan Hart, a self-made millionaire, he's quite a guy. This is Mrs H., she's gorgeous, she's one lady who knows how to take care of herself. By the way, my name is Max. I take care of both of them, which ain't easy, 'cause when they met it was MURDER!"+
      "Ulysses, Ulysses - Soaring through all the galaxies. In search of Earth, flying in to the night. Ulysses, Ulysses - Fighting evil and tyranny, with all his power, and with all of his might. Ulysses - no-one else can do the things you do. Ulysses - like a bolt of thunder from the blue. Ulysses - always fighting all the evil forces bringing peace and justice to all."+
      "80 days around the world, we'll find a pot of gold just sitting where the rainbow's ending. Time - we'll fight against the time, and we'll fly on the white wings of the wind. 80 days around the world, no we won't say a word before the ship is really back. Round, round, all around the world. Round, all around the world. Round, all around the world. Round, all around the world."+
      "I never spend much time in school but I taught ladies plenty. It's true I hire my body out for pay, hey hey. I've gotten burned over Cheryl Tiegs, blown up for Raquel Welch. But when I end up in the hay it's only hay, hey hey. I might jump an open drawbridge, or Tarzan from a vine. 'Cause I'm the unknown stuntman that makes Eastwood look so fine."+
      "Hey there where ya goin', not exactly knowin', who says you have to call just one place home. He's goin' everywhere, B.J. McKay and his best friend Bear. He just keeps on movin', ladies keep improvin', every day is better than the last. New dreams and better scenes, and best of all I don't pay property tax. Rollin' down to Dallas, who's providin' my palace, off to New Orleans or who knows where. Places new and ladies, too, I'm B.J. McKay and this is my best friend Bear."+
      "80 days around the world, we'll find a pot of gold just sitting where the rainbow's ending. Time - we'll fight against the time, and we'll fly on the white wings of the wind. 80 days around the world, no we won't say a word before the ship is really back. Round, round, all around the world. Round, all around the world. Round, all around the world. Round, all around the world."+
      "Hong Kong Phooey, number one super guy. Hong Kong Phooey, quicker than the human eye. He's got style, a groovy style, and a car that just won't stop. When the going gets tough, he's really rough, with a Hong Kong Phooey chop (Hi-Ya!). Hong Kong Phooey, number one super guy. Hong Kong Phooey, quicker than the human eye. Hong Kong Phooey, he's fan-riffic!"+
      "Barnaby The Bear's my name, never call me Jack or James, I will sing my way to fame, Barnaby the Bear's my name. Birds taught me to sing, when they took me to their king, first I had to fly, in the sky so high so high, so high so high so high, so - if you want to sing this way, think of what you'd like to say, add a tune and you will see, just how easy it can be. Treacle pudding, fish and chips, fizzy drinks and liquorice, flowers, rivers, sand and sea, snowflakes and the stars are free. La la la la la, la la la la la la la, la la la la la la la, la la la la la la la la la la la la la, so - Barnaby The Bear's my name, never call me Jack or James, I will sing my way to fame, Barnaby the Bear's my name.";
    
    int lineSize = 110;
    StringBuilder bigText2 = new StringBuilder();
    for(int k = 0; k < bigText.length()-lineSize; k+=lineSize){
      bigText2.append(bigText.substring(k+(frameCount%31),k+lineSize)+"\n");
    }
    nf(PI,1,20);
    float yOff = 0/(float)height;
    String[] lines = bigText2.toString().split("\n");
    for(int kLine = 0; kLine < lines.length; kLine++){
      String line = lines[kLine];
      float xOff = 0/(float)width;
      for(int charIndex = 0; charIndex < line.length(); charIndex++){
        xOff+=addGlyph(line.charAt(charIndex),xOff,yOff,.25f);
      }
      yOff+=.028f; //TODO: not make this static...
    }
  }

  background(0);
  screen2D4GL(g,640,480);
  GL gl = ((PGraphicsOpenGL)g).gl;
  gl.glTranslatef(.5f,.5f,0);
  gl.glRotatef(frameCount/10f,0,0,1);
  gl.glTranslatef(-.5f,-.5f,0);
  gl.glTranslatef(0,mouseY/(float)height-.5f,0);
  tdb.drawQueuedElements();
}
public float addGlyph(char toDraw, float xScr, float yScr, float texScale){
  float translateWidth = .05f; //Good number for space.

  float[] loc = textMap[toDraw];
  int index = usingFont.index(toDraw);
  if (index==-1 || loc==null){
    throw new RuntimeException("No glyph for \'"+toDraw+"\'");
  }

  float high = (float) usingFont.height[index];
  float bwidth = (float) usingFont.width[index];
  float lextent = (float) usingFont.leftExtent[index];
  float textent = (float) usingFont.topExtent[index];

  float baseLine = usingFont.size-3;

  float glyphW = bwidth/(float)tdb.getTempImgWidth();
  float glyphH = high/(float)tdb.getTempImgHeight();

  float charW = texScale/width;
  float rowHeight = texScale/height;

  //System.out.println(charW);
  //System.out.println(xscl+" "+yscl);
  float charLeft = charW*(lextent);
  float charRight = charW*(lextent+bwidth);
  float dispHRatio = (baseLine-textent)*rowHeight;
  float bottomHRatio = dispHRatio+(high)*rowHeight;

  tdb.addDrawRect(
  xScr + charLeft,
  yScr + dispHRatio,
  (charRight-charLeft),
  (bottomHRatio - dispHRatio),
  //Tex
  loc[0],loc[1],glyphW,glyphH);
  return translateWidth = usingFont.setWidth[index]*charW;
}

private void screen2D4GL(PGraphics g, float wantedWidth, float wantedHeight) {
  GL gl = ((PGraphicsOpenGL)g).gl;
  /*
			screen2D();
   		 */
  float[] vals = g.getMatrix().get(null);
  //gl.glTranslatef(vals[3],vals[7],vals[11]);

  view3D(g, wantedWidth,wantedHeight);
  gl.glScalef(1/(wantedHeight/wantedWidth),-1,1); //NOTE: IS UPSIDE DOWN!
  gl.glTranslatef(-1,-1,0);
  gl.glScalef(2,2,1/vals[11]);
}
private void view3D(PGraphics g, float wantedWidth, float wantedHeight){
  GLU glu = ((PGraphicsOpenGL)g).glu;
  GL gl = ((PGraphicsOpenGL)g).gl;

  gl.glMatrixMode(gl.GL_PROJECTION);	// Select The Projection Matrix
  gl.glLoadIdentity();		// Reset The Projection Matrix
  glu.gluPerspective(45.0f,640/480.f,0.1f,100.0f);
  // Reset The Current Modelview Matrix

  gl.glMatrixMode(gl.GL_MODELVIEW);
  gl.glLoadIdentity();
  gl.glTranslatef(0.0f, 0.0f,-(float)Math.sqrt(2)-1);		// Center The Triangle
}

//BUFFER

public class TaifDrawBuffer {
  private GL gl;

  public TaifDrawBuffer(GL gl) {
    this.gl = gl;
  }

  public boolean isModified=true;
  float[] verticeFloats;
  float[] textureFloats;
  public void setupDrawQueue() {
    // generate a new VBO and get the associated ID
    NullElements = newGlBuffer(gl);
    VerticeData = newGlBuffer(gl);
    TexCoordData = newGlBuffer(gl);
    int[] autonums = new int[MAX_QUEUE_SIZE / 4];
    verticeFloats = new float[MAX_QUEUE_SIZE / 4];
    textureFloats = new float[MAX_QUEUE_SIZE / 4];
    for (int k = 0; k < autonums.length; k++) {
      autonums[k] = k;
      verticeFloats[k] = 0;
      textureFloats[k] = 0;
    }
    IntBuffer nullElementsFloatData = IntBuffer.wrap(autonums,0,autonums.length);
    uploadInto(NullElements, nullElementsFloatData, autonums.length);
    //uploadInto(VerticeData, verticeFloats, 0, verticeFloats.length);
    //uploadInto(TexCoordData, textureFloats, 0, textureFloats.length);
  }
  public void initCombineTextureExt(int numX, int numY){
    myDrawQueue.initCombineTextureExtension(numX, numY);
  }



  private final int[][] movs = new int[][]{
    {
      1,0    }
    ,{
      1,1    }
    ,{
      0,1    }
    ,{
      0,0    }
  };
  public void addDrawRect(float cornX, float cornY, float rectW, float rectH,
  float texOffX, float texOffY, float texRectW, float texRectH) {
    for (int k = 0; k < 4; k++) {
      addDrawVertex0(
      cornX+movs[k][0]*rectW,
      cornY+movs[k][1]*rectH,
      0,
      //Tex
      texOffX + movs[k][0]*texRectW,
      texOffY + movs[k][1]*texRectH);
    }
  }

  private void addDrawVertex0(float x, float y, float z, float u, float v) {
    int ind = myDrawQueue.usedVertices;
    verticeFloats[ind*3]=x;
    verticeFloats[ind*3+1]=y;
    verticeFloats[ind*3+2]=z;
    textureFloats[ind*2]=u;
    textureFloats[ind*2+1]=v;
    myDrawQueue.usedVertices++;
    isModified = true;
  }


  /**
   * 		 * in BYTES!!! So, each attrib takes ~ (MAX_QUEUE_SIZE/1024) kB! not too
   * 		 * big!
   		 */
  public final int MAX_QUEUE_SIZE = 512*1024;
  //Vertice data strides 3, nullelements strides 1, texcoorddata strides 2.
  private int VerticeData, NullElements, TexCoordData;
  private FloatBuffer VerticeFloatData;
  private FloatBuffer TexCoordFloatData;

  public void drawQueuedElements() {
    gl.glEnableClientState(gl.GL_VERTEX_ARRAY); // activate
    gl.glEnableClientState(gl.GL_TEXTURE_COORD_ARRAY); // activate
    gl.glEnable(gl.GL_TEXTURE_2D);
    if (myDrawQueue.combine!=null){
      bindTexture(gl, getCombinedImage());
    }

    if (isModified){
      if (VerticeFloatData==null){
      VerticeFloatData = FloatBuffer.wrap(verticeFloats, 0, verticeFloats.length);
      TexCoordFloatData = FloatBuffer.wrap(textureFloats, 0, textureFloats.length);
      }
      uploadInto(VerticeData, VerticeFloatData, verticeFloats.length);
      uploadInto(TexCoordData, TexCoordFloatData, textureFloats.length);
      isModified = false;
    }
    // coordinates
    gl.glBindBufferARB(GL.GL_ARRAY_BUFFER_ARB, VerticeData);
    gl.glVertexPointer(3, gl.GL_FLOAT, 0, 0);

    //Texture coords
    gl.glBindBufferARB(GL.GL_ARRAY_BUFFER_ARB, TexCoordData);
    gl.glTexCoordPointer(2, gl.GL_FLOAT, 0, 0);

    // ptr
    gl.glBindBufferARB(GL.GL_ELEMENT_ARRAY_BUFFER_ARB, NullElements);

    gl.glDrawElements(gl.GL_QUADS, myDrawQueue.usedVertices,gl.GL_UNSIGNED_INT, 0);

    gl.glDisableClientState(gl.GL_VERTEX_ARRAY); // deactivate vertex
    // array

    gl.glDisableClientState(gl.GL_TEXTURE_COORD_ARRAY); // activate


    // bind with 0, so, switch back to normal pointer operation
    gl.glBindBufferARB(gl.GL_ARRAY_BUFFER_ARB, 0);
    gl.glBindBufferARB(gl.GL_ELEMENT_ARRAY_BUFFER_ARB, 0);
    gl.glDisable(gl.GL_TEXTURE_2D);
  }

  public void resetDrawQueue() {
    myDrawQueue.usedVertices = 0;
    isModified = true;
    //myDrawQueue.usedImages = 0; Don't reset this every frame, performance reasons (lots of mem?)
  }

  private DrawQueue myDrawQueue = new DrawQueue();

  private class DrawQueue {
    private int usedVertices;
    private int usedImages = 0;
    private int NUM_TEXS;
    private int numTexsX, numTexsY;
    public void initCombineTextureExtension(int numX, int numY){
      NUM_TEXS = numX*numY;
      numTexsX = numX;
      numTexsY = numY;
      images = new PImage[NUM_TEXS];
      combine = new PImage(1024,1024,PApplet.ARGB);
      combine.loadPixels();
      for(int k = 0; k < combine.pixels.length; k++){
        combine.pixels[k]=color(random(256));
      }
      combine.updatePixels();
      sizeEachX = 1f/numTexsX;
      sizeEachY = 1f/numTexsY;
    }
    private PImage[] images;
    private PImage combine;
    private float sizeEachX, sizeEachY;
    public float[] addImg(PImage img){
      int added = addImgInd(img);
      return getLocation(added);
    }
    private float[] getLocation(int imgInd){
      int row = imgInd/numTexsX;
      int col = imgInd%numTexsX;
      return new float[]{
        col*sizeEachX, row*sizeEachY      };
    }
    private int addImgInd(PImage img) {
      int alreadyhas = -1;
      for(int k = 0; k < images.length; k++){
        if (img==images[k]){
          alreadyhas = k;
          break;
        }
      }
      if (alreadyhas!=-1){
        return alreadyhas;
      }
      int ind = usedImages;
      if (ind==images.length-1)
        return images.length-1;
      usedImages++;
      images[ind]=img;

      float[] positions = getLocation(ind);
      int xTexDraw = (int) (positions[0]*combine.width);
      int yTexDraw = (int) (positions[1]*combine.height);
      for(int x = 0; x < img.width; x++){
        for(int y = 0; y< img.height; y++){
          combine.set(x+xTexDraw,y+yTexDraw,img.get(x,y));//img.get(x,y);
        }
      }
      combine.updatePixels();
      return ind;
    }
  }

  private void uploadInto(int vboId, IntBuffer buf, int len) {
    gl.glBindBufferARB(gl.GL_ARRAY_BUFFER_ARB, vboId);
    gl.glBufferDataARB(gl.GL_ARRAY_BUFFER_ARB, len * 2, buf,
    gl.GL_STATIC_DRAW_ARB);
  }

  public void uploadInto(int vboId, FloatBuffer buf, int len) {
    gl.glBindBufferARB(gl.GL_ARRAY_BUFFER_ARB, vboId);
    gl.glBufferDataARB(gl.GL_ARRAY_BUFFER_ARB, len * 4, buf,
    gl.GL_STATIC_DRAW_ARB);
  }

  private int newGlBuffer(GL gl2) {
    int[] toRet = new int[1];
    gl2.glGenBuffers(1, toRet, 0);
    return toRet[0];
  }

  int TEX_ID = -1;
  public void setTexture(int id2) {
    TEX_ID = id2;
  }
  public float[] addTemporaryImage(PImage img) {
    return myDrawQueue.addImg(img);

  }

  public PImage getCombinedImage() {
    return myDrawQueue.combine;
  }

  public int getTempImgHeight() {
    return myDrawQueue.combine.height;
  }

  public int getTempImgWidth() {
    return myDrawQueue.combine.width;
  }
}

//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.
//THE FOLLOWING RIPPED OUT OF CORE.


public void bindTexture(GL gl, PImage texture) {
  ImageCache cash = (ImageCache) texture.getCache(g);  // as in johnny
  if (cash == null) {
    cash = new ImageCache();
    texture.setCache(g, cash);
    texture.setModified(true);
  }

  if (texture.isModified()) {
    //System.out.println("texture modified");
    // TODO make this more efficient and just update a sub-part
    // based on mx1 et al, also use gl function to update
    // only a sub-portion of the image.
    cash.rebind(gl, texture);
    // clear the modified flag
    texture.setModified(false);

  } 
  else {
    gl.glBindTexture(GL.GL_TEXTURE_2D, cash.tindex);
  }
}

public boolean BIG_ENDIAN =
ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN;
public class ImageCache{
  public int tindex = -1;  // not yet ready
  public boolean BuildMipmaps = false; //If you want mipmaps for a single image, ... I dunno.
  int tpixels[];
  IntBuffer tbuffer;
  public int twidth, theight;

  int[] tp;



  /**
   * 		 * Generate a texture ID and do the necessary bitshifting for the image.
   		 */
  public void rebind(GL gl, PImage source) {
    //System.out.println("rebinding texture for " + source);
    if (tindex != -1) {
      // free up the old memory
      gl.glDeleteTextures(1, new int[] { 
        tindex       }
      , 0);
    }
    // generate a new texture number to bind to
    int[] tmp = new int[1];
    gl.glGenTextures(1, tmp, 0);
    tindex = tmp[0];
    //System.out.println("got index " + tindex);

    // bit shifting this might be more efficient
    int width2 = nextPowerOfTwo(source.width);
    //(int) Math.pow(2, Math.ceil(Math.log(source.width) / Math.log(2)));
    int height2 = nextPowerOfTwo(source.height);
    //(int) Math.pow(2, Math.ceil(Math.log(source.height) / Math.log(2)));

    // use glGetIntegerv with the argument GL_MAX_TEXTURE_SIZE
    // to figure out min/max texture sizes
    if ((width2 > twidth) || (height2 > theight)) {
      // either twidth/theight are zero, or size has changed
      tpixels = null;
    }
    if (tpixels == null) {
      twidth = width2;
      theight = height2;
      tpixels = new int[twidth * theight];
      tbuffer = BufferUtil.newIntBuffer(twidth * theight);
    }

    // copy image data into the texture
    int p = 0;
    int t = 0;

    if (BIG_ENDIAN) {
      switch (source.format) {
      case ALPHA:
        for (int y = 0; y < source.height; y++) {
          for (int x = 0; x < source.width; x++) {
            tpixels[t++] = 0xFFFFFF00 | source.pixels[p++];
          }
          t += twidth - source.width;
        }
        break;

      case RGB:
        for (int y = 0; y < source.height; y++) {
          for (int x = 0; x < source.width; x++) {
            int pixel = source.pixels[p++];
            tpixels[t++] = (pixel << 8) | 0xff;
          }
          t += twidth - source.width;
        }
        break;

      case ARGB:
        for (int y = 0; y < source.height; y++) {
          for (int x = 0; x < source.width; x++) {
            int pixel = source.pixels[p++];
            tpixels[t++] = (pixel << 8) | ((pixel >> 24) & 0xff);
          }
          t += twidth - source.width;
        }
        break;
      }

    } 
    else {  // LITTLE_ENDIAN
      // ARGB native, and RGBA opengl means ABGR on windows
      // for the most part just need to swap two components here
      // the sun.cpu.endian here might be "false", oddly enough..
      // (that's why just using an "else", rather than check for "little")

      switch (source.format) {
      case ALPHA:
        for (int y = 0; y < source.height; y++) {
          for (int x = 0; x < source.width; x++) {
            tpixels[t++] = (source.pixels[p++] << 24) | 0x00FFFFFF;
          }
          t += twidth - source.width;
        }
        break;

      case RGB:
        for (int y = 0; y < source.height; y++) {
          for (int x = 0; x < source.width; x++) {
            int pixel = source.pixels[p++];
            // needs to be ABGR, stored in memory xRGB
            // so R and B must be swapped, and the x just made FF
            tpixels[t++] =
              0xff000000 |  // force opacity for good measure
            ((pixel & 0xFF) << 16) |
              ((pixel & 0xFF0000) >> 16) |
              (pixel & 0x0000FF00);
          }
          t += twidth - source.width;
        }
        break;

      case ARGB:
        for (int y = 0; y < source.height; y++) {
          for (int x = 0; x < source.width; x++) {
            int pixel = source.pixels[p++];
            // needs to be ABGR stored in memory ARGB
            // so R and B must be swapped, A and G just brought back in
            tpixels[t++] =
              ((pixel & 0xFF) << 16) |
              ((pixel & 0xFF0000) >> 16) |
              (pixel & 0xFF00FF00);
          }
          t += twidth - source.width;
        }
        break;
      }
    }
    tbuffer.put(tpixels);
    tbuffer.rewind();

    //

    gl.glBindTexture(GL.GL_TEXTURE_2D, tindex);

    gl.glPixelStorei(GL.GL_UNPACK_ALIGNMENT, 1);
    //gl.glPixelStorei(GL.GL_UNPACK_SWAP_BYTES, 0);

    gl.glTexImage2D(GL.GL_TEXTURE_2D, 0, 4, twidth, theight,
    //0, GL.GL_RGBA, GL.GL_UNSIGNED_BYTE, cash.tpixels);
    0, GL.GL_RGBA, GL.GL_UNSIGNED_BYTE, tbuffer);

    gl.glTexParameterf(GL.GL_TEXTURE_2D,
    //GL.GL_TEXTURE_MAG_FILTER, GL.GL_NEAREST);
    GL.GL_TEXTURE_MAG_FILTER, GL.GL_LINEAR);
    gl.glTexParameterf(GL.GL_TEXTURE_2D,
    //GL.GL_TEXTURE_MIN_FILTER, GL.GL_NEAREST);
    GL.GL_TEXTURE_MIN_FILTER, GL.GL_LINEAR);

    //

    //      gl.glTexParameterf(GL.GL_TEXTURE_2D, GL.GL_TEXTURE_WRAP_S, GL.GL_CLAMP);
    //      gl.glTexParameterf(GL.GL_TEXTURE_2D, GL.GL_TEXTURE_WRAP_T, GL.GL_CLAMP);
    gl.glTexParameterf(GL.GL_TEXTURE_2D, GL.GL_TEXTURE_WRAP_S, GL.GL_CLAMP_TO_EDGE);
    gl.glTexParameterf(GL.GL_TEXTURE_2D, GL.GL_TEXTURE_WRAP_T, GL.GL_CLAMP_TO_EDGE);

    //

    gl.glTexEnvf(GL.GL_TEXTURE_ENV, GL.GL_TEXTURE_ENV_MODE, GL.GL_MODULATE);
  }


  private int nextPowerOfTwo(int val) {
    int ret = 1;
    while (ret < val) {
      ret <<= 1;
    }
    return ret;
  }
}



