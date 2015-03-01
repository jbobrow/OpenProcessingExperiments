
// Papageimalen
// 12.12.2014

/* Aufgabenstellung
Veraendere das Programm so, dass die Linie auf der linken Bildschirmhaelfte orange, auf der rechten Haelfte gruen gezeichnet wird. Die Linienfarbe aenderst du z.B. mit stroke(255,255,255) */

void setup(){
    size(400,400);
    background(0,157,188);
    }

void draw(){
     //wenn die Maus auf der linken Haelfte ist...
     //...dann
if(mouseX>=0&&mouseX<=200){
stroke(255,150,0);
     }
     //wenn die Maus auf der rechten Haelfte ist...
     //... dann
if(mouseX>=200&&mouseX<=400){
stroke(0,255,0); 
}
     line(mouseX,mouseY,pmouseX,pmouseY);
 }
