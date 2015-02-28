

// Processing Projekt: Buchcover - Roman



PFont fliesstext;
PFont klein;



void setup(){
 size (300, 350); 
 smooth();
 
 // Schrift laden
 fliesstext = loadFont ("Garamond-14.vlw");

 
 frameRate (1);
 

}


void draw(){
  //noLoop(); 
  
  background (255);
  
  
  //Texte laden und zusammenführen
  
  String[] textauszug = loadStrings ("textauszug.txt");


  String ta = "";

  
  for (int f=0; f < textauszug.length; f++) {
  ta += textauszug[f] + "\n";
  }
  
  
  textFont(fliesstext);
  fill (255);      // Schrift färben
  

   //Text gerade
  textSize (random(12,16));
  textLeading (random(8, 16)); 
  fill (random(255), random(255), random(255));
  
  text (ta, random(50,80), random(50,80), random(width,width+100), random(height, height+100));
 
  text (ta, random(50,80), random(-40,-20), random(width+40,width+100), random(height, height+100));
  
  text (ta, random(20,40), random(20,40), random(width,width+30), random(height, height+30));
 
  text (ta, random(30,40), random(30,40), random(width,width+30), random(height, height+30));
  
  text (ta, random(-30,0), random(-30,0), random(width,width+30), random(height, height+30)); 
   
  text (ta, random(-30,0), random(-30,0), random(width,width+30), random(height, height+30));
 
  text (ta, random(-30,0), random(-30,0), random(width,width+30), random(height, height+30));
 
  //Text schwarz
  fill (0);
  textSize (10);
  
  text (ta, random(-10,0), random(0), random(width,width+30), random(height, height+30));
 
 
}


