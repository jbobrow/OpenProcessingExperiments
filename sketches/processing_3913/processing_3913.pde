
     
     //int block = rect (mouseX, mouseY, 4, 4,)
     
     void setup() {
       size(400, 400);
       background (255, 235, 118);
       PFont font;
       font = loadFont("AgencyFB-Reg-24.vlw"); 
       textFont(font);
       fill (0, 102, 153); 
       String s = "Red Centre";
       text(s, 150, 20, 100, 100);
        PFont font2;
       font2 = loadFont("AgencyFB-Reg-24.vlw"); 
       textFont(font2);
       fill (0, 102, 153); 
       String a = "Anzac Walkway";
       text(a, 100, 320, 100, 100);
       
       color redcentre = color  (240, 81, 31);
       fill (redcentre);
       rect (100, 150, 180, 100);
       color path = color (100, 100, 100);
       fill (path);
       rect (0, 250, 399, 50);
       color path2 = color (100, 100, 100);
       fill (path2);
       rect (0, 110, 399, 30);
     }
		  
     void draw() {
       //rect (mouseX, mouseY, mouseX, mouseY);
         if(mousePressed) { 
     stroke(234, 21, 221); 
   } else { 
     stroke(0); 
     } 
     line(mouseX+4, mouseY, mouseX, mouseY);
     
     color centre = color(240, 81, 31); 
     fill(centre); 
     rect(100, 150, 180, 100); 

     }
     

