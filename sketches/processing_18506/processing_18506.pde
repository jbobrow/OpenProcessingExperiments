

void setup () {
size( 250, 250);
background(40);
}
 
void draw (){
stroke(191,42,144,20);
strokeWeight (6);
fill(0);
bezier(mouseX,mouseY,10,0,180,80,10,90);

stroke (255,10);
bezier (mouseY,mouseX,10,0,180,80,10,90);
stroke (255,60);
strokeWeight (1);
line (mouseY,mouseX,50,50);
stroke (191,42,144,20);
strokeWeight (1);
line (mouseY,mouseX,50,50);

}
                
                
