
import java.nio.*;
import com.sun.opengl.util.texture.*;


class XTexture
{
  XTexture()
  {
    _tex = null;

    isLoaded = false;
  }

  XTexture( String fName )
  {
    fileName = fName;
    _tex = null;
    _buffer = null;
    _img = null;

    isLoaded = false;

    load( fName );
  }

  void bind()
  {
    //_tex.bind();
    vgl.gl().glBindTexture( GL.GL_TEXTURE_2D, _id );
  }

  void enable()
  {
    vgl.enableTexture( true );
    bind();
    //_tex.enable();
  }

  void disable()
  {
    //_tex.disable();
    vgl.gl().glBindTexture( GL.GL_TEXTURE_2D, 0 );
    vgl.enableTexture( false );
  }

  void setWrap()
  {
    if( _tex != null )
    {
      _tex.setTexParameteri( GL.GL_TEXTURE_WRAP_S, GL.GL_REPEAT );
      _tex.setTexParameteri( GL.GL_TEXTURE_WRAP_T, GL.GL_REPEAT );
    }
    else
    {
      vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_WRAP_S, GL.GL_REPEAT );
      vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_WRAP_T, GL.GL_REPEAT );
    }
  }

  void setClamp()
  {
    if( _tex != null )
    {
      _tex.setTexParameteri( GL.GL_TEXTURE_WRAP_S, GL.GL_CLAMP );
      _tex.setTexParameteri( GL.GL_TEXTURE_WRAP_T, GL.GL_CLAMP );
    }
    else
    {
      vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_WRAP_S, GL.GL_CLAMP );
      vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_WRAP_T, GL.GL_CLAMP );
    }
  }

  void setClampToEdge()
  {
    if( _tex != null )
    {
      _tex.setTexParameteri( GL.GL_TEXTURE_WRAP_S, GL.GL_CLAMP_TO_EDGE );
      _tex.setTexParameteri( GL.GL_TEXTURE_WRAP_T, GL.GL_CLAMP_TO_EDGE );
    }
    else
    {
      vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_WRAP_S, GL.GL_CLAMP_TO_EDGE );
      vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_WRAP_T, GL.GL_CLAMP_TO_EDGE );
    }
  }

  // Sets a texture to be compared as a zbuffer
  // check shadow extension for more information
  void setToCompare()
  {
    vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_COMPARE_MODE, GL.GL_COMPARE_R_TO_TEXTURE );
    vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_COMPARE_FUNC, GL.GL_LEQUAL );
  }

  void createGL( int w, int h )
  {
    _width = w;
    _height = h;

    int[] id = { 
      0     };

    // Creating texture.
    vgl.gl().glGenTextures( 1, id, 0 );
    _id = id[0];
    println( "texture created: " + _id );

    vgl.gl().glBindTexture( GL.GL_TEXTURE_2D, _id );
    vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_WRAP_S, GL.GL_REPEAT );
    vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_WRAP_T, GL.GL_REPEAT );
    vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_MIN_FILTER, GL.GL_LINEAR );//_MIPMAP_LINEAR );
    vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_MAG_FILTER, GL.GL_LINEAR );

    vgl.gl().glTexImage2D( GL.GL_TEXTURE_2D, 0, GL.GL_RGBA, _width, _height, 0, GL.GL_RGBA, GL.GL_UNSIGNED_BYTE, null );
    //    vgl._glu.gluBuild2DMipmaps( GL.GL_TEXTURE_2D, GL.GL_RGBA, _width, _height, GL.GL_RGBA, GL.GL_UNSIGNED_BYTE, null );
  }

  void create( int w, int h )
  {
    _width = w;
    _height = h;
    _buffer = new BufferedImage( w, h, BufferedImage.TYPE_INT_ARGB );//_PRE );
    _tex = TextureIO.newTexture( _buffer, false );
    _id = _tex.getTextureObject();
    println( "texture created: " + _id );

    //      _tex.setTexParameteri( GL.GL_TEXTURE_WRAP_R, GL.GL_REPEAT );
    _tex.setTexParameterf( GL.GL_TEXTURE_WRAP_S, GL.GL_REPEAT );
    _tex.setTexParameterf( GL.GL_TEXTURE_WRAP_T, GL.GL_REPEAT );
    _tex.setTexParameterf( GL.GL_TEXTURE_MIN_FILTER, GL.GL_LINEAR_MIPMAP_LINEAR );
    _tex.setTexParameterf( GL.GL_TEXTURE_MAG_FILTER, GL.GL_LINEAR );//_MIPMAP_LINEAR );
  }

  boolean load( String fName )//, boolean mipmap )  
  {   
    fileName = fName;

    try
    {
      //println( "LOAD TEXTURE START" );

      _tex = TextureIO.newTexture( new File(dataPath(fileName)), true );  //mipmap );
      //println( "AFTER TEX" );

      _id = _tex.getTextureObject();
      //println( "ID: " + _id );

      _width = _tex.getImageWidth();
      _height = _tex.getImageHeight();

      _tex.setTexParameterf( GL.GL_TEXTURE_WRAP_S, GL.GL_REPEAT ); 
      _tex.setTexParameterf( GL.GL_TEXTURE_WRAP_T, GL.GL_REPEAT );  
//      _tex.setTexParameteri( GL.GL_TEXTURE_WRAP_S, GL.GL_CLAMP ); 
//      _tex.setTexParameteri( GL.GL_TEXTURE_WRAP_T, GL.GL_CLAMP );  
      _tex.setTexParameteri( GL.GL_TEXTURE_MIN_FILTER, GL.GL_LINEAR_MIPMAP_LINEAR );
      _tex.setTexParameteri( GL.GL_TEXTURE_MAG_FILTER, GL.GL_LINEAR );//_MIPMAP_LINEAR );

      println("loading texture: " + fileName + " with id= " + _id );

      isLoaded = true;
    }
    catch( IOException e )
    {
      println( "*** texture error: " + e );
      isLoaded = false;
    }

    return isLoaded;
  }

  void loadPImage( String fName )
  {
    fileName = fName;

    _img = loadImage( fName );
    if( _img == null )
    {
      println( "couldnt load texture: " + fileName );
      return;
    }

    _width = _img.width;
    _height = _img.height;

    //println( "copy buffer" );
    imgBuffer = new int[_width*_height];
    for( int j=0; j<_height; j++ )
    {
      for( int i=0; i<_width; i++ )
      {
       //  imgBuffer[i+j*_width] = (_img.pixels[i+j*_width]);
         imgBuffer[i+j*_width] = color(height-j,i,i-j);
      }
    }

    int[] texId = new int[1];

    //println( "gen tex" );
    vgl.gl().glGenTextures( 1, texId, 0 );
    _id = texId[0];
    //println( "tex id: " + _id );

    //println( "bind" );
    vgl.gl().glBindTexture( GL.GL_TEXTURE_2D, _id );

    //println( "pixelstore" );
    vgl.gl().glPixelStorei( GL.GL_UNPACK_ALIGNMENT, 1 );
    vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_GENERATE_MIPMAP, GL.GL_TRUE );

    vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_WRAP_S, GL.GL_REPEAT );
    vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_WRAP_T, GL.GL_REPEAT );

    //println( "texparameter" );
    vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_MIN_FILTER, GL.GL_LINEAR_MIPMAP_LINEAR );
    vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_MAG_FILTER, GL.GL_LINEAR );

    //println( "teximage2d" );
    //    vgl.gl().glTexImage2D( GL.GL_TEXTURE_2D, 0, 4, _width, _height, 0, GL.GL_BGRA, GL.GL_UNSIGNED_BYTE, IntBuffer.wrap(_img.pixels); 
    vgl.glu().gluBuild2DMipmaps( GL.GL_TEXTURE_2D, 4, _img.width, _img.height, GL.GL_BGRA, GL.GL_UNSIGNED_BYTE, IntBuffer.wrap(_img.pixels) ); 

    //_img = null;

    isLoaded = true;
    println("loading texture: " + fileName + " with id= " + _id );
  }


  void loadPImageFromMemory( PImage img )
  {
    fileName = "__";

    _width = img.width;
    _height = img.height;

    int[] texId = new int[1];

    //println( "gen tex" );
    vgl.gl().glGenTextures( 1, texId, 0 );
    _id = texId[0];
    //println( "tex id: " + _id );

    //println( "bind" );
    vgl.gl().glBindTexture( GL.GL_TEXTURE_2D, _id );

    //println( "pixelstore" );
    vgl.gl().glPixelStorei( GL.GL_UNPACK_ALIGNMENT, 1 );
    //    vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_GENERATE_MIPMAP, GL.GL_TRUE );

    vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_WRAP_S, GL.GL_REPEAT );
    vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_WRAP_T, GL.GL_REPEAT );

    //println( "texparameter" );
    vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_MIN_FILTER, GL.GL_LINEAR_MIPMAP_LINEAR );
    vgl.gl().glTexParameteri( GL.GL_TEXTURE_2D, GL.GL_TEXTURE_MAG_FILTER, GL.GL_LINEAR );

    //println( "teximage2d" );
    //    vgl.gl().glTexImage2D( GL.GL_TEXTURE_2D, 0, 4, _width, _height, 0, GL.GL_BGRA, GL.GL_UNSIGNED_BYTE, IntBuffer.wrap(img.pixels) )
    vgl.glu().gluBuild2DMipmaps( GL.GL_TEXTURE_2D, 4, img.width, img.height, GL.GL_BGRA, GL.GL_UNSIGNED_BYTE, IntBuffer.wrap(img.pixels) ); 

    //_img = null;

    isLoaded = true;
    println("loading texture: " + fileName + " with id= " + _id );
  }


  void update()
  {
    //    if( _img != null );
    //      _img.updatePixels();

    //    vgl.gl().glPixelStorei(GL.GL_UNPACK_ROW_LENGTH, _width );
    //    vgl.gl().glPixelStorei( GL.GL_UNPACK_SWAP_BYTES, 1 );
    //    vgl.gl().glPixelStorei( GL.GL_UNPACK_ALIGNMENT, 4 );

    for( int j=0; j<_height; j++ )
    {
      for( int i=0; i<_width; i++ )
      {
        imgBuffer[i+j*_width] = (_img.pixels[i+j*_width]);
      }
    }

    vgl.gl().glBindTexture( GL.GL_TEXTURE_2D, _id );
    vgl.gl().glPixelStorei( GL.GL_UNPACK_ALIGNMENT, 1 );
    vgl.gl().glTexSubImage2D( GL.GL_TEXTURE_2D, 0, 0, 0, _width, _height, GL.GL_BGRA, GL.GL_UNSIGNED_BYTE, IntBuffer.wrap(imgBuffer) ); //IntBuffer.wrap(_img.pixels) );
    //    vgl.gl().glTexImage2D( GL.GL_TEXTURE_2D, 0, 4, _width, _height, 0, GL.GL_BGRA, GL.GL_UNSIGNED_BYTE, IntBuffer.wrap(imgBuffer) );
    //IntBuffer.wrap(_img.pixels) );

    //    vgl.gl().glPixelStorei( GL.GL_UNPACK_SWAP_BYTES, 0 );

    vgl.gl().glBindTexture( GL.GL_TEXTURE_2D, 0 );

    println("updated, id= " + _id );
  }

  void delete()
  {
    int[] texId = { 
      _id     };
    try {
      vgl.gl().glDeleteTextures( 1, texId, 0 );
    } 
    catch( GLException e )
    { 
      println( e );
    }

    _img = null;

    _id = 0;

    isLoaded = false;
  }

  /*  int getTarget()
   {
   return _tex.getTarget();
   }*/

  int getId()
  {
    return _id;
  }

  int getWidth()
  {
    return _width;
  }

  int getHeight()
  {
    return _height;
  }

  String name()
  {
    return fileName;
  }


  //
  // Members
  //
  String fileName;
  Texture _tex;
  int    _id;

  int _width, _height;

  PImage _img;
  int[] imgBuffer;

  BufferedImage  _buffer;

  boolean isLoaded;
};

