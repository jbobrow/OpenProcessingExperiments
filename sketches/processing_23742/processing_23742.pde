
PImage img;


void setup() {
  //largeur, hauteur du sketch
  size(600, 400);
  smooth();
  
  
 img = loadImage("adv7.gif");
 image(img,0,0);
  

  //antialiasing des lignes
 smooth();
 frameRate(20);
}
    float Mspeed;
   
void draw() {
//-----------------------------------------
  
background(img);

//---------------------------------rect
noStroke();
fill(20,random(2),random(130),random(40));
rect(0, 0, 600, 200);  


   //------------------------------------------WHITE LINES 
    stroke(250);
    
   strokeWeight(random(5));
         line(0, mouseY, 600, mouseX);
         
   strokeWeight(random(5));
         line(0, mouseY+112, 700, mouseX+322);   
         
   strokeWeight(random(5));
         line(0, mouseY+82, 670, mouseX+132);   
 
 strokeWeight(random(5));
         line(0, mouseY+182, 670, mouseX+182);    

  
     strokeWeight(random(20));
         line(0, mouseY, 600, mouseX);
         
   strokeWeight(random(10));
         line(0, mouseY+112, 700, mouseX+142);   
         
   strokeWeight(random(10));
         line(0, mouseY+82, 700, mouseX+162);   
 
 strokeWeight(random(5));
         line(0, mouseY+182, 700, mouseX+182);    
         

  
   Mspeed=abs(mouseX-pmouseX);
  if (mousePressed == true) {
   //------------------------------------------GREEN LINES WHEN MOUSEPRESSED 
    stroke(#29C1AE);
    
   strokeWeight(0.1+Mspeed/20);
         line(0, mouseY, 600, mouseX);
         
   strokeWeight(0.4+Mspeed/40);
         line(0, mouseY+112, 700, mouseX+12);   
         
   strokeWeight(0.4+Mspeed/40);
         line(0, mouseY+82, 670, mouseX+32);   
 
 strokeWeight(0.4+Mspeed/40);
         line(0, mouseY+182, 670, mouseX+82);    

  
     strokeWeight(5+Mspeed/20);
         line(0, mouseY, 600, mouseX);
         
   strokeWeight(4+Mspeed/40);
         line(0, mouseY+112, 700, mouseX+232);   
         
   strokeWeight(4+Mspeed/40);
         line(0, mouseY+82, 700, mouseX+332);   
 
 strokeWeight(2+Mspeed/40);
         line(0, mouseY+182, 700, mouseX+482);    
         
}


  if (keyPressed == true) {
        //saveFrame();
       // background(255);
      }
        save("_snowfall.png");
//fermeture de draw
}


