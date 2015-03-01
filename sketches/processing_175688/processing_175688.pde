
/*int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
} */
int number;
Array<String> score = new ArrayList<String>();
void setup() {
    size (790, 400);
    background(255);
    colorMode(HSB);
}

void draw() {
    int xinc = 1;
    for (k = 0; k < 11; k++) {
        rect(((70 * xinc) - 60), 10, 70, 85);
        rect(((70 * xinc) - 25), 10, 35, 35);
        xinc++;
    }
}

void keyPressed() {
    number = key;
    print(key);
}

void 
