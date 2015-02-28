

      
      PShape form;
       PShape form1;
       
      float x;
      float y;
      int s  = 3;
      boolean sizeBrush = false;
      boolean isBrush = false;
      int brushshape;
      color col;
      color stroke1 = color(255);
      color strokecolor;
      
       
      void setup() {
        size(800, 600);
        fill(0);
        

        background(255);
        smooth();
        frameRate(50);
        
        x = width/2;
        y = height/2;
        
         
        form = loadShape("runderPinsel.svg"); 
        form1 = loadShape("sprayPinsel.svg"); 
        
        PFont font;
        font = loadFont("HelveticaNeue-12.vlw");
        textFont(font); 
        
       
        
        fill(0);

        
        text("current Color:", 650, 570);
        rect(5, 35, 180, 280);
        text("Menue", 15, 30);
        fill(255);
            text("schwarzer Hintergrund = (f)", 15, 60);
            text("weißer Hintergrund = (d)", 15, 80);
            text("Linie (onlyStroke) = (9)", 15, 100);
            text("Ellipsn = (8)", 15, 120);
            text("Lade Illu. Brush = (5)", 15, 140);
            text("Lade Illu. SprayBrush = (6)", 15, 160);
            text("LÖSCHE BRUSH = (7)", 15, 180);
            text("gelb = (1)", 15, 200);
            text("blau = (2)", 15, 220);
            text("lila = (3)", 15, 240);
            text("rot = (4)", 15, 260);
            text("random Farbe  = (Leertaste)", 15, 280);
            text("Bild abspeichern = (s)", 15, 300);
      }
      
      void keyReleased() {
    
        switch (key) {
          
          case '8': sizeBrush = true;
                    break; 
          case '9': sizeBrush = false;
                    break;
          case '5': brushshape = 1;
                    isBrush = true;
                    break;   
          case '6': brushshape = 2;
                    isBrush = true;
                    break;       
          case '7': isBrush = false;
                    break;            
          case '1': col = color(181,157,0,100);//gelb
                    strokecolor = color(181,157,0,100);
                    break;              
          case '2': col = color(0,130,164,100);//blau
                    strokecolor = color(0,130,164,100);
                    break;             
          case '3': col = color(87,35,129,100);//lila
                    strokecolor = color(87,35,129,100);
                    break;             
          case '4': col = color(197,0,123,100);//rot
                    strokecolor = color(197,0,123,100);
                    break;                            
          case ' ': col = color(random(255),random(255),random(255),random(10, 150));
                    strokecolor = color(random(255),random(255),random(255),random(10, 150));//random color
                    break;  

        }
       
        if (key == 'd'){background(255);
             	
             fill(col);
            stroke(strokecolor);
            strokeWeight(5);
            rect(750,550, 30, 30);
            
            fill(0);
            text("current Color:", 650, 570);
            noStroke();
            rect(5, 35, 180, 280);
            text("Menue", 15, 30);
            fill(255);
            
            strokecolor = 0; 
            stroke(strokecolor);
            
            text("schwarzer Hintergrund = (f)", 15, 60);
            text("weißer Hintergrund = (d)", 15, 80);
            text("Linie (onlyStroke) = (9)", 15, 100);
            text("Ellipsn = (8)", 15, 120);
            text("Lade Illu. Brush = (5)", 15, 140);
            text("Lade Illu. SprayBrush = (6)", 15, 160);
            text("LÖSCHE BRUSH = (7)", 15, 180);
            text("gelb = (1)", 15, 200);
            text("blau = (2)", 15, 220);
            text("lila = (3)", 15, 240);
            text("rot = (4)", 15, 260);
            text("random Farbe  = (Leertaste)", 15, 280);
            text("Bild abspeichern = (s)", 15, 300);
        }
        
        if (key == 'f'){background(0); 
            
            fill(col);
            stroke(strokecolor);
            strokeWeight(5);
            rect(750,550, 30, 30);
            
            fill(255);

            text("current Color:", 650, 570);
            noStroke();
            rect(5, 35, 180, 280);
            text("Menue", 15, 30);
        
            fill(0);
            
            strokecolor = 255; 
            stroke(strokecolor);
            text("schwarzer Hintergrund = (f)", 15, 60);
            text("weißer Hintergrund = (d)", 15, 80);
            text("Linie (onlyStroke) = (9)", 15, 100);
            text("Ellipsn = (8)", 15, 120);
            text("Lade Illu. Brush = (5)", 15, 140);
            text("Lade Illu. SprayBrush = (6)", 15, 160);
            text("LÖSCHE BRUSH = (7)", 15, 180);
            text("gelb = (1)", 15, 200);
            text("blau = (2)", 15, 220);
            text("lila = (3)", 15, 240);
            text("rot = (4)", 15, 260);
            text("random Farbe  = (Leertaste)", 15, 280);
            text("Bild abspeichern = (s)", 15, 300);
        }
        
        if (key == 's' || key == 'S'){ saveFrame(timestamp()+"_#.png");//bild abspeichern
            fill(255,0,0);
            text("Bild abgespeichert!", 15, 330);}
      }
      
      void draw() {
          noStroke();
         
          fill(col);
          stroke(strokecolor);
          strokeWeight(5);
          rect(750,550, 30, 30);
         
  
          //random Pinsel
          if (mousePressed && (mouseButton == RIGHT)) {       
             fill(col);
             ellipse(x, y, 20, 30);     
          }
        
          //großer Pinsel
          if (mousePressed && (mouseButton == LEFT) && isBrush == false && sizeBrush  == false) {      
              float abstand = dist(pmouseX, pmouseY, mouseX, mouseY);
              if(abstand > 20) {
                   abstand = 20;
                }
              
              strokeWeight(20-abstand); 
              stroke(strokecolor);
              fill(col);
              line(pmouseX, pmouseY, mouseX, mouseY);   
          }
          
          //kleiner Pinsel
          if (mousePressed && (mouseButton == LEFT) && isBrush == false && sizeBrush  == true){      
            float d1 = dist(pmouseX, pmouseY, mouseX, mouseY);
              color c1 = color(col);
              fill(c1);
              noStroke();
              ellipse(mouseX, mouseY, d1, d1); 
          }
         
            
              //kleiner Pinsel
          if (mousePressed && (mouseButton == LEFT) && isBrush == true && brushshape == 1){   
            shape(form,mouseX,mouseY,30,30);
          } else {   
                if (mousePressed && (mouseButton == LEFT) && isBrush == true && brushshape == 2){   
                shape(form1,mouseX,mouseY,30,30);
              }
          }       
        
   }
      
      String timestamp() {
        Calendar now = Calendar.getInstance();
        return String.format("MeinBild", now);
      }


