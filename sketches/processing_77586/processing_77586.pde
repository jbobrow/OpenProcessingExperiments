
//René Bergenroth
//Auswahlboxen aktivierungslienien
PFont font;

int s1 ;
int s2 ;
int s3 ;
int s4 ;
int s5 ;
int s6 ;

int counter = 0;
int sparkle = 0;

//Strichdicke

int strok = 10 ;
int savecount = 1;

color c = color (255,255,255);

//Modus

int mode = 0;

void setup(){
  background(0);
   frameRate(25);
    smooth();
     size(800,600);
      font = createFont("Arial", 12, true); textFont(font, 14);
}

void draw(){
  
  if(strok < 1){strok = 10;}
  
  sparkle++;
  counter++;
  if(counter >121){counter = 0;}
  
//box links
  stroke(170);
   strokeWeight(5);
    fill(125);
     rect(-60,0,260,600,60);
     
//Auswahl Boxen
  
  fill(255);
   
   strokeWeight(s1);
    rect(25,50,125,50,10);
    
   strokeWeight(s2);
    rect(25,125,125,50,10);
    
   strokeWeight(s3);
    rect(25,200,125,50,10);
    
   strokeWeight(s4);
    rect(25,275,125,50,10);
    
   strokeWeight(s5);
    rect(25,350,125,50,10);
    
   strokeWeight(s6);
    rect(25,425,125,50,10);
    
//Strichdicke Boxen

   strokeWeight(3);
    rect(25,500,25,25,5);
     rect(75,500,25,25,5);
    
// Zeichentool

if (mode == 5){
  if(savecount > 1){mode =0;} println(counter);
   fill(0);
    noStroke();
     rect(0,0,210,600);
      fill(255);
       text("Vielen Dank" ,40 ,40);
        text("Fürs Benutzen" ,40 ,80);
         text("Rene Bergenroth" ,40 ,520);
          saveFrame("dein.Bild"+savecount+".jpg");
           savecount++;
}
       
  //Magic Style
  
  if(mode == 21){
  if(mousePressed){
   stroke(random(171,222),random(0,55),random(244,255));
     strokeWeight(strok);
      if(mousePressed){
       line(pmouseX,pmouseY,mouseX,mouseY);
        noStroke();
  
   float sparkelxy = random(10); 
  
  
    fill(255);
     ellipse(mouseX + random(-30-strok,30+strok),mouseY + random(-30-strok,30+strok), sparkelxy,sparkelxy);
  
    fill(255);
     ellipse(mouseX + random(-20-strok,20+strok),mouseY + random(-20-strok,20+strok), sparkelxy,sparkelxy);
  
    fill(255);
     ellipse(mouseX + random(-40-strok,40+strok),mouseY + random(-40-strok,40+strok), sparkelxy,sparkelxy);
      }
  }
  }
  
  if(mode ==22){
    if(mousePressed){
      beginShape();
       float mx = mouseX;
       float my = mouseY;
       strokeWeight(random(1,2));
       stroke(random(60,242),random(236,90),random(40,63),175);
       noFill();
       float mxrandom = random(10,25);
       float myrandom = random(30,60);
        beginShape();
        vertex(mx,my);
        bezierVertex(mx,my,mx,my-30,mx+mxrandom,my-myrandom);
        endShape();
        beginShape();
        vertex(mx,my);
        bezierVertex(mx,my,mx,my-30,mx-random(5,15),my-random(10,40));
        endShape();
        
        if(counter == 110){
          noStroke();
          fill(149,44,103);
          ellipse(mx+mxrandom+5,my-myrandom,10,10);
          ellipse(mx+mxrandom-5,my-myrandom,10,10);
          ellipse(mx+mxrandom,my-myrandom+5,10,10);
          ellipse(mx+mxrandom,my-myrandom-5,10,10);
          fill(243,238,81);
          ellipse(mx+mxrandom,my-myrandom,10,10);
        }
        if(counter == 55){
          noStroke();
          fill(149,44,103);
          ellipse(mx+mxrandom+5,my-myrandom,10,10);
          ellipse(mx+mxrandom-5,my-myrandom,10,10);
          ellipse(mx+mxrandom,my-myrandom+5,10,10);
          ellipse(mx+mxrandom,my-myrandom-5,10,10);
          fill(243,238,81);
          ellipse(mx+mxrandom,my-myrandom,10,10);
        }
    }
  }
  
  if (mode == 22) {
      
      if(mousePressed){
     //erster kasten
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 50) && (mouseY < 50+50)){
     s1 = 10; s2 = 1; s3 = 1; s4 = 1; s5 = 1; s6 = 1;
      mode =21;
      }
   // 2 Kasten
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 125) && (mouseY < 125+50)){
     s1 = 1; s2 = 10; s3 = 1; s4 = 1; s5 = 1; s6 = 1;
      mode =22;
      }
   // 3 Kasten
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 200) && (mouseY < 200+50)){
     s1 = 1; s2 = 1; s3 = 10; s4 = 1; s5 = 1; s6 = 1;
      //leer
   // 4 Kasten
      } 
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 275) && (mouseY < 275+50)){
     s1 = 1; s2 = 1; s3 = 1; s4 = 10; s5 = 1; s6 = 1;
      //leer
   // 5 Kasten
      }
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 350) && (mouseY < 350+50)){
     s1 = 1; s2 = 1; s3 = 1; s4 = 1; s5 = 10; s6 = 1;
      //leer
   // 6 Kasten
      }
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 425) && (mouseY < 425+50)){
     s1 = 1; s2 = 1; s3 = 1; s4 = 1; s5 = 1; s6 = 10;
      mode = 0;
      }
   // Strich dicke Kasten links 
  
     if((mouseX > 25) && (mouseX < 25+25) && (mouseY > 500) && (mouseY < 500+25)){
      strok++;
      }
   // Strich dicke Kasten rechts 
   
     if((mouseX > 75) && (mouseX < 75+25) && (mouseY > 500) && (mouseY < 500+25)){
      strok--;
      }
     }
 }  
  
    if (mode == 21) {
      
      if(mousePressed){
     //erster kasten
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 50) && (mouseY < 50+50)){
     s1 = 10; s2 = 1; s3 = 1; s4 = 1; s5 = 1; s6 = 1;
      mode =21;
      }
   // 2 Kasten
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 125) && (mouseY < 125+50)){
     s1 = 1; s2 = 10; s3 = 1; s4 = 1; s5 = 1; s6 = 1;
      mode =22;
      }
   // 3 Kasten
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 200) && (mouseY < 200+50)){
     s1 = 1; s2 = 1; s3 = 10; s4 = 1; s5 = 1; s6 = 1;
      c = color (0,255,0);
   // 4 Kasten
      } 
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 275) && (mouseY < 275+50)){
     s1 = 1; s2 = 1; s3 = 1; s4 = 10; s5 = 1; s6 = 1;
      c = color (255,0,255);
   // 5 Kasten
      }
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 350) && (mouseY < 350+50)){
     s1 = 1; s2 = 1; s3 = 1; s4 = 1; s5 = 10; s6 = 1;
      c= color (0,0,255);
   // 6 Kasten
      }
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 425) && (mouseY < 425+50)){
     s1 = 1; s2 = 1; s3 = 1; s4 = 1; s5 = 1; s6 = 10;
      mode = 0;
      }
   // Strich dicke Kasten links 
  
     if((mouseX > 25) && (mouseX < 25+25) && (mouseY > 500) && (mouseY < 500+25)){
      strok++;
      }
   // Strich dicke Kasten rechts 
   
     if((mouseX > 75) && (mouseX < 75+25) && (mouseY > 500) && (mouseY < 500+25)){
      strok--;
      }
     }
 }  
  
  if (mode == 2) {
      
      if(mousePressed){
     //erster kasten
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 50) && (mouseY < 50+50)){
     s1 = 10; s2 = 1; s3 = 1; s4 = 1; s5 = 1; s6 = 1;
      mode =21;
      }
   // 2 Kasten
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 125) && (mouseY < 125+50)){
     s1 = 1; s2 = 10; s3 = 1; s4 = 1; s5 = 1; s6 = 1;
      mode=22;
      }
   // 3 Kasten
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 200) && (mouseY < 200+50)){
     s1 = 1; s2 = 1; s3 = 10; s4 = 1; s5 = 1; s6 = 1;
      c = color (0,255,0);
   // 4 Kasten
      } 
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 275) && (mouseY < 275+50)){
     s1 = 1; s2 = 1; s3 = 1; s4 = 10; s5 = 1; s6 = 1;
      c = color (255,0,255);
   // 5 Kasten
      }
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 350) && (mouseY < 350+50)){
     s1 = 1; s2 = 1; s3 = 1; s4 = 1; s5 = 10; s6 = 1;
      c= color (0,0,255);
   // 6 Kasten
      }
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 425) && (mouseY < 425+50)){
     s1 = 1; s2 = 1; s3 = 1; s4 = 1; s5 = 1; s6 = 10;
      mode = 0;
      }
   // Strich dicke Kasten links 
  
     if((mouseX > 25) && (mouseX < 25+25) && (mouseY > 500) && (mouseY < 500+25)){
      strok++;
      }
   // Strich dicke Kasten rechts 
   
     if((mouseX > 75) && (mouseX < 75+25) && (mouseY > 500) && (mouseY < 500+25)){
      strok--;
      }
     }
 }    
      
  
  
    
