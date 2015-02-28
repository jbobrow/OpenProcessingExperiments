
PFont font;

int IMG_WIDTH = 400;
int IMG_HEIGHT = 400;

int IMG_LENGTH = IMG_WIDTH*IMG_HEIGHT;

int[] IMG_DUPLICATED = new int[IMG_LENGTH];

void setup()
{
  size(IMG_WIDTH, IMG_HEIGHT);
  background(0);
  
  font = loadFont( "DejaVuSansMono-24.vlw" );
  makePicture();
  build_imgRef();
}

void draw()
{
  pixelize();
}

void makePicture()
{
  textFont( font, 24 );
  for (int i = 0; i < height; i+= height / 10)
  {
    text( "test . line "+ i, 10, i );
  } 
}

// Crée une image tampon
void build_imgRef()
{
  loadPixels();
  for( int i = 0; i < IMG_LENGTH; i ++ )
  {
     IMG_DUPLICATED[i] = pixels[i];
  }
}

// crée une image explosée à partir de l'image tampon
void pixelize()
{
  for( int i = 0; i < IMG_LENGTH; i ++ )
  {
    try
    {

         pixels[i] = IMG_DUPLICATED[i + int( random( mouseX / 20 ) )];
    }

    catch (Exception e){ // NullPointerException don't work either
      println(e); 
    } 
    
  }
  updatePixels();
}

