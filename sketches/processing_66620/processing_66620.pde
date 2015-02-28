
/*
################
### Glichtes ###

Idee:
Glitch-Kompositionen ähnlich wie http://alexanderpeverett.com/files/gimgs/8_593new61b.gif zu 
generieren.

Erklärung:
Da wir ja keinen richtigen Ansatz fanden, wie Alexander (o.g. Bsp.) seine Bilder generiert, habe ich
mich versucht über einen bestehenden Programmcode zu nähern.
Mit dem Ergebnis ist meiner Meinung nach sehr zufriedenstellend, da es ne sehr eigene, aber 
glitch-ige Ästhetik produziert.

Quelle:
http://www.openprocessing.org/sketch/10867

###          ###
################

*/

Interpreter brush;

 
void setup(){
    size(1024,768,P2D);
    frameRate(2);
    brush = new Interpreter("bg.jpg","pixel.png",10000);
    background(0);
     
}
 
 
void draw(){
    noTint();
    image(g,(noise(frameCount)+4)*20.0,(noise(frameCount*1)+0.999)*70);
    brush.draw();
     

 
}
 
class Interpreter{
    PImage eins;
    PImage zwei;
    color c[];

     
 
    Interpreter(String file, String file2, int num){
        zwei = loadImage(file2);
        eins = loadImage(file);
        eins.loadPixels();
        
        c = new color[num];
        for(int i = 1;i<num;i++){
          c[i] = eins.pixels[(int)random(eins.pixels.length)];

        }
    }
     
    void draw(){
        for(int i = 0;i<1;i++){
            pushMatrix();
            translate(random(-width,width),random(-height,height));
            pushMatrix();
            float sc =  random(0.12,1);
            translate(sc*zwei.width/0.5,sc*zwei.height/0.5);
            pushMatrix();
            tint(c[(int)random(c.length)],-13);
            image(zwei,0,0,zwei.width*sc,zwei.height*sc);
            popMatrix();
            popMatrix();
            popMatrix();
        }
     
    }
 
 
}


