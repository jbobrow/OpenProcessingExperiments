
PFont f;

//der Text
String Poe1 = "Weh! wunderliche, einsame Stadt, drin Tod seinen Thron errichtet hat, tief unter des Westens düsterer Glut. Wo Sünde bei Güte, wo Schlecht bei Gut in letzter ewiger Ruhe ruht. An Schlössern, Altären und Türmen hat (zerfreßnen Türmen, die nicht beben!), nichts Gleiches eine unsrige Stadt. Von Winden vergessen, die wühlen und heben, stehn unterm Himmel die Wasser ringsum, schwermütige Wasser, ergeben und stumm. Kein Strahlen vom Himmel kommt herab auf jener Stadt langnächtiges Grab. Doch steigt ein Licht aus dem Meere herauf, strömt schweigend an kühnen Zinnen hinauf, hinauf an Türmen bis zum Knauf, hinauf an Palästen, an Zitadellen, an Tempeln hinauf und an Babylonwällen, hinauf an vergessenen Laubengängen mit eingemeißelten Fruchtgehängen, hinauf an manchem Opferstein, auf dessen Friesen zu engem Verein verflochten Viola, Violen und Wein.";


void setup() {
  size(900, 600);

  f = createFont("Verdana",25,true);
  noLoop();
}



void draw() { 
  
  float wordPositionX = 30;
  float wordPositionY = 0;

  
  background(0,50,60);
  smooth();
  textFont(f);         
  int x = 10;
  
 
  for (int i = 0; i < Poe1.length(); i++) {
    char letter = Poe1.charAt(i);
    float letterWidth = textWidth(letter);
    textSize(random(13,16));
    
    //Eigneschaften des Buchsteben "e"
    if(Poe1.charAt(i) == 'e'){
      
     stroke(220,200,100, 10);
     strokeWeight(15);
     line(random(440,470), 600, wordPositionX, wordPositionY + int(letter));
     
     strokeWeight(4);
     stroke(255,255,200, 60);
     fill(255,255,130, 80);
     ellipse(wordPositionX+5, wordPositionY+75, int(letterWidth)+10, int(letter)/5);
     
     fill(0);
     noStroke();
     rect(wordPositionX-15, random(400,600), int(letterWidth)*random(2,5), int(letter)*random(2,8));
         
     fill(255,200,120, 150);
     textSize(random(15,20));
          
    }else{
     fill(0);
    }
    
     //Eigneschaften des Buchsteben "s"
     if(Poe1.charAt(i) == 's'){
  
     noStroke();    
     fill(0);
     ellipse(wordPositionX, random(580,600), int(letterWidth)*random(2,5), int(letter)*random(4));
     
     fill(0);
     noStroke();
     rect(wordPositionX-15, random(400,600), int(letterWidth)*random(2,5), int(letter)*random(2,8));
     fill(0);
      
    }
     //Eigneschaften des Buchsteben "n"
     if(Poe1.charAt(i) == 'n'){
       
     fill(220,200,0, random(10));
     rect(wordPositionX-15, random(280,600), int(letterWidth)/random(25,30), int(letter)/random(20,21));
     ellipse(wordPositionX-15, random(280,600), int(letterWidth)/random(5,5), int(letter)/random(20,21));
     rect(wordPositionX, random(280,600), int(letterWidth)/random(25,30), int(letter)/random(5,10));
     ellipse(wordPositionX-15, random(280,600), int(letterWidth)/random(5,5), int(letter)/random(20,21));
           
     fill(220,200,0, random(50));
     rect(wordPositionX-15, random(450,600), int(letterWidth)/random(25,30), int(letter)/random(20,21));
     ellipse(wordPositionX-15, random(450,600), int(letterWidth)/random(5,5), int(letter)/random(20,21));
     rect(wordPositionX, random(450,600), int(letterWidth)/random(25,30), int(letter)/random(5,10));
     ellipse(wordPositionX-15, random(450,600), int(letterWidth)/random(5,5), int(letter)/random(20,21));
           
     fill(220,200,0, random(50));
     rect(wordPositionX-15, random(500,600), int(letterWidth)/random(25,30), int(letter)/random(20,21));
     ellipse(wordPositionX-15, random(500,600), int(letterWidth)/random(5,5), int(letter)/random(20,21));
     rect(wordPositionX, random(500,600), int(letterWidth)/random(25,30), int(letter)/random(5,10));
     ellipse(wordPositionX-15, random(500,600), int(letterWidth)/random(5,5), int(letter)/random(20,21));
      
     fill(0);
     
    }
    
     //Eigneschaften des Buchsteben "m"
     if(Poe1.charAt(i) == 'm'){
     
     noStroke();
     fill(220,200,0, random(30));
     rect(wordPositionX-15, random(280,600), int(letterWidth)/random(25,30), int(letter)/random(20,21));
     ellipse(wordPositionX-15, random(280,600), int(letterWidth)/random(5,5), int(letter)/random(20,21));
   
     fill(0);
 
     
    }
    
    text(Poe1.charAt(i),wordPositionX,80 + wordPositionY);
    
    wordPositionX += textWidth(Poe1.charAt(i)); 
       
     if(wordPositionX > width-30) {
      wordPositionX = 30;
      
      wordPositionY = wordPositionY + 30;
    }
  }
  
fill(0);
rect(430, 550, random(50,80), random(50,80));
rect(460, 580, random(50,80), random(50,80));
}


void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}

