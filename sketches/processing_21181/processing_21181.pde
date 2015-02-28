
void setup() {
size(500, 120);
textSize(64);
textAlign(CENTER);

}
int space = 0;//naming variable space
void draw() {
  if (keyPressed == true) {
delay(150);//this delay helps not typing the same letter multiple times
space = space + 35;//creating space between letter
text(key,space, 80);//setting the placement on x-axis to space, and writing the letter
}
}


