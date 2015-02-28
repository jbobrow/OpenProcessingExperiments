
int pos = 30;
int bajacolor = 50;


void setup () {
  size (200,150);
  
}

void draw () {
  pos++;
  bajacolor--;
  
  
  //Blanco
  for (int a = 5; a < 50; a += 10) {
    fill(255);
    noStroke();
    rect(78,0,pos,100);
    
   // Rojo
      for (int b = 5; b < 50; b += 20) {
    fill(pos, bajacolor + random(255), bajacolor);
    noStroke();
    rect(0,75,pos,100);
    
      noStroke();
  
  fill(255); //fill the next shape with white color
     beginShape();//begin drawing the shape -- It's a big star
     vertex(30,2);
     vertex(38,20);
     vertex(58,20);
     vertex(40,35);
     vertex(53,58);
     vertex(30,43);
     vertex(7,58);
     vertex(20,35);
     vertex(2,20);
     vertex(22,20);
     endShape();//end of the shape
    
    frameRate (20);
   
    
    // Azul
    for (int c = 5; c < 50; c += 10) {
    fill(bajacolor, bajacolor, random(255), bajacolor);
    noStroke();
    rect(0,0,pos,75);
    
          
    }
  }
}


}
