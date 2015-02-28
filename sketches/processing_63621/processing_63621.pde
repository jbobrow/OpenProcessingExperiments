
int counter;
PVector uno;
PVector dos;

void setup() {  //setup function called initially, only once
  uno = new PVector(0,0);
  dos = new PVector(250,250);
  size(250, 250);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  strokeWeight(1);
}


void mouseClicked() {
    if (mouseButton == LEFT) {
        uno = new PVector(mouseX, mouseY);
    } else {
        dos = new PVector(mouseX, mouseY);
    }
}

void keyPressed() {
  background(255);
}

void draw() {  //draw function loops 
  counter++;
  stroke(random(50,100),100,100,15);
  line(random(uno.x,dos.x),random(uno.y,dos.y),random(uno.x,dos.x),random(uno.y,dos.y));  
}
