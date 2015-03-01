
   /* 
   By Adriano Parracciani
   aka CyberParra
   ----------------------------
   settaggio iniziale colore rosso
  dei 9 rettangoli interattivi
  una tripletta RGB per ogni rettangolo
  
  */
  
  
  float R1 = 255;
  float G1 = 0;
  float B1 = 0;

  float R2 = 255;
  float G2 = 0;
  float B2 = 0;

  float R3 = 255;
  float G3 = 0;
  float B3 = 0;
  
  float R4 = 255;
  float G4 = 0;
  float B4 = 0;
  
  float R5 = 255;
  float G5 = 0;
  float B5 = 0;
  
  float R6 = 255;
  float G6 = 0;
  float B6 = 0;
  
  float R7 = 255;
  float G7 = 0;
  float B7 = 0;
  
  float R8 = 255;
  float G8 = 0;
  float B8 = 0;
  
  float R9 = 255;
  float G9 = 0;
  float B9 = 0;

void setup() {
  size(270,270);
  frameRate(10);
  strokeWeight(3);
  
   
}
  
  void draw() {
   // colonna 1
    fill(255);
    rect(10,10,40,40);//riga1 sx
    rect(50,10,80,40);//riga1 mid    
    rect(10,50,20,80);//riga2sx
    /*
    controlla se viene premuto il mouse 
    e se il mouse si trova nell'are del rettangolo in questione
        */
    if (mousePressed==true) {
        if ((mouseX >30) && (mouseX<110) && (mouseY>50) && (mouseY<130)) {
            
        R1=random(255);
        G1=random(255);
        B1=random(255);
       
    }    
   } 
    
   fill(R1, G1, B1);
    rect(30,50,80,80);//riga2mid R1
    
     fill(255);
    rect(110,50,20,80);//riga2dx
    
   if (mousePressed==true) {
         if ((mouseX >10) && (mouseX<40) && (mouseY>130) && (mouseY<190)) {
            
        R2=random(255);
        G2=random(255);
        B2=random(255);
       
    }    
   }  
     fill(R2, G2, B2);
    rect(10,130,30,60);//riga3sx
    
    if (mousePressed==true) {
         if ((mouseX >40) && (mouseX<70) && (mouseY>130) && (mouseY<190)) {
            
        R3=random(255);
        G3=random(255);
        B3=random(255);
       
    }    
   }  
     fill(R3, G3, B3);
    
    rect(40,130,30,60);//riga3dx R3
    
    fill(255);
    rect(10,190,60,60);//riga4sx
    
    
    
   if (mousePressed==true) {
         if ((mouseX >70) && (mouseX<130) && (mouseY>130) && (mouseY<250)) {
            
        R4=random(255);
        G4=random(255);
        B4=random(255);
       
    }    
   }  
     fill(R4, G4, B4);
    rect(70,130,60,120);//big sx R4
    
    
    
  if (mousePressed==true) {
         if ((mouseX >130) && (mouseX<190) && (mouseY>10) && (mouseY<130)) {
            
        R5=random(255);
        G5=random(255);
        B5=random(255);
       
    }    
   }  
     fill(R5, G5, B5);
    rect(130,10,60,120);//big dx R5
    
      // colonna 2
        if (mousePressed==true) {
         if ((mouseX >190) && (mouseX<250) && (mouseY>10) && (mouseY<70)) {
            
        R6=random(255);
        G6=random(255);
        B6=random(255);
       
    }    
   }  
     fill(R6, G6, B6);     
      rect(190,10,60,60);//riga1sx R6
      
      fill(255);
      rect(190,70,30,60);//riga2sx
      rect(220,70,30,60);//riga2sx
      
      rect(130,130,20,80);//riga3sx
      
      
      if (mousePressed==true) {
         if ((mouseX >150) && (mouseX<230) && (mouseY>130) && (mouseY<210)) {
            
        R7=random(255);
        G7=random(255);
        B7=random(255);
       
    }    
   }  
     fill(R7, G7, B7);
      rect(150,130,80,80);//riga3mid R7
      
      fill(255);
      rect(230,130,20,80);//riga3dx
      
      if (mousePressed==true) {
         if ((mouseX >130) && (mouseX<210) && (mouseY>210) && (mouseY<250)) {
            
        R8=random(255);
        G8=random(255);
        B8=random(255);
       
    }    
   }  
     fill(R8, G8, B8);
      rect(130,210,80,40);//riga4sx R8
      
      
      if (mousePressed==true) {
         if ((mouseX >210) && (mouseX<250) && (mouseY>210) && (mouseY<250)) {
            
        R9=random(255);
        G9=random(255);
        B9=random(255);
       
    }    
   }  
     fill(R9, G9, B9);
      rect(210,210,40,40);//riga4mid R9
      
           
  }
