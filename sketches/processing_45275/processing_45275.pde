
PFont font;
int bulgariaX = 0, usaX, turkeyX, romaniaX, ukX, irelandX, israelX, canadaX, norwayX, swedenX, germanyX, franceX, italyX, japanX, netherlandsX;
boolean startBox = true;

void setup(){
 size(500,300); 
 background(0);
}

void draw(){
  background(0);
  font = loadFont("FranklinGothic-Book-48.vlw"); 
  textFont(font, 20); 
  text("Graph of teenage pregnancies around the world", 50, 20);
  if(startBox){
   
    
  rect(200, 100, 100, 100); 
   fill(0);
    text("Click Me", 215, 150);

    fill(#FFFFFF);
  if((mousePressed) && (mouseX > 200) && (mouseX < 300) && (mouseY <200) && (mouseY > 100)){
    startBox = false;
  }
  }
  if(startBox ==false){
  if(bulgariaX <= 420){
    bulgariaX += 3;
    }
    fill(#03FF2A);
   rect(0, 50, bulgariaX, 10); 

  if(usaX <= 390){
    usaX += 3;
    }
    fill(#0393FF);
   rect(0, 65, usaX, 10); 

  if(turkeyX <= 390){
    turkeyX += 3;
  }
  fill(#FF0011);
   rect(0, 80, turkeyX, 10); 
   

  if(romaniaX <= 310){
    romaniaX += 3;
  }  
  fill(#E0FF00);
   rect(0, 95, romaniaX, 10); 
   
    if(ukX <= 240){
    ukX += 3;
  }  
  fill(#FFFFFF);
   rect(0, 110, ukX, 10); 
   
    if(irelandX <= 160){
    irelandX += 3;
  }  
  fill(#00FF01);
   rect(0, 125, irelandX, 10); 
   
    if(israelX <= 140){
    israelX += 3;
  }  
  fill(#00FFFD);
   rect(0, 140, israelX, 10);

 if(canadaX <= 130){
    canadaX += 3;
  }  
  fill(#F50000);
   rect(0, 155, canadaX, 10);
   
    if(norwayX <= 90){
    norwayX += 3;
  }  
  fill(#6157FC);
   rect(0, 170, norwayX, 10);
   
     if(swedenX <= 80){
    swedenX += 3;
  }  
  fill(#FAE100);
   rect(0, 185, swedenX, 10);
   
     if(germanyX <= 80){
    germanyX += 3;
  }  
  fill(#FF5E00);
   rect(0, 200, germanyX, 10);
   
     if(franceX <= 70){
    franceX += 3;
  }  
  fill(#007DFF);
   rect(0, 215, franceX, 10);
   
     if(italyX <= 50){
    italyX += 3;
  }  
  fill(#50AD42);
   rect(0, 230, italyX, 10);
   
     if(japanX <= 50){
    japanX += 3;
  }  
  fill(#FC0004);
   rect(0, 245, japanX, 10);
   
     if(netherlandsX <= 40){
    netherlandsX += 3;
  }  
  fill(#6C00FC);
   rect(0, 260, netherlandsX, 10);
   
   fill(#FFFFFF);

 if((mouseX < 420) && (mouseY <60) && (mouseY > 50)){
   text("Bulgaria - 42", 300, 250);
 }
  if((mouseX < 390) && (mouseY <75) && (mouseY > 65)){
   text("U.S. - 39", 300, 250);
 }
 
  if((mouseX < 390) && (mouseY <90) && (mouseY > 80)){
   text("Turkey - 39", 300, 250);
 }
 
  if((mouseX < 310) && (mouseY <105) && (mouseY > 95)){
   text("Romania - 31", 300, 250);
 }
 
  if((mouseX < 240) && (mouseY <120) && (mouseY > 110)){
   text("U.K. - 24", 300, 250);
 }
 
  if((mouseX < 160) && (mouseY <135) && (mouseY > 125)){
   text("Ireland - 16", 300, 250);
 }
 
  if((mouseX < 140) && (mouseY <150) && (mouseY > 140)){
   text("Israel - 14", 300, 250);
 }

if((mouseX < 130) && (mouseY <165) && (mouseY > 155)){
   text("Canada - 13", 300, 250);
 }
 
 if((mouseX < 90) && (mouseY <180) && (mouseY > 170)){
   text("Norway - 9", 300, 250);
 }
 
 if((mouseX < 80) && (mouseY <195) && (mouseY > 185)){
   text("Sweden - 8", 300, 250);
 }

if((mouseX < 80) && (mouseY <210) && (mouseY > 200)){
   text("Germany - 8", 300, 250);
 }
 
 if((mouseX < 70) && (mouseY <225) && (mouseY > 215)){
   text("France - 7", 300, 250);
 }

if((mouseX < 50) && (mouseY <240) && (mouseY > 230)){
   text("Italy - 5", 300, 250);
 }

if((mouseX < 50) && (mouseY <255) && (mouseY > 245)){
   text("Japan - 5", 300, 250);
 }
 
 if((mouseX < 40) && (mouseY <270) && (mouseY > 260)){
   text("Netherlands - 4", 300, 250);
 }
text("Live Births per 1,000 females age 15-19 years", 10, 290);
}
}

