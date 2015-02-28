
     PFont t;  

     int sangreX = 112;
     int sangreY = 518;
     
     int ojosX = 263 ;
     int ojosY = 518 ;
     
     int fadeX = 414;
     int fadeY = 518;

     int buttonW = 75;
     int buttonH = 13;
     
     float vv;
     float ff;
     
     
     float margin;
     float vampX;
     float vampY;
     float buttonX;
     float buttonY;
     float e; /*fangs blood */
     float f; /*Fade*/
     
     float ojos;
     float ojosR;
     
     boolean buttonOjos = false;
     boolean buttonFade = false;
   
   void setup()  {  
        size (600,600); 
        background(255); 
        smooth(); 
        buttonX = width/4;
        buttonY = height/8*7;
        ojos = 25;

        t = loadFont( "ArialMT-16.vlw" ); 

        e = 0;   
        f = 0;
        ff = 255;
        
        vv = 0;
    }   

   void draw()  {  

        margin = (100);
        vampX = width/2;
        vampY = height/3;   
        ojosR = random (20,30);
        

              
              rectMode(CENTER); 
              fill (0);
              noStroke ();  /* ojos */
                  ellipse(vampX-40,vampY-20, ojos, ojos);
                  ellipse(vampX+40,vampY-20, ojos, ojos);
                  
             /* Sangre colmillos */
              if (mouseX > sangreX && mouseX < sangreX + buttonW && mouseY > sangreY && mouseY < sangreY + buttonH && mousePressed) {
                             
                rectMode (CORNERS);
                noStroke ();
                fill (255,0,0);
                  rect (270,240, 290, 240+e);
                  rect (310,240, 330, 240+e);
                  e = e +1; 
    
                ellipseMode (CENTER);
                fill (e,0,0);
                noStroke ();
                  ellipse(vampX-40,vampY-20, ojos, ojos);
                  ellipse(vampX+40,vampY-20, ojos, ojos);
                  
              }


              /* BOTONES */
              
              /* 1er BOTON */
        rectMode (CENTER);
        fill (0);
        noStroke ();
          if (mouseX > sangreX && mouseX < sangreX + buttonW && mouseY > sangreY && mouseY < sangreY + buttonH) {
          fill (125);
          noStroke ();
          rect (buttonX, buttonY, buttonX/2, buttonY/40);
          } else {
          fill (0);
          noStroke;
          rect (buttonX, buttonY, buttonX/2, buttonY/40);
             }
             
              /* 2do BOTON  */
          if (mouseX > ojosX && mouseX < ojosX + buttonW && mouseY > ojosY && mouseY < ojosY + buttonH) {
              rectMode (CENTER);
              fill (125);
              noStroke ();
                rect (buttonX*2, buttonY, buttonX/2, buttonY/40);
          }  else {
              rectMode (CENTER);
              noStroke ();
              fill (0);
                rect (buttonX*2, buttonY, buttonX/2, buttonY/40);
          }

                /* 3er BOTON           
         if (mouseX > fadeX && mouseX < fadeX + buttonW && mouseY > fadeY && mouseY < fadeY + buttonH) {
         
         rectMode (CENTER);
              fill (125);
              noStroke ();
                rect (buttonX*3, buttonY, buttonX/2, buttonY/40);
          }  else {  } */ 
          
              rectMode (CENTER);
              noStroke ();
              fill (0);
                rect (buttonX*3, buttonY, buttonX/2, buttonY/40);
         
          

          if (buttonOjos) {

            /* CUADRO BCO DETRÁS DE OJOS */
              rectMode (CENTER);
              noStroke ();
              fill (255, ff);
                  rect (width/2,vampY-20,150,50);  
                                  
              ojos = ojosR;
              
            rectMode(CENTER); /* ojos */
              fill (0);
              noStroke ();  
                  ellipse(vampX-40,vampY-20, ojosR, ojosR);
                  ellipse(vampX+40,vampY-20,ojosR, ojosR);
             }
           
            if (buttonFade) {
              ff = 0;
                /*  FADE OUT Y TEXTO "END" */
                rectMode (CENTER);
                fill (0,f);
                  rect (width/2,height/2, 600,600);
                  f=f+1;
                  
                textFont(t,16); // Step 4: Specify font to be used
                fill(255);     // Step 5: Specify font color
                
                // Step 6: Display Text
                text ( "the END" ,270,340);
                
                vv = 255;
          }  
             /* rectMode(CENTER);  /* CUERPO FONDO BCO
                 noStroke ();
                 fill (255, vv);
                 rect (vampX, vampY, 200,200); */
                 
                 
              
                  
             /* CUERPO Y COLMILLOS */
             rectMode(CENTER); 
             noFill();
             strokeWeight (10);
             stroke (0); /* cuerpo */
             rect (vampX,vampY,200,200);
             
             strokeWeight(5);
              fill(0); /* colmillos */
                  line(vampX-30, vampY+30,vampX-20,vampY+50);
                  line(vampX-20,vampY+50,vampX-10,vampY+30);
                  line (vampX+30,vampY+30,vampX+20,vampY+50);
                  line (vampX+20,vampY+50,vampX+10,vampY+30);
   }
   
void keyPressed () {
background (255);
      e = 0;
   }


void mousePressed () {    /* parpadeo */

         if (mouseX > ojosX && mouseX < ojosX + buttonW && mouseY > ojosY && mouseY < ojosY + buttonH)  { 
         buttonOjos = !buttonOjos;
          }
          
         if (mouseX > fadeX && mouseX < fadeX + buttonW && mouseY > fadeY && mouseY < fadeY + buttonH) {
         buttonFade = true ;
          }
}


