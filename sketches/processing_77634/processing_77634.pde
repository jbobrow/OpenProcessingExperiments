
PFont font;
int mode=0;
float zahl = 4;
int count = 1;
int strok = 10; 

void setup(){
 size(600,500);
  background (42,50,122);
   frameRate(29);
    smooth();
     font = createFont("Arial",12,true); textFont( font,14);
}


void draw() {
  println(strok);
   if(mousePressed){
    fill(255);
     ellipse(mouseX,mouseY,strok,strok);
    }
    
    
   noStroke();
    fill(42,50,122);
     rect(0,0,600,80); //butten leiste
    
       fill(240);
       rect(80,30,50,20,5);   // snow
     
         rect(180,30,50,20,5); // stopp
       
          rect(280,30,50,20,5); // paind
       
            rect(380,30,50,20,5); // clean 
          
             rect(480,30,50,20,5); //reset
               
   
   // farben
   
       //rot
        fill(255,0,0);
        rect(10,20,20,20,5); 
       
       //grün
         fill(30,49,19);
         rect(42,30,20,20,5); 
       
       //Braun
         fill(37,20,10);
         rect(15,50,20,20,5); 
   
   
   //Schrift
      fill(42,50,140);
      text("Snow",85,45);
   
      fill(42,50,140);
      text("Draw",185,45);
   
      fill(42,50,140);
      text("Paint",285,45);
   
      fill(42,50,140);
      text("Clean",385,45);
   
      fill(255,0,0);
      text("Reset",485,45);
   
  
  
  
     
     
  //snow
   if(mode==1){
    noStroke();
     fill(255);
     zahl=random(4,8);
      ellipse(random(600), random(500), zahl, zahl);
  }
  
 // paint
   if(mode==2){
    if(mousePressed){
        fill(255,255,255,90);
         ellipse(mouseX,mouseY,35,35);
               noStroke();
        }
      }
      
   //clean
      if(mode==3){
       if(mousePressed){
        fill(42,50,122);
         ellipse(mouseX,mouseY,40,40);
           noStroke();
       }  
     }
     
   // reset
      if(mode==4){
        fill(42,50,122);
         rect(0,80,600,420);
           ellipse(mouseX,mouseY,40,40);
             noStroke();
   }

   // farbe: rot
   
    if(mode==5){
       if(mousePressed){
        fill(198,18,12);
         ellipse(mouseX,mouseY,15,15);
           noStroke();
       }
    }
    
    // farbe grün
        if(mode==6){
       if(mousePressed){
      fill(30,49,19);
         ellipse(mouseX,mouseY,25,25);
           noStroke();   
       }  
        } 
        
        //farbe braun
            if(mode==7){
             if(mousePressed){
              fill(37,20,10);
               ellipse(mouseX,mouseY,11,9);
                 noStroke();
              }
            }
   
   
  if(mousePressed){
    if((mouseX>180) && (mouseX<180+50) && (mouseY>30) && ( mouseY<20+30)){
    mode=0;
    }
    if((mouseX>80) && (mouseX<80+50) && (mouseY>30) && ( mouseY<20+30)){
    mode=1;
   }
      if((mouseX>280) && (mouseX<280+50) && (mouseY>30) && ( mouseY<20+30)){
    mode=2;
    }
    
        if((mouseX>380) && (mouseX<380+50) && (mouseY>30) && ( mouseY<20+30)){
    mode=3;
    }
        if((mouseX>480) && (mouseX<480+50) && (mouseY>30) && ( mouseY<20+30)){
    mode=4;
    }
    // Farben
    
     if((mouseX>10) && (mouseX<10+20) && (mouseY>20) && ( mouseY<20+20)){
    mode=5;
  
  }
  
     if((mouseX>42) && (mouseX<42+30) && (mouseY>30) && ( mouseY<30+20)){
    mode=6;
  
  }
  
     if((mouseX>15) && (mouseX<15+50) && (mouseY>50) && ( mouseY<50+20)){
    mode=7;
  
  }
  } 
}


void keyPressed(){
  
  if(key =='s'){
    saveFrame("dein.bild"+ count+".jpg");
    count++;
  }
  if(key=='+'){
    strok++;
  }
  if(key=='-'){
    strok--;
  }
}




