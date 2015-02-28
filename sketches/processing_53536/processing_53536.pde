

void setup() {
  size(500, 500);
  background(0,20,255);
  smooth();
}

int pacman;

void draw() {
  if (frameCount % 5 == 0) { pacman = int(random(3)); }
}

void mouseDragged() {
  if (pacman == 0) { pacman1(); }
  if (pacman == 1) { pacman2(); }
  if (pacman == 2) { pacman3(); }
    }
     
    void keyPressed() {
       background(255); 
    }
     
    void pacman1() {
      stroke(random(255),random(255),random(255));
      strokeWeight (4); 
      fill(0,255,0); 
      arc(mouseX, mouseY,50,50,-PI,3);
      fill(0);
      arc(mouseX-10,mouseY-13,8,12,-PI,2.8);
    }
     
    void pacman2() {
      stroke(random(255),random(255),random(255));
      strokeWeight(3);
      fill(200,255,20);
      arc(mouseX, mouseY,100,100,-PI,2.8);
      fill(0);
      arc(mouseX-20,mouseY-23,10,20,-PI,2.8);
      
    }
     
    void pacman3() {
      stroke(random(255),random(255),random(255)); 
      strokeWeight(3); 
      fill(200,50,10); 
      arc(mouseX, mouseY,150,150,-PI,2.3);
      fill(random(255),random(255),random(255));
      ellipse(mouseX-90,mouseY+25,40,40); 
      fill(0);
      arc(mouseX-30,mouseY-33,15,25,-PI,2.8);
    }

