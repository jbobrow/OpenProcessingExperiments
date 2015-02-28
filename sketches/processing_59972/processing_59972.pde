
void setup(){
size (500,500);
smooth ();

ellipseMode (CENTER);
//noCursor ();

background (0);  
noStroke ();
fill (255,10);
ellipse (480,0,600,600);
ellipse (0,500, 600,600);

frameRate (10);

}


void draw (){
  
   if (mousePressed){
     stroke (0);
     strokeWeight (2);
     fill (255,5);
     ellipse (480, 0, mouseY,mouseY);
     ellipse (0, 500, mouseX,mouseX);  
         
 }
 else {
     stroke (0,10);
     fill (255,10);
     ellipse (480,0,600,600);
     ellipse (0,500, 600,600);
}    

}

