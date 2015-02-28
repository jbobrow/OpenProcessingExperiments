
void setup () {
size (600, 600);
frameRate(20);
noCursor();
noStroke();

}



void draw () {
 int m=minute(), s=second(), h=hour();
 background(0);
    
      
 text(h, mouseX-20, mouseY);  
 text(m, mouseX, mouseY);
 text(s, mouseX+20, mouseY);

 if (mousePressed && (mouseButton == LEFT)) {   
   fill(255,0, 0);
    } else {
      fill(0, 255,0);
 
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
  text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
 text(1, random(600),  random(600));
 text(0, random(600), random(600));
  }
}



