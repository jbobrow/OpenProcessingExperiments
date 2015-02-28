

String[] data;
int[] charCount = new int[128];

int max;
int min;

void setup() {
    
    size(1000,500);
    smooth();
    stroke(0, 50);
    background(25);
        
    data = loadStrings("asimov.txt");
         
    for (int i = 0; i < data.length; i ++ ) 
    {
        
      String str = data[i];
      
      String[] splitTxt = split( str, " " );
      
      for( int j = 0; j < splitTxt.length; j++ )
      { 
        int curNum = parseInt( splitTxt[j] ); 
        charCount[ curNum ]++; 
      }
      
    }
    
    max = max(charCount);
    min = min(charCount);
    
   println(max);
    for( int i =0; i< charCount.length; i++ )
    {
      fill(225);
      
      float height1 = map( charCount[i], min, max, 0, -200 );
      float height2 = map( charCount[i], min, max, 1, 50 );
      ellipse(i* width/charCount.length, height/2, height2, height2);
      
    }

}

void draw() 
{
    noLoop();
}



