
//Int per propietats de la linia
  int linia1 = 0;
  int linia2 = 0;
  int gruixlinia = 3;


void setup() {
  
size(900,900);
background (255);

}

void draw () { 
 //Amb aquests keyPressed, es configurará els diferents colors 
 
   if (keyPressed){
   
     //Random del color de fons
     if(key == 'r' || key == 'R') {
        background(random(255),random(255),random(255));
    }
    
   //Random fons verd
      else if(key == '1') {
        background(0,random(200),0);
    }
    
   //Random fons vermell
      else if(key == '2') {
        background(random(200),0,0);
    }
    
   //Random fons blau 
      else if(key == '3') {
        background(0,0,random(200));
    }
    
   //Random llapis 
      else if(key == '4') {
        stroke (random(255),random(255),random(255));
        line (mouseX, mouseY, pmouseX, pmouseY);
    }

   //Llapis verd
      else if(key == '5') {
        stroke (0,200,0);
        line (mouseX, mouseY, pmouseX, pmouseY);
    }
    
   //Llapis vermell
      else if(key == '6') {
        stroke (200,0,0);
        line (mouseX, mouseY, pmouseX, pmouseY);
    }
    
   //Llapis blau
      else if(key == '7') {
        stroke (0,0,200);
        line (mouseX, mouseY, pmouseX, pmouseY);
    }
   //Llapis negre 
    else if(key == '8') {
        stroke (0);
        line (mouseX, mouseY, pmouseX, pmouseY);
    }
   //c per tornar-ho tot a blanc
        if(key == 'c' || key == 'C') {
          background(255,255,255);
    }
    
   //d per utilitzar un petit esborrador (va esborrant-ho tot)
      else if(key == 'd' || key == 'D') {
        stroke (255);
        line (mouseX, mouseY, pmouseX, pmouseY);
        
    }
    
   //Dibuixar quadrats random només clicant m
      else if(key == 'm' || key == 'M') {
        fill(random(200),random(200),random(200));
        rect(mouseX,mouseY, pmouseX, pmouseY);
    }
    
      
   }   
 
//premer, per dibuixar la linia
   if (mousePressed) {
    strokeWeight(gruixlinia);
    line (mouseX, mouseY, pmouseX, pmouseY);   
    linia1 = mouseX;
    linia2 = mouseY;
   } 
  
}

//Amb el key pressed, també podem fer que el gruix de la linia 
//varii segons les nostres necesitats 
 void keyPressed()   {
   if (key == '+') {
    gruixlinia = gruixlinia +3;
   }
   if (key == '-') {
    gruixlinia = gruixlinia -3;     
   }
}


