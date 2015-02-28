

//alles was in dem steht, wird einmal ausgeführt
void setup () {
  size (600,700);  
  background (#FFB950);
  smooth();

  int anzahl = 30;

  for (int i=0; i<anzahl; i=i+1){
      
     for (int j=0; j<anzahl; j=j+1){
         fill (255,158,93,20);
         if (i%2==00)fill(#58290A,20);
         noStroke();
         ellipse (j*(width/anzahl+2),i*(height/anzahl+2),random(10,120),random(10,80));
       
         stroke(#58290A,20);
         strokeWeight (random(30));
   
          fill(#58290A,10);
          rect (j*(width/anzahl+2),i*(height/anzahl+2),random(25,49),random(10,35));
          }  
      }
  }



//alles was hier drinne steht, wird immer wieder ausgeführt
void draw () { 
  
  if (keyPressed){
    //wenn die 1 gedrückt wird
    if(key=='1'){
        background (#FFB950);
        int anzahl = 30;    

        for (int i=0; i<anzahl; i=i+1){          
    
          for (int j=0; j<anzahl; j=j+1){
               fill (255,158,93,20);
               if (i%2==00)fill(#58290A,20);
               noStroke();
               ellipse (j*(width/anzahl+2),i*(height/anzahl+2),random(10,120),random(10,80));
             
               stroke(#58290A,20);
               strokeWeight (random(30));
         
                fill(#58290A,10);
                rect (j*(width/anzahl+2),i*(height/anzahl+2),random(25,49),random(10,35));
                }
             }
          }

    //wenn die 2 gedrückt wird
    if(key=='2') {
      strokeWeight(2);
    stroke(20,60,23,100);
   fill (random(255),random(255),random(255),150);
   rect (mouseX,mouseY,random(-20,20),random(-20,20));
   }  


  if(key=='3') {
    stroke(0,40);
    strokeWeight (2);
    line(mouseX+30,mouseY-30,pmouseX,pmouseY);
    line(mouseX-30,mouseY+30,pmouseX,pmouseY);
    line(mouseX,mouseY,pmouseX+10,pmouseY+10);
    line(mouseX,mouseY,pmouseX+10,pmouseY+10);
    }  
    
  
    
  }

  //wenn die Maus gedrückt wird
  if(mousePressed){    
   stroke(#CE1500,5);
      strokeWeight (random(10));
      fill (#A21000,80);
      ellipse (mouseX,mouseY,random(0,30),random(0,20));
      fill (#CE1500,180);
      ellipse (mouseX,mouseY,random(0,30),random(0,20));
      ellipse (mouseX+random(-20,25),mouseY+random(-20,25),random(0,5),random(0,5));
    
     stroke(0,0,0,5);
    strokeWeight (30);
    fill (0,0,0,30);
    ellipse (mouseX,mouseY,random(0,30),random(0,20));
    rect (mouseX,mouseY,random(15,30),random(-10,20)); 
   }
  
}
                            
