
    
//copy write Risa Hiyana

PImage pic;
//PFont mono;

int lineNumber;
String []lines;
//you have to put the brakets before
int x,y;

void setup() {
  //only called once 
  size(1300, 836);
  lines= loadStrings("risa.txt");
  lineNumber=0;
  pic = loadImage( "RisaHiyama.jpg" );
  textSize(random(25,80)); 
  x=width/10;
  y=height/2;
//  mono = loadFont("MrsEavesItalicItalic.otf");
//  textFont(mono);
}

void draw() {
  image( pic, 0, 0 ,1300, 836);
  fill(250,40,40);
  text(lines[lineNumber],x,y);
  if (frameCount % 90 == 0){
    if ( lines[lineNumber].length()> 13) {
      x=int(random(width/7,width/4));    
      y=int(random(height/8,width/2));   
    }  
   else {
      x=int(random(width/4,width/4*2));    
      y=int(random(height/2,width/6*4));   
    }   
    textSize(random(25,80));
    lineNumber++;
    if(lineNumber==lines.length)
    lineNumber=0;
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    setup();
  }
  else
  {
    exit ();
  }
}




