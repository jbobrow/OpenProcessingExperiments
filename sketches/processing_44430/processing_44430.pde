
byte tekst[];
int nummer;
String naam;
int count;
String[] alleNamen;
String alleNamenString;
int counter;

PFont f;

HashMap ht;

void setup() {
  size(640, 360);
  ht = new HashMap();
  
  tekst = loadBytes("harry.txt");
  println("klaar met laden");
  
  f = createFont("Georgia", 36, true);  
  

  for(int i = 2; i<tekst.length; i++) { //moet eigenlijk nog een 'begin van de tekst-ifje bij..
    if (tekst[i]>64 && tekst[i]<91 && tekst[i-2] != 46) { // zoek de hoofdletters... die niet het begin van een zin zijn...
      vindnaam(i); //Geef de hoofdletter door aan de methode vindnaam
      
    }
  }
  
  print(alleNamenString);
  alleNamen = splitTokens(alleNamenString);
  
}

void draw() {
 background(255);
 fill(0);
 

 
 String s = alleNamen[counter];
 counter = (counter+1) % alleNamen.length;
 
 if (ht.containsKey(s)) { 
      Word w = (Word) ht.get(s);
      w.count();
  } else{
      println(s);
      Word w = new Word(s);
      ht.put(s, w);
  }   
 

 Iterator i = ht.values().iterator(); 
 float x = 0;
 float y = height-10;

  while (i.hasNext()) {
    // Look at each word
    Word w = (Word) i.next();

    
    // The size is the count
    if (w.count >10){
      int fsize = (constrain((w.count), 0, 100))/10;
      textFont(f, fsize);
      text(w.word, x, y);
      //Move along the x-axis
      x += textWidth(w.word + " ");
    }
    
    // If x gets to the end, move Y
    if (x > width) {
      x = 0;
      y -= 100;
      // If y gets to the end, we're done
      if (y < 0) {
        break; 
      }
    }    
  }   
}

void vindnaam(int nummer) { // nummer is het nummer van de hoofdletter in de array van bijbel...
   //Alle NAMEN in een array zetten
   //Door eerst een string te maken met alle namen gescheiden door spatie, en die op te breken
   //met behulp van splittokens() 
   
    naam = "";  
    
    while(tekst[nummer] != 32 && tekst[nummer] != 46 && tekst[nummer] != 44 && tekst[nummer] != 59 && tekst[nummer] != 58) { // je moet stoppen met letters lezen als er een spatie is
      naam = naam+char(tekst[nummer]); //voeg de 'letter' toe aan de String naam 
      nummer++; 
    }
    
   alleNamenString = alleNamenString + " " + naam;
}

class Word {
  
  int count;
  String word;
  
  Word(String s) {
     word = s;
     count = 1; 
  }
  
  void count() {
    count++;
  }
}




