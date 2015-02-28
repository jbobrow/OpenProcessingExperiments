
size (540, 628);
background (225, 220, 201);

//Grundriss
fill (235, 236, 230);
rect (9, 9, 522, 610);

//Typo
noStroke ();
fill (126, 145, 162);
  //D
  rect (60, 60, 45, 15); //oben links
  rect (110, 60, 15, 45); //oben rechts
  rect (60, 80, 15, 45); //unten links
  rect (80, 110, 45, 15); //unten rechts

  //E
  rect (135, 60, 60, 15); //oben
  rect (135, 80, 15, 45); //links
  rect (155, 110, 40, 15); //unten rechts
  fill (16, 20, 32);
  rect (155, 85, 15, 15); //schwarzes Quadrat

  //S
  fill (126, 145, 162);
  rect (220, 60, 15, 40); // oben links
  rect (240, 60, 45, 15); // oben rechts
  rect (220, 110, 45, 15); //unten liks
  rect (270, 85, 15, 40); //unten rechts
  fill (16, 20, 32);
  rect (245, 85, 15, 15); //schwarzes Quadrat

  //T
  fill (126, 145, 162);
  rect (295, 60, 45, 15); //oben
  rect (310, 80, 15, 45); //unten
  
  //Y
  rect (350, 60, 15, 40); //links
  rect (350, 110, 40, 15); //unten links
  rect (395, 60, 15, 65); //rechts
  fill (16, 20, 32);
  rect (372, 85, 15,15); //schwarzes Quadrat
  
  //L
  fill (126, 145, 162);
  rect (420, 60, 15, 45); //links 
  rect (420, 110, 55, 15); //unten
  rect (460, 60, 15, 15); //Quadrat
  
//Unterer Teil

  //schwarze Rechtecke
    fill (22, 35, 51);
    rect (60, 150, 45, 225); //Balken Schwarz links
    rect (60, 385, 60, 90); //gestauchtes Rechteck Schwarz links
  
    rect (300, 150, 180, 35); //Balken oben rechts
  
    rect (435, 295, 45, 205); //Balken rechts
    rect (180, 505, 300, 55); //Balken unten rechts
    
  stroke (175, 173, 162);
  
  //graue Rechtecke
  fill (153, 169, 184);
    //Streifen links
    rect (60, 485, 110, 15); //1.Streifen
    rect (60, 505, 110, 15); //2.Streifen
    rect (60, 525, 110, 15); //3.Streifen
    rect (60, 545, 110, 15); //4.Streifen
    
    //Dreier gespann oben links
    rect (110, 150, 90, 90); //Rechteck oben links
    rect (110, 245, 60, 105); //Rechteck drunter links
    rect (205, 150, 90, 70); //Rechteck oben rechts
    
    //Streifen rechts
    rect (405, 190, 15, 100); //1. Streifen
    rect (425, 190, 15, 100); //2. Streifen
    rect (445, 190, 15, 100); //3. Streifen
    rect (465, 190, 15, 100); //4. Streifen
    
    //Dreiergespann unten rechts
    rect (320, 420, 110, 80); //Rechteck unten rechts
    rect (225, 440, 90, 60); //Rechteck unten links
    rect (385, 315, 45, 100); //Rechteck oben rechts
  
  //Farbige Rechtecke
    //Gelb
    fill (230, 180, 29);
    rect (235, 225, 55, 15); //oben
    rect (240, 415, 60, 15); //unten
    
    //Blau
    fill (50, 109, 165);
    rect (180, 305, 20, 45); //links
    rect (355, 315, 20, 45); //rechts
    
    //Rot
    fill (156, 17, 10);
    rect (260, 315, 35, 35);
    
    
 //Kürzel
 noStroke ();
 fill (166, 170, 169);
 rect (465, 604, 60, 5);
    
