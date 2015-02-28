
XML lucyxml;
XML[] artists;
Bubble b;

void setup() {
   size(800,800);
   background(255);
   b = new Bubble();
    lucyxml = loadXML("test.xml");
  //create array to store artist
  XML[] artists = lucyxml.getChildren("artist");
  
  //scroll through artists
  for (int i = 0; i<artists.length; i++) {
    //grab artists ranks
    int rank = artists[i].getInt("rank");
    //go through artists children named playcount
    XML[] plays = artists[i].getChildren("playcount");
    //find name of artist
    XML[] name = artists[i].getChildren("name");
    for (int k=0; k<plays.length; k++) {
      // get content for each name child in artist
      String names = name[k].getContent();
      println(name);
    } 
    //find playcount of artist
    for (int j=0; j<plays.length; j++) {
      // get content for each playcount child in artist
      int playC = plays[j].getIntContent();
      println(playC);
      
      //attempt at drawing
      float m = map(playC, 0, 3550, 0, 150);
      println(m);
        b.display(m);
    }
  }
}

void draw() {
  //background(255);
 
}

class Bubble {

  float x, y;
  float size;

  Bubble() {
    x = random(width);
    y = random(height);
    size = 0;
  }

  void display(float _size) {
    ellipse(x, y, _size, _size);
    x = random(width);
    y = random(height);
  }
}



