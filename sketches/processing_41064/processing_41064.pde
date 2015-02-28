
void setup() {
size (600, 600);
background(250);
smooth();
}



void draw (){
 stroke (0); 
 fill(255);
 ellipse(60,60, 50,50);
 noStroke ();
 if (mousePressed){
     if (mouseX<80 && mouseY<80){ 
     noStroke();
     fill( 255,25);
     rect(0,0,600,600);
     }
   else{
   noStroke();
   fill( 0 ,60);
   ellipse(mouseX,mouseY, 10, 5);
   }
 }
}
                        
