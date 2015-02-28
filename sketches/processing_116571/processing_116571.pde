
//Aufgabe 1 De Stile Nachbau Dominik Meixner

 size(611,720);
 background(234,234,227);


 //Rahmen
 {
 fill(168,159,142,125);
  rect(1, 1, 609, 10);
  rect(1,709, 609, 10);
  rect(1,11,10,698);
  rect(600,11,10,698);
 }

 //Schrift: De Styl
{  
 translate(5,0);
  fill(123,140,157);
  noStroke();
   rect(50,50,55,20); // D
   rect(75,110,55,15);
   rect(110,50,20,55);
   rect(50,75,20,50);
   
   rect(150,50,70,18); // E
   rect(175,110,45,16);
   rect(150,73,20,53);
    {
      fill(38,38,45);
      {
       rect(175,78,23,23);
      }
    }
   
   
   fill(123,140,157); // S
    rect(278,50,52,18);
    rect(250,110,50,16);
    {
      fill(38,38,45);
      {
       rect(278,78,23,23);
      }
    }
    
  fill(123,140,157);
   rect(250,50,20,51);
   rect(308,78,20,48);
   
   rect(340,50,60,18);//T
   rect(360,73,18,53);
   
   rect(410,50,18,43);//Y
   rect(410,110,50,14);
   {
      fill(38,38,45);
      {
       rect(435,70,23,23);
      }
      fill(123,140,157);
       rect(465,50,16,74);
     }
     
  rect(490,50,16,50);//L
  rect(490,106,58,17);
  rect(525,50,23,23);

textSize(9);    //TEXT
text("COMRI9IG V.HUSZAR", 499, 703); 
fill(38,38,45);
  
     
     

 //Unterer Bereich:(Dunkelblau fast schwarz);
 {
 fill(38,38,45);
  rect(50,160,60,280);
  rect(50,450,90,127);
  rect(340,160,210,40);
  rect(200,604,350,61);
  rect(490,310,60,288);
  
  
 }

 //Unterer Bereich:(Blaugrau);
 {
  fill(123,140,157);
   rect(120,160,100,120);//OBEN links
   rect(230,160,100,80);
   rect(120,290,70,110);
   
   {
    translate(5,0);
     rect(530,205,15,100); //RECHTs oben
     rect(510,205,15,100);
     rect(490,205,15,100);
     rect(470,205,15,100);
    }
   rect(50,590,135,15); //UNTEN links
   rect(50,610,135,15);
   rect(50,630,135,15);
   rect(50,650,135,15);
   
   rect(420,360,58,130);//Gruppierung unten rechts;
   rect(360,495,117,103);
   rect(230,518,120,80); 
   
   
  }
 
 //Untererbereich (Gelb);
 {
 fill(230,181,35);
  rect(245,250,80,25);//Oben
  rect(245,485,80,25);//Unten
  }

 //Unterer Bereich (Blau);
 {
  fill(53,113,172);
   rect(205,335,30,65);
   rect(380,360,30,65);
  
 }
 
 //Unterer Bereich (Rot);
 {
  fill(156,18,4);
   rect(290,360,40,40);
  
 }
}
