
//Hintergrund
  size(900, 750);
  background(238, 232, 205);
  smooth();
  
//OBERE REIHE
//Rotes Dreieck oben (von links nach rechts)
  fill(255,0,0);
    beginShape();
      vertex(150, 140);    
      vertex(165, 180);    
      vertex(185, 140);    
      vertex(150, 140);    
    endShape();
  
//Gelbers Dreieck (Oben von links nach rechts)
  fill(255,255,0);
    beginShape();
      vertex(140, 180);   
      vertex(165, 320);    
      vertex(190, 180);    
      vertex(140, 180);    
    endShape();

//Transparentes Dreieck oben
  noFill();
    beginShape();
      vertex(230, 140);
      vertex(220, 180);
      vertex(250, 180);
      vertex(230, 140);
    endShape();

//Rosanes Dreieck
  fill(201,94,130);
    beginShape();
      vertex(210, 180);  
      vertex(235, 320);   
      vertex(260, 180);  
      vertex(210, 180);   
    endShape();
     
//Orangenes Dreiek oben
  fill(255,69,0);
    beginShape();
      vertex(285, 140);  //punkt links
      vertex(310, 180);  //unten punkt 
      vertex(335, 140);  //punkt rechts
      vertex(285, 140);  //punkt links nach rechts 
    endShape();
     
//Violettes Dreiech
  fill(148, 50, 149);
    beginShape();
      vertex(310, 180);
      vertex(285, 320);
      vertex(335, 320);
      vertex(310, 180);
    endShape();
    
    beginShape(LINES);
     strokeWeight(4); // Beastly
      vertex(280, 220);
      vertex(340, 220);
      vertex(280, 230);
      vertex(340, 230);
      vertex(280, 240);
      vertex(340, 240);
    endShape();
    
//Blaues Dreieck oben
 strokeWeight(1);
 fill(79,62,187);
    beginShape();
      vertex(380, 140);
      vertex(360, 180);
      vertex(395, 180);
      vertex(380, 140);
    endShape();
    
//Transperentes Dreieck
  noFill();
    beginShape();
      vertex(380, 180);
      vertex(355, 320);
      vertex(405, 320);
      vertex(380, 180);
    endShape();
    
//blaues kleines Dreick oben2
  fill(27,55,80);
    beginShape();
      vertex(445, 140);
      vertex(460, 180);
      vertex(470, 140);
      vertex(445, 140);
    endShape();
 
//rotes kleines Dreieck oben2
  fill(157,66,52);
    beginShape();
      vertex(440, 180);
      vertex(460, 220);
      vertex(480, 180);
      vertex(440, 180);
    endShape();

//Gelbes Dreieck2
  fill(255,255,0);
    beginShape();
      vertex(460, 220);
      vertex(425, 320);
      vertex(500, 320);
      vertex(460, 220);
    endShape();

//Gelbes kleine Dreieck oben
  fill(255,255,0);
    beginShape();
      vertex(555, 140);
      vertex(550, 180);
      vertex(560, 180);
      vertex(555, 140);
    endShape();
    
//transperentes kleines Dreieck oben
  noFill();
    beginShape();
      vertex(555, 180);
      vertex(540, 220);
      vertex(570, 220);
      vertex(555, 180);
    endShape();
    
//Blaues Dreieck
  fill(50,46,138);
    beginShape();
      vertex(555, 220);
      vertex(520, 320);
      vertex(595, 320);
      vertex(555, 220);
    endShape();

//Roter Kreis
  fill(184,73,61);
ellipse(670,155,50,50);


//Transperentes Dreieck breit 
  noFill();
    beginShape();
      vertex(670, 180);
      vertex(615, 320);
      vertex(725, 320);
      vertex(670, 180);
    endShape();
  
//UNTERE ZEILE
//Zweifabiges kleines Dreieck
    beginShape();
      vertex(150, 500);
      vertex(180, 540);
      vertex(180, 500);
      vertex(150, 500);
      vertex(180, 500);
      vertex(180, 540);
      vertex(210, 500);
      vertex(180, 500);
    endShape();
    
//Zweifabiges Dreieck
    beginShape();
      vertex(140, 540);   
      vertex(180, 660);    
      vertex(180, 540);    
      vertex(140, 540);    
      vertex(180, 540);
      vertex(180, 660);
      vertex(220, 540);
      vertex(180, 540);
    endShape();
    

    
//zweifabiges Dreieck2
  noFill();
    beginShape();
      vertex(260, 540);   
      vertex(310, 660);    
      vertex(310, 540);    
      vertex(260, 540); 
   fill(255,255,0);   
      vertex(310, 540);   
      vertex(310, 660);    
      vertex(360, 540);    
      vertex(310, 540);   
    endShape();
