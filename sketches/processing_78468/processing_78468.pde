
int numWords = 100;  
Word [] words = new Word[numWords];  
char [] chars = new char[numWords];
String mytext; 
float myfontsize;  
float s = 2;


void setup() {  
  size(600, 600);  
  for(int i = 0; i < words.length; i++)  
  {  
     words[i] = new Word();   
  }   
  textFont(createFont("Helvetica", 24));  
  background(0);  
}  


void draw() {  
 

  textSize(myfontsize); 

  myfontsize = s + random(s); 
  
  float interp = frameCount / 60.;
    for(int i = 0; i < words.length; i++)  
    {  
       words[i].display(interp);   
    }   
}  

void mousePressed()  
{  
   background(0);
   s = s + 5;   
}  

class Word {  

  float xpos, ypos; 
  float xoffset, yoffset;  
  float interpOffset;  
   
  
  color c;
  int colorstep;
  

  Word () {  

      mytext = "Obama Win";  
      xpos = 600;  
      ypos = 600;  
      c = 0;
      
      colorstep = 1;
      xoffset = random(width);  
      yoffset = random(height);  
      interpOffset = random(PI * 2.);  
       

  }  

  void display(float _interp) // interp is some number between -1.0 and 1.0  
  {  
      float xtemp, ytemp, interp; 
      
      c = c + colorstep;
      if (c> 255) c= 0;
      fill( c + random(250),c,random(250), random(50)); 
      
      interp = cos(_interp + interpOffset);  
      xtemp = xpos +  interp * xoffset;  

      ytemp = ypos + interp * yoffset;  
      
      text(mytext, xtemp, ytemp);  


  }  
  
} 


