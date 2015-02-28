


size(600,500);
background (48,50,62);      // grau
smooth();

fill (187,201,210);  
ellipse(220,275,190,180);    //Ellipse1 grau


//Gelber bogen

fill (237,180,5);                    // gelb
beginShape();
vertex(220,130);
bezierVertex(280,120, 280, 155,340, 80);
bezierVertex(340,80, 310, 160, 210, 135);
endShape();

//rot bogen

fill (255, 0, 0);           //volles Rot
beginShape();
vertex(220,160);
bezierVertex(330,150, 280, 165,390, 80);
bezierVertex(390,80, 330, 190, 210, 170);
endShape();

//Letzte reihe

fill (150,135,204);            //weis gelb
rect (245,290,25,30);           

fill (242,130,5,235);            //tranzparent gelb
rect (245,320,25,30);  


fill (0,0,0,240);
ellipse(220,275,85,85);        //Kreis schwarz


fill (55,165,224,240);  
ellipse(420,225,85,80);    //Ellipse1 grün 



fill (237,180,5, 190);    
ellipse(105,225,130,135);    //Ellipse1 gelb

fill (16,16,16);            //hellschwarz 
rect (0,215,550,25);         // strich horizontal


fill (0);                    // schwarz
rect (225,35,15,465);        // mittel strich senkrecht






fill (255, 0, 0);           //volles Rot
rect (115,145,10,225);        // 1. strich senkrecht

fill (16,16,16);            //hellschwarz 
rect (115,160,10,131);        // strich im roten


fill (0);                    // schwarz
rect (405,15,30,395);        // außen strich senkrecht

//kästchen bund unten/links
fill (0);                    // schwarz
rect (405,290,30,30);     

fill (187,201,210);          //weisgrau
rect (405,320,30,30);       

fill (67,111,26);            //grün
rect (405,350,30,30);       

fill (223,173,12);        //gelb
rect (405,380,30,30);       


//2.Reihe


fill (216,35,29);                    // rot
rect (375,290,30,30);     

fill (55,100,191);          //blau
rect (375,320,30,30);       

fill (16,16,16);            //hellschwarz
rect (375,350,30,30);       

fill (58,162,223);        //türkies
rect (375,380,30,30);       


//3.Reihe


fill (16,16,16);            //hellschwarz
rect (345,290,30,30);     

fill (215,195,124);          //oker
rect (345,320,30,30);       

fill (179,41,41);            //dunkelrot
rect (345,350,30,30);       

fill (16,16,16);            //hellschwarz
rect (345,380,30,30);       

//4.Reihe

fill (160,196,218);            //blaugrau
rect (315,290,30,30);     

fill (16,16,16);            //hellschwarz
rect (315,320,30,30);       

fill (187,201,210);          //weisgrau
rect (315,350,30,30);       

fill (233,158,13);            //dunkelgelb
rect (315,380,30,30);  


//5.Reihe


fill (242,130,5,235);            //tranzparent gelb
rect (285,290,30,30);     

fill (212,16,17,230);            //tranzparent rot
rect (285,320,30,30);           

fill (221,48,42);            //rot
rect (255,380,60,30);  


//Reihe schmal


fill (242,130,5,235);            //tranzparent gelb
rect (270,260,15,30);     

fill (215,195,124);          //oker
rect (270,290,15,30);           

fill (16,16,16);            //hellschwarz
rect (270,320,15,30);  




fill (0);                    // schwarz
rect (310,290,8,190);        // kleiner strich unten

//Reihe Oben:1





fill (207,141,83);

rect (40,45,30,10);       

fill (0);                    // schwarz
rect (40,55,30,20);       

fill (215,195,124);          //oker
rect (40,75,15,10);       

fill (0);                    // schwarz
rect (40,85,15,10);     

fill (187,201,210);          //weisgrau
rect (40,95,15,10);       

fill (0);                    // schwarz
rect (40,105,15,10);       

//oben 2

  
fill (215,195,124);          //oker
rect (70,45,30,10);       

fill (0);                    // schwarz
rect (70,55,30,20);       

fill (212,27,32);          //rot
rect (55,75,15,10);       

fill (215,195,124);          //oker
rect (55,85,15,10);     

fill (142,135,212);                    // lila
rect (55,95,15,10);   

fill (192,89,44);                    // terra
rect (55,105,15,10);     
// mitte

fill (142,135,212);                    // lila
rect (70,55,30,20);

fill (0);                    // schwarz
rect (70,75,30,10);    

fill (192,89,44);                    // terra
rect (70,85,30,10);       

fill (0);                    // schwarz
rect (70,95,30,20);    

fill (215,195,124);          //oker
rect (70,105,30,10);    


//obere lienie

fill (216,35,29);  //Rot
rect (100,45,10,10);

fill (0);                    // schwarz
rect (110,45,20,10); 

fill (215,195,124);          //oker
rect (130,45,20,10); 

fill (187,201,210);          //weisgrau
rect (140,45,10,10); 

// rechteseite

fill (142,135,212);                    // lila
rect (140,55,10,20); 

fill (0);                    // schwarz
rect (140,75,10,10); 

fill (223,173,12);        //gelb
rect (140,85,10,20); 

fill (0);                    // schwarz
rect (140,95,10,10); 

fill (55,100,191);          //blau
rect (140,105,10,10); 


//2.von rechts

fill (0);                    // schwarz
rect (130,55,10,20); 

fill (221,48,42);            //rot
rect (130,75,10,10); 

fill (0);                    // schwarz
rect (130,85,10,20); 

fill (55,100,191);          //blau
rect (130,95,10,10); 

fill (215,195,124);          //oker
rect (130,105,10,10); 

//3.von rechts

fill (192,89,44);                    // terra
rect (120,55,10,20); 

fill (0);                    // schwarz
rect (120,75,10,10); 

fill (192,89,44);                    // terra
rect (120,85,10,20); 

fill (0);                    // schwarz
rect (120,95,10,10); 

fill (221,48,42);            //rot
rect (120,105,10,10); 


//4.von rechts

fill (207,187,162);                    // hellsand
rect (110,55,10,20); 

fill (192,89,44);                    // terra
rect (110,75,10,10); 

fill (214,195,137);                    // hell
rect (110,85,10,20); 

fill (203,175,153);                    // sand
rect (110,95,10,10); 

fill (142,135,212);                    // lila
rect (110,105,10,10); 

//5. von rechts
fill (0);                    // schwarz
rect (100,55,10,20); 

fill (214,195,137);                    // hell
rect (100,75,10,10); 

fill (0);                    // schwarz
rect (100,85,10,20); 

fill (142,135,212);                    // lila
rect (100,95,10,10); 

fill (223,173,12);        //gelb
rect (100,105,10,10); 


// bögen

fill (0);                    // schwarz
beginShape();
vertex(200, 65);
bezierVertex(350,50, 320, 200, 310, 200);
bezierVertex(308,200, 340, 50, 200, 65);
endShape();




fill (0);                    // schwarz
beginShape();
vertex(200, 85);
bezierVertex(330,70, 280, 200, 290, 200);
bezierVertex(288,200, 310, 90, 200, 85);
endShape();

noStroke();
fill(48,50,62);      // grau
beginShape();
vertex(405,15);
bezierVertex(480, 10, 490, 40,435,80);
bezierVertex(435, 80, 440, 25, 405, 15);
endShape();




