
interface ITicker
{
  void Tick();
}

class Ticker implements ITicker
{
  IWordReader reader;
  PFont font;
  
  Ticker(IWordReader wReader, PFont wFont)
  {
    reader = wReader;
    font = wFont;
  }
  
  void Tick()
  {
    int pos = reader.CurrentPosition();
    int numOfWordsToShow = 7;
    String[] s = new String[numOfWordsToShow];
    s[0] = reader.ReadPosition( pos );
    for(int i= 0; i< numOfWordsToShow; i++)
    {
      if(pos > i)
      {
        s[i] = reader.ReadPosition( pos-i );
      }  
    }  
    
    //refresh ticker (paint ticker area all white)
    fill(255);
    noStroke();
    rect( 0, height-50 , width, 50 );
    
    //paint focused word
    fill(100);
    textFont( font, 32 );
    float[] wid = new float[numOfWordsToShow];
    for(int i=1; i < numOfWordsToShow; i++)
    {
      if(pos > i)
      {
      wid[i] = textWidth( s[i] );
      }
    }
    text( s[0], width/2-wid[0]/2, height-15);
    
    //paint previous words
    fill(200);
    float leftSideOfWord = width/2-wid[0]/2;
    for(int i=1; i< numOfWordsToShow; i++)
    {
      if(pos>i)
      {
        leftSideOfWord -= wid[i]+5;
        if( leftSideOfWord > -wid[i] )
        {
          text( s[i], leftSideOfWord, height-15);
        }
      }
    }
    
    
  }
}

