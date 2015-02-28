
void setup(){
  size (1000,1000);
  background (255,255,255);
 
   
}
void draw(){
      if (mousePressed && (mouseButton == LEFT)){ //llapis color negre
      strokeWeight (15);
      stroke (0,0,0);
      line (mouseX,mouseY,pmouseX,pmouseY);
   }
      if (mousePressed && (mouseButton == RIGHT)){ //cercles grans random
      strokeWeight (9);
      stroke (random (0,255),random (0,0),random (0,120));
      ellipse (mouseX,mouseY,pmouseX,pmouseY);
   }
   if (keyPressed){  //esborrar
     if (key == 'r'){ 
     frameRate(500);
      fill (255,255,255);
      stroke (255,255,255);
      rect (mouseX,mouseY,50,50);
  }
 
   if (keyPressed){ // llapis random punta fina
     if (key == 'a'){
       strokeWeight (15);
       stroke (random (0,255),random (0,255),random (0,255));
       line (mouseX,mouseY,pmouseX,pmouseY);
     }
  }
   if (keyPressed){ // llapis negra punta mitja
     if (key == 's'){
       strokeWeight (50); 
        stroke (random (0,255),random (0,255),random (0,255));
       line (mouseX,mouseY,pmouseX,pmouseY);
     }
  }
   if (keyPressed){ // llapis negre punta grosa
     if (key == 'd'){
       strokeWeight (100); 
       stroke (random (0,255),random (0,255),random (0,255));
       line (mouseX,mouseY,pmouseX,pmouseY);
     }
     if (keyPressed && (mouseButton == LEFT)){ //fer cercles
     if (key == 'z'){
       strokeWeight (10); 
        stroke (random (0,255),random (0,255),random(0,255));
       ellipse (mouseX,mouseY,pmouseX,pmouseY);
     }
  }
   if (keyPressed){ //fer quadrats
     if (key == 'x'){
       strokeWeight (10); 
        stroke (random (0,255),random (0,255),random(0,255));
       rect (mouseX,mouseY,pmouseX,pmouseY);
     }
  }
   if (keyPressed){ //fer linies 
     if (key == 'c'){
       strokeWeight (10); 
        stroke (random (0,255),random (0,255),random(0,255));
       line (mouseX,mouseY,pmouseX,pmouseY);
     }
        if (keyPressed){ //llapis punta fina color
     if (key == 'A'){
       strokeWeight (15); 
       stroke (2,10,255);
       line (mouseX,mouseY,pmouseX,pmouseY);
     }
  }
   if (keyPressed){
     if (key == 'S'){
       strokeWeight (50); // llapis punta mitja color
       stroke (34,255,9);
       line (mouseX,mouseY,pmouseX,pmouseY);
     }
  }
   if (keyPressed){
     if (key == 'D'){
       strokeWeight (100); // llapis punta grosa color 
       stroke (255,54,23);
       line (mouseX,mouseY,pmouseX,pmouseY);
     }
  }
   if (keyPressed){
     if (key == 'q'){ //apretat cercles random
     frameRate(500);
       strokeWeight (15);
       stroke (random (0,255),random (0,255),random(0,255));
       ellipse (mouseX,mouseY,random (0,40),random (0,40));
     }
     }
     if (keyPressed){
     if (key == 'f'){ //reflexio CERCLE
     stroke (random (0,255),random (0,255),random(0,255));
     ellipse(mouseX,mouseY,abs(mouseY-pmouseY),abs(mouseY-pmouseY));
     ellipse(1000-mouseX,mouseY,abs(mouseY-pmouseY),abs(mouseY-pmouseY));
       }
        }
     if (keyPressed){
     if (key == 'F'){ //reflexio QUADRAT
     stroke (random (0,255),random (0,255),random(0,255));
    rect(mouseX,mouseY,abs(mouseY-pmouseY),abs(mouseY-pmouseY));
     rect(1000-mouseX,mouseY,abs(mouseY-pmouseY),abs(mouseY-pmouseY));
       }
  }
   if (keyPressed){
     if (key == 'w'){ //apretat quadrat random
       frameRate(500);
       fill (random (0,255),random (0,255),random (0,255));
       stroke (random (0,255),random (0,255),random(0,255));
       rect (mouseX,mouseY,random (0,40),random (0,40));
     }
     }
    
        if (keyPressed){ //apretat triangle random
       if (key == 'e'){ 
       frameRate(300);
       fill (random (0,255),random (0,255),random (0,255));
       stroke (random (0,255),random (0,255),random(0,255));
       triangle(random (0,255),random(0,255),pmouseX,pmouseY,random (0,255),random(0,255));
           }
        }
    }
}
}
}



