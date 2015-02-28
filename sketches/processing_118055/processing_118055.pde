
//Name_kubistisch_Dominik_Meixner_Aufgabe_2

//Fläche

size(800,500);     
background(255);
{
  
 //Rahmen
 {
   fill(168,159,142,125);
    rect(1, 1, 799, 10);
    rect(11,490,779, 10);
    rect(1,11,10,798);
    rect(790,11,10,498);
  
  //Name unten rechts
  {
   textSize(9);    //TEXT
    fill(38,38,45);
     text("Dominik R. Meixner", 690, 483); 
     
     textSize(9);    //TEXT
    fill(38,38,45);
     text("Version 1", 690, 470); 
     
  }
  

 }

  
pushMatrix(); // Klammer auf 
 translate(96,100);
 
 {  
   
//D
   {
 
    noStroke();
    fill(123,140,157);
     rect(50,100,20,80);
     

       fill(132,121,255);

        rect(75,100,20,15);
     
     
         fill(38,38,45);
          ellipse(85,170,20,20);
           rect(100,120,15,40);
    
  
    }
     
//O
    { noStroke();
      fill(123,140,157); 
       rect(135,120,15,40); 
        ellipse(165,110,20,20);
      
         fill(38,38,45);
           ellipse(165,170,20,20);
         
             fill(132,121,255);
              rect(180,120,15,40);
     }
     
//M
     {
      noStroke();
      fill(123,140,157); 
       rect(215,100,15,80);
       rect(310,100,15,80);
       
        fill(38,38,45);
         rect(240,100,60,15);
         rect(263,120,15,20);
            
       }
      
//I
      {
       noStroke();
       fill(123,140,157); 
        rect(345,130,15,50);
        
              fill(132,121,255);
               rect(345,100,15,25);
       }
       
//N
       {
        noStroke();
        fill(123,140,157); 
         rect(380,100,15,80);
       
          fill(38,38,45);
           ellipse(410,110,20,20);
           
            fill(123,140,157);
             rect(425,100,15,80);
       }
       
//I
       {
        noStroke();
        fill(123,140,157);
         rect(460,130,15,50);
         
          fill(38,38,45);
           rect(460,100,15,25);
        }
        
//K
        {
         noStroke();
         fill(123,140,157);
          rect(495,100,15,80);
          
           fill(132,121,255);
           ellipse(528,145,20,20);
          
            fill(38,38,45);
             rect(540,160,15,20);
             
              
              
                fill(132,121,255);
                 rect(540,110,15,20);
             
              
        }
  }

popMatrix();
resetMatrix(); // Klammer zu

}
