
void setup(){
  size(700,700);
   smooth();
  frameRate(5);
}

void draw(){
  background(240,250,190);
 
//Blaue Hintergrundform 
  beginShape();
  noStroke();
  fill(10,190,140,215);
  vertex(130,0);
  vertex(240,0);
  vertex(700,400);
  vertex(700,675);
  endShape(CLOSE);

//Gelbe Hintergrundform  
  beginShape();
  noStroke();
  fill(240,225,50,185);
  vertex(0,550);
  vertex(625,0);
  vertex(700,0);
  vertex(100,700);
  vertex(0,700);
  endShape(CLOSE);

//Großer Kreis/Nur Grüne Outline/Mittig 
  noFill();
  stroke(20,60,15,225);
  strokeWeight(20);
  ellipseMode(CENTER);
  ellipse(350,350,600,600);

// Kleiner Kreis/Rot/Grüne Outline/mittig
  RedGreenEllipse(358,420,20,20,1,255,255);
  
// Großer (Innen-)Kreis/Grün/abgesoftet/unterste Ebene
  fill(15,60,5,125);
  noStroke();
  ellipseMode(CENTER);
  ellipse(340,375,205,205); 
  
// Großer Kreis/Blau/Grüne Outline/abgesoftet/mittig,rechts
  BlueGreenEllipse(465,330,165,165,1,70,70);

// Kreis/Grau/abgesoftet/oben,rechts  
  fill(70,75,45,160);
  noStroke();
  ellipseMode(CENTER);
  ellipse(477,190,90,90);
  
// Kreis/Rot/Grüne Outline/Oben,mittig,rechts
  RedGreenEllipse(362,245,120,120,1,200,255); 
   
// Kreis/Rot/Grüne Outline/Oben,mittig,weit rechts
  RedGreenEllipse(275,210,138,138,1,125,200);

// Kreis/Grün/Oben, rechts/direkt am grauen Kreis
  GreenEllipse(413,220,52,52);

// Kreis/Rot/Grüne Outline/Oben,mittig
  RedGreenEllipse(335,95,16,16,2,255,255);

// Kreis/Blau/Grüne Outline/Links,mittig,unten
  BlueGreenEllipse(105,392,20,20,2,255,255);

// Kreis/Rot/Grüne Outline/Links,mittig
  RedGreenEllipse(141,322,40,40,8,255,255);
  
// Kreis/Rot/Grüne Outline/Unten,mittig,rechts
  RedGreenEllipse(394,561,35,35,2,100,255);
  
// Großer Kreis/Gelb/Grüne Outline/abgesoftet/Unten,mittig,rechts
  YellowGreenEllipse(445,435,111,111,1,80,80);   

// Großer Kreis/Gelb/Grüne Outline/Unten,mittig,links
  YellowGreenEllipse(270,390,165,165,1,60,60);  
  
// Kreis/Grün/Unten,rechts 
  GreenEllipse(478,472,35,35);
  
// Kleiner Kreis/Grün/Mittig,rechts
  GreenEllipse(481,278,28,28);

// Kreis/Grün/abgesoftet/Mittig,leicht rechts
  noStroke();
  fill(15,60,5, 210);
  ellipseMode(CENTER);
  ellipse(535,337,65,65);
  
// Kreis/Rot/Grüne Outline/Mittig/(Auge)
  RedGreenEllipse(325,325,70,70,3,190,255);
  
// Kleiner Kreis/Grün/Mittig/(im Auge)
  GreenEllipse(325,325,18,18);
  
// Kreis/Rot/Grüne Outline/abgesoftet/Mittig,links/Schnittmenge mit vielen anderen Kreisen
  RedGreenEllipse(260,460,65,65,2,200,255);  

// Kreis/Rot/Grüne Outline/abgesoftet/Links,unten,außen
  RedGreenEllipse(152,508,42,42,1,150,150);
  
// Kreis/Blau/Grüne Outline/abgesoftet/links unten
  BlueGreenEllipse(195,415,57,57,2,175,255);
  
// Kreis/Blau/Grüne Outline/abgesoftet/Mittig,links,oben
  BlueGreenEllipse(195,415,57,57,2,175,255);  
  
// Sehr kleiner Kreis/Rot/Grüne Outline/mittig
  RedGreenEllipse(338,493,13,13,1,125,200);
  
// Kleiner Kreis/Rot/Grüne Outline/unten,rechts,außen
  RedGreenEllipse(560,505,30,30,1,150,200);
 
// Sehr kleiner Kreis/Grün/Unten,mittig
  GreenEllipse(287,505,9,9); 
  
// Kleiner Kreis/Gelb/Grüne Outline/abgesoftet/unten,mittig,rechts
  YellowGreenEllipse(420,520,17,17,1,160,65);   
  
// AB HIER 
// KOMMEN ALLE
// LINIEN

  //Waagerechte Linien:
  
   aLines(2,255,155,175,578,245);

  aLines(2,255,155,175,578,245); 

  aLines(1,255,95,280,565,404);  

  aLines(1,255,95,293,565,424);  

  aLines(2,255,83,350,590,451);  
  
  aLines(1,255,124,413,548,461);

  aLines(1,125,415,542,469,508);  
  
  aLines(1,125,420,557,475,517);  
 
  aLines(1,125,425,568,481,526); 

  aLines(1,255,164,536,302,511);  

  aLines(1,255,197,500,295,556);  
  
  aLines(1,255,512,247,541,248);  

  aLines(1,255,514,256,550,256);  
  
  
//Senkrechte Linien:

  aLines(1,255,368,136,391,169);  

   aLines(1,255,356,146,386,181);  
 
  aLines(1,255,388,142,155,446);  
  
  aLines(1,180,326,191,119,379);  
  
  aLines(1,200,178,289,163,340);  

  aLines(1,200,136,266,101,313);  

  aLines(1,200,121,268,95,314);  
  
  aLines(1,127,415,236,175,559);  
   
  aLines(1,195,421,235,194,562);  
   
  aLines(1,255,490,112,224,562);  
    
  aLines(1,215,490,140,422,562);  
  
  aLines(1,215,503,139,433,574);  
  
  aLines(1,145,517,127,443,595);   
   
  aLines(2,255,517,220,520,511);   
   
}


//VORLAGEN:

// Grüner Kreis
void GreenEllipse(int x, int y, int b, int h){  
  noStroke();
  fill(15,60,5);
  ellipseMode(CENTER);
  ellipse(x,y,b,h);
}

// Roter Kreis/Grüne Outline
void RedGreenEllipse(int x, int y, int b, int h, int s, int d1, int d2){
  fill(195,70,0,d1);
  stroke(20,60,15,d2);
  strokeWeight(s);
  ellipseMode(CENTER);
  ellipse(x,y,b,h); 
}

// Gelber Kreis/Grüne Outline
void YellowGreenEllipse(int x, int y, int b, int h, int s, int d1, int d2){
  fill(240,225,50,d1);
  stroke(10,30,0,d2);
  strokeWeight(s);
  ellipseMode(CENTER);
  ellipse(x,y,b,h);
}

// Blauer Kreis
void BlueGreenEllipse(int x,int y,int b,int h,int s,int d1,int d2){
  fill(10,190,140,d1);
  stroke(10,30,0,d2);
  strokeWeight(s);
  ellipseMode(CENTER);
  ellipse(x,y,b,h); 
}

// Linien
void aLines(int s,int d,int x1,int y1, int x2,int y2){
  stroke(10,30,0,d);
  strokeWeight(s);
  line(x1,y1,x2,y2);
}