// Line in 5 Farben

if (mode == 1){
   
   if(mousePressed){
    strokeWeight(strok);
     stroke(c);
      line(mouseX,mouseY,pmouseX,pmouseY);
    }
   
   if(mousePressed){
   //erster kasten
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 50) && (mouseY < 50+50)){
     s1 = 10; s2 = 1; s3 = 1; s4 = 1; s5 = 1; s6 = 1;
      c = color (255,0,0);
      }
   // 2 Kasten
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 125) && (mouseY < 125+50)){
     s1 = 1; s2 = 10; s3 = 1; s4 = 1; s5 = 1; s6 = 1;
      c = color (255,255,0);
      }
   // 3 Kasten
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 200) && (mouseY < 200+50)){
     s1 = 1; s2 = 1; s3 = 10; s4 = 1; s5 = 1; s6 = 1;
      c = color (0,255,0);
   // 4 Kasten
      } 
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 275) && (mouseY < 275+50)){
     s1 = 1; s2 = 1; s3 = 1; s4 = 10; s5 = 1; s6 = 1;
      c = color (255,0,255);
   // 5 Kasten
      }
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 350) && (mouseY < 350+50)){
     s1 = 1; s2 = 1; s3 = 1; s4 = 1; s5 = 10; s6 = 1;
      c= color (0,0,255);
   // 6 Kasten
      }
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 425) && (mouseY < 425+50)){
     s1 = 1; s2 = 1; s3 = 1; s4 = 1; s5 = 1; s6 = 10;
      mode = 0;
      }
   // Strich dicke Kasten links 
  
     if((mouseX > 25) && (mouseX < 25+25) && (mouseY > 500) && (mouseY < 500+25)){
      strok++;
      }
   // Strich dicke Kasten rechts 
   
     if((mouseX > 75) && (mouseX < 75+25) && (mouseY > 500) && (mouseY < 500+25)){
      strok--;
      }
   }
 }

 //Modus 3 Sternen Himmel
 
    //Mondgenerator 
   if(mode == 32){
     if(mousePressed){
           noStroke();
            fill(255,255,200,255);
         beginShape();
  vertex(mouseX,mouseY);
  bezierVertex((mouseX-150),mouseY,(mouseX-150),(mouseY+200),mouseX,(mouseY+200));
  bezierVertex((mouseX-220),(mouseY+270),(mouseX-220),(mouseY-70),mouseX,mouseY);
  endShape();
  mode= 3;
   }
   }
   
   //Sterne Genrator
   if(mode == 31){
    if(sparkle > 10){sparkle = 0;}
     if(counter > 120){mode =3;} println(counter);
    
    noStroke();
     fill(random(200,255),random(200,255),random(200,255),random(100,200));
      ellipse(random(200,800),random(600),sparkle,sparkle);
   }
 
 if(mode == 3){
   
      if(mousePressed){
   //erster kasten
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 50) && (mouseY < 50+50)){
     s1 = 10; s2 = 1; s3 = 1; s4 = 1; s5 = 1; s6 = 1;
      mode = 31;
      }
   // 2 Kasten
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 125) && (mouseY < 125+50)){
     s1 = 1; s2 = 10; s3 = 1; s4 = 1; s5 = 1; s6 = 1;
      mode = 32;
      }
   // 3 Kasten
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 200) && (mouseY < 200+50)){
     s1 = 1; s2 = 1; s3 = 10; s4 = 1; s5 = 1; s6 = 1;
      //leer
   // 4 Kasten
      } 
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 275) && (mouseY < 275+50)){
     s1 = 1; s2 = 1; s3 = 1; s4 = 10; s5 = 1; s6 = 1;
      //leer
   // 5 Kasten
      }
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 350) && (mouseY < 350+50)){
     s1 = 1; s2 = 1; s3 = 1; s4 = 1; s5 = 10; s6 = 1;
      //leer
   // 6 Kasten
      }
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 425) && (mouseY < 425+50)){
     s1 = 1; s2 = 1; s3 = 1; s4 = 1; s5 = 1; s6 = 10;
      mode = 0;
      }
   // Strich dicke Kasten links 
  
     if((mouseX > 25) && (mouseX < 25+25) && (mouseY > 500) && (mouseY < 500+25)){
      strok++;
      }
   // Strich dicke Kasten rechts 
   
     if((mouseX > 75) && (mouseX < 75+25) && (mouseY > 500) && (mouseY < 500+25)){
      strok--;
      }
   }
   

 }

   
 //Startseite

   
   if(mode == 0){
     if(mousePressed){
  
   //erster kasten
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 50) && (mouseY < 50+50)){
     s1 = 10; s2 = 1; s3 = 1; s4 = 1; s5 = 1; s6 = 1;
      mode = 1;
      }
   // 2 Kasten
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 125) && (mouseY < 125+50)){
     s1 = 1; s2 = 10; s3 = 1; s4 = 1; s5 = 1; s6 = 1;
      mode = 2;
      }
   // 3 Kasten
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 200) && (mouseY < 200+50)){
     s1 = 1; s2 = 1; s3 = 10; s4 = 1; s5 = 1; s6 = 1;
      mode = 3;
   // 4 Kasten
      } 
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 275) && (mouseY < 275+50)){
     s1 = 1; s2 = 1; s3 = 1; s4 = 10; s5 = 1; s6 = 1;
             background(0);;
   // 5 Kasten
      }
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 350) && (mouseY < 350+50)){
     s1 = 1; s2 = 1; s3 = 1; s4 = 1; s5 = 10; s6 = 1;
      mode = 5;
   // 6 Kasten
      }
   if((mouseX > 25) && (mouseX < 25+125) && (mouseY > 425) && (mouseY < 425+50)){
     s1 = 1; s2 = 1; s3 = 1; s4 = 1; s5 = 1; s6 = 10;
      mode = 0;
      }
   // Strich dicke Kasten links 
  
     if((mouseX > 25) && (mouseX < 25+25) && (mouseY > 500) && (mouseY < 500+25)){
      strok++;
      }
   // Strich dicke Kasten rechts 
   
     if((mouseX > 75) && (mouseX < 75+25) && (mouseY > 500) && (mouseY < 500+25)){
      strok--;
      }
  }
 }
 
 //Text in Boxen
 
 if(mode == 0){
   
   //Menü
          fill(0);
        text("Menü", 40, 455);
        text("Pinsel", 40, 80);
        text("Magic Style", 40, 155);
        text("Sterne", 40,230);
        text("Alles Löschen", 40, 305);
        text("Bild speichern", 40, 380);
 }
  if(mode == 1){
   
   //Pinsel
          fill(0);
        text("Zurück", 40, 455);
        text("Rot", 40, 80);
        text("Gelb", 40, 155);
        text("Grün", 40,230);
        text("Mangenta", 40, 305);
        text("Blau", 40, 380);
 }
   if(mode == 2){
   
   //Pinsel
          fill(0);
        text("Zurück", 40, 455);
        text("Violett", 40, 80);
        text("Rasen", 40, 155);
        text("--------", 40,230);
        text("--------", 40, 305);
        text("--------", 40, 380);
 }
    if(mode == 21){
   
   //Pinsel
          fill(0);
        text("Zurück", 40, 455);
        text("Violett", 40, 80);
        text("Rasen", 40, 155);
        text("--------", 40,230);
        text("--------", 40, 305);
        text("--------", 40, 380);
 }
    if(mode == 22){
   
   //Pinsel
          fill(0);
        text("Zurück", 40, 455);
        text("Violett", 40, 80);
        text("Rasen", 40, 155);
        text("--------", 40,230);
        text("--------", 40, 305);
        text("--------", 40, 380);
 }
    if(mode == 31){
   
   //Pinsel
          fill(0);
        text("Bitte Warten", 40, 455);
        text("--------", 40, 80);
        text("--------", 40, 155);
        text("Sterne ", 40,230);
        text("werden", 40, 305);
        text("generiert", 40, 380);
 }
     if(mode == 32){
   
   //Pinsel
          fill(0);
        text("Zurück", 40, 455);
        text("Bitte ", 40, 80);
        text("Mond", 40, 155);
        text("plazieren ", 40,230);
        text("--------", 40, 305);
        text("--------", 40, 380);
 }
     if(mode == 3){
   
   //Pinsel
          fill(0);
        text("Zurück", 40, 455);
        text("Sternenschauer", 40, 80);
        text("Mond", 40, 155);
        text("--------", 40,230);
        text("--------", 40, 305);
        text("--------", 40, 380);
 }
}

void keyPressed(){
  
     // Strich dicke 
   
   if (key == 'y'){
     strok++;
   }
     
   if (key == 'x'){
     strok--;
 }
   if (key == 'c'){
     background(0);
   }

}


