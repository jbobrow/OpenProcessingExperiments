
int arraySize = 60;
 
int[] xpos = new int[arraySize];
int[] ypos = new int[arraySize];
char[] chars = new char[arraySize];

void setup() {
  size(300, 300);
  textFont(createFont("Helvetica",80));
  
    for (int i = 0; i < chars.length; i ++ )
  {
    chars[i] = char(i + 1);
  }
}


void draw() {
  background(255);
    for (int i = 0; i < xpos.length-1; i ++ )
  {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  
  xpos[xpos.length-1] = mouseX; 
  ypos[ypos.length-1] = mouseY;
   
  for (int i = 0; i < xpos.length; i ++ ) {
    textAlign(CENTER);
    noStroke();
    fill(205-(i+100)/5,355 - i * (250./(float) arraySize),455 - i * (250./(float) arraySize), 255 - i * (255./(float) arraySize));
    text("MMMMMM\nMMMMMM\nMMMMMM", width/2,ypos[i]);
  }
}

