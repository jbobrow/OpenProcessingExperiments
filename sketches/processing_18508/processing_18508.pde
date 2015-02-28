
void setup () {
size( 250, 250);
background(40);
}
 
void draw (){
stroke (255,60);
strokeWeight (1);
line (mouseY,mouseX,50,50);
stroke (191,42,144,20);
strokeWeight (1);
bezier (mouseX,mouseY,60,50,40,40,50,60);
stroke (255,60);
strokeWeight (1);
line (mouseY,mouseX,70,50);
stroke (191,42,144,20);
strokeWeight (1);
line (mouseX,mouseY,80,50);
strokeWeight (1);
noFill ();
ellipse (mouseX,mouseY,70,70);
strokeWeight (1);
stroke (255,30);
noFill ();
rect (mouseX,mouseY,70,70);

}
               
