

int slideNum = 30;
int maxAds = 4;
int counter = 0;
ArrayList slideArray = new ArrayList();
int insertionMax;


void setup()
{
  size( 400, 1200 );
  background( 255, 255, 255 );
  createSlides( doMath( slideNum, maxAds ) );
}

int doMath( int sN, int mA ) 
{
  int insertionMath = (int)Math.floor( sN / mA );
  insertionMax = ( insertionMath >= maxAds) ? maxAds : insertionMath;
  print(insertionMax);
  return insertionMax;
}


void createSlides( int insertItem ) 
{ 
  for( int i = 0; i < slideNum; i++ )
  {     
    Slide slide = new Slide( color(54,195,247), 180, 20+(i*40) );
    slideArray.add( slide );
    slide.display();  
    insertCheck( i );
  }
}

void insertCheck( int n )
{
  counter++;
  
  for( int j = 0; j < insertionMax; j++ )
  {     
    if ( counter == slideNum/insertionMax ) 
    {
      counter = 0;
      Slide slide = new Slide( color(255,0,0), 200, 5+(n*40) );
      slideArray.add( slide );
      slide.display();  
    }
  }

}






class Slide {
  color c;
  float xpos;
  float ypos;
  
  Slide(color c_, float xpos_, float ypos_) 
  {
      c = c_;
      xpos = xpos_;
      ypos = ypos_; 
   }

  void display() 
  {
      rectMode(CENTER);
      stroke(0);
      fill(c);
      rect(xpos,ypos,20,10);
  
  }
}
