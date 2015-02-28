
int x = 600;
int y = 600;

 
void setup () {
size (600,600);
background (0);
noStroke ();
smooth ();
}
 
 
void draw () {
//background (0); //remove history of bubbles
}

void mouseDragged () {
  
int randomsize = int(random(8,80));
fill (60,130,190,100);
ellipse (mouseX, mouseY, randomsize, randomsize);

 
stroke(250);
if(mousePressed) {
line(mouseX, mouseY, pmouseX, pmouseY);    
  }
 
 
}

