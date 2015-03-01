
One a;
One b;

void setup()
{
 
size (1000, 1000);
smooth();
a= new One(30, 30);
//b= new One(90, 90);
//frameRate(60);
}

void draw() {
  a.move();

  //b.move();
  
}
  
float m =100;
String[] textLines, textLines2;

class One 
{
  float x,y;
  int g, b;
  
  
  One(float tx, float ty)
  {
    //g=c; d=b;
    
    x= tx;
    y= ty;
    textLines = loadStrings("mer.txt");
    textLines2 = loadStrings("to download.txt");
   // frameRate(60);
    smooth();


    
  }
  
  void move() 
  {
    background(255);
    
    translate(700, 700);
    for ( int n = 0; n < textLines.length; n++ ) 
    {
    float j = textLines[n].length();
    
    
      for ( int h = 0; h < textLines2.length; h++ ) 
      {
    
       float k = textLines2[h].length();
    
    
      for(int i= 0; i<m;i++)
      {
           
       float x = cos( i*TWO_PI/m   )*100;
       float y = sin( i*TWO_PI/m   )*100;
        stroke(random(200), random(200), random(200));
        line (x,y,j,k);
      }
      }
    }
  }
  
}


