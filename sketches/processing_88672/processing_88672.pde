
String[] data;
int circleRadius = 10; 
ArrayList<String> words = new ArrayList<String>();
float xpos, ypos; 

void setup() {
     
    size(900,800);
    smooth();
    stroke(0, 50);
    background(25);
    xpos =width/2; // give variable value  
    ypos =0; 
         
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
  frameRate(30);
 
}
 
void draw()
{
  background(25);
    for( int i =0; i< words.size(); i++ )
    {    
      fill(225);
      textSize(80);

 pushMatrix();
 float angle = atan2(mouseX,mouseX-i); 
  translate(i-50,-200);  
  rotate(angle);  
  fill(mouseX,mouseY,0);  
 text( words.get(i) + " ", xpos, ypos);
 popMatrix();
 
    }
   
}


