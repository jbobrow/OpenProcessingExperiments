


PImage img;
XML xml;
ArrayList<PImage> words = new ArrayList<PImage>();

void setup() {  
  
  
  String imgURL = "http://bluemountain.princeton.edu/bluemtn/cgi-bin/imageserver/imageserver.pl?color=all&ext=jpg&oid=bmtnaae191812-01.1.16"; 
  img = loadImage(imgURL , "jpg");
  
  //String imageFile = "bmtnaae191812-01.1.16-call.jpg";
  //img = loadImage(imageFile);
  img.loadPixels();
  
  
  //String altoFile = "bmtnaae_1918-12_01_0016.alto.xml";
  //xml = loadXML(altoFile);

  String xmlURL = "https://raw.github.com/pulibrary/BlueMountain/master/metadata/periodicals/bmtnaae/issues/1918/12_01/alto/bmtnaae_1918-12_01_0016.alto.xml";
  xml = loadXML(xmlURL);
  
  println(img.width);
  println(img.height);
  //println(xml);
  XML page = xml.getChildren("Layout")[0].getChildren("Page")[0];
  int altoHeight = page.getInt("HEIGHT");
  int altoWidth = page.getInt("WIDTH");
  //println(page);
  println(altoHeight);
  println(altoWidth);
  float scaleFactor = (float)img.height / (float)altoHeight;
  
  XML[] textBlocks = page.getChildren("PrintSpace")[0].getChildren("TextBlock");
  //println(textBlocks);
  println(scaleFactor);
  
  for(int i = 0; i < textBlocks.length; i++)
  {
    XML[] textLines = textBlocks[i].getChildren("TextLine");
    for(int j = 0; j < textLines.length; j++)
    {
      XML[] strings = textLines[j].getChildren("String");
      for(int k = 0; k < strings.length; k++)
      {
        //println(strings[k]);
        int x = (int)(scaleFactor * strings[k].getInt("HPOS"));
        int y = (int)(scaleFactor * strings[k].getInt("VPOS"));
        int w = (int)(scaleFactor * strings[k].getInt("WIDTH"));
        int h = (int)(scaleFactor * strings[k].getInt("HEIGHT"));
        PImage word = img.get(x,y,w,h);
        //println(x+" "+y+" "+w+" "+h);
        word.resize(word.width/4,word.height/4);
        words.add(word);
      }
    }
  }
  
  frameRate(10);
  //background(170,135,106);
  
  println(words.size());
  
  
  int bgW = 1343;
  int bgH = 1519;
  size(bgW/2, bgH/2); 
  PImage bg = img.get((int)(scaleFactor * 1398),(int)(scaleFactor * 286),(int)(scaleFactor * 1343),(int)(scaleFactor * 1519));
  bg.resize(bgW/2,bgH/2);
  background(bg);
  
}


int wordIdx = 0;
void draw()
{
  
  
    
  //for(PImage word : words)
  //{
    int x = (int)random(width);
    int y = (int)random(height);
    PImage word = (PImage)words.toArray()[wordIdx];
    set(x,y,word);
  //}
  
  wordIdx++;
  
  saveFrame();
  
  if(wordIdx>=words.size())
    noLoop();
}


