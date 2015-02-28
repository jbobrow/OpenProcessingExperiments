
//The FYD logo
//By Benjamin McFetridge


int logoSize = 100; //how big do you want the logo

void setup(){
  size(500, 500);
  background(255);
  
}

void draw(){
  noStroke();
  fill(37, 191, 241);
  //rect(0,0,100,100);
  
  
  //F of the Fyd
  arc(logoSize, logoSize, logoSize, logoSize, PI, TWO_PI-PI/2);
  triangle(logoSize, logoSize, logoSize/2, logoSize, logoSize/2, logoSize+logoSize/2);
  
  translate(logoSize/5, 0);
  
  //Y of the fYd
  arc(logoSize, logoSize, logoSize, logoSize, TWO_PI-PI/2, TWO_PI);
  triangle(logoSize, logoSize, logoSize+logoSize/2, logoSize, logoSize, logoSize+logoSize/2);
  
  translate(logoSize+logoSize/5, 0);
  //D of the fyD
  arc(logoSize, logoSize, logoSize, logoSize, PI/2, PI);
  triangle(logoSize, logoSize, logoSize/2, logoSize, logoSize, logoSize/2);
 
 smooth();
  
}


