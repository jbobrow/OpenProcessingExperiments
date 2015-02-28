

String[] data;
int[] charCount = new int[128];

ArrayList<String> words = new ArrayList<String>();
int max;
int min;
float maxDist;
void setup() {
    
    size(1000,300);
    smooth();
    stroke(0, 50);
    background(25);
        
    data = loadStrings("text.txt");
         
    for (int i = 0; i < data.length; i ++ ) 
    {
        
      String str = data[i];
      
      String[] splitTxt = split( str, " " );

      for( int j = 0; j < splitTxt.length; j++ )
      {
        words.add(splitTxt[j]);
      }
    }
    

    
   rectMode(CENTER);
  maxDist = sqrt( width*width + height*height );

}

void draw() 
{
  background(25);
    for( int i =0; i< words.size(); i++ )
    {
      fill(225);
     

      textSize(30);
      
      float txtLocX = i * 60 - frameCount*2;
      float txtLocY = height/2;
      
      PVector txtPos = new PVector( constrain(txtLocX, 0, width), txtLocY );
      PVector mousePos = new PVector( constrain(mouseX,0,width), constrain(mouseY,0,height) );
      
      float dist = PVector.dist(txtPos, mousePos);
      
      int size = ceil( map(dist, 0, maxDist*.8, 40, 5) );
      
      pushMatrix();
      
      rotate(  map(dist, 0, maxDist*.8, 0, .2)  );
      textSize( size );
      
      text( words.get(i) + " ", txtLocX, txtLocY );
          popMatrix();

    }
}



