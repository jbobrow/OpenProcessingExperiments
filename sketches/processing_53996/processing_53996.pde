
int[] xpos = new int[50];
int[] ypos = new int[50];

void setup() {
  size(800, 600);
  smooth();

  for (int i = 0; i < 50; i++) {
    xpos[i] = 0; 
    ypos[i] = 0;
  }

}

void draw() {
  background(255);
  for (int i = 0; i < 49; i++) {
    xpos[i] = xpos[i+1]; 
    ypos[i] = ypos[i+1];
    ypos[i]-=(int)random(20);
    xpos[i]-=(int)random(-4, 4);
  }


  for (int i = 0; i < 50; i++) {
    noStroke();
    
    fill(255-i*5);
    ellipse(xpos[i]+40, ypos[i]+300, i, i );
    ellipse(xpos[i]+130, ypos[i]+300, i, i );
    ellipse(xpos[i]+220, ypos[i]+300, i, i );
    ellipse(xpos[i]+312, ypos[i]+300, i, i );
    //shamas
    ellipse(xpos[i]+400, ypos[i]+250, i, i );
    ellipse(xpos[i]+480, ypos[i]+300, i, i );
    ellipse(xpos[i]+572, ypos[i]+300, i, i );
    ellipse(xpos[i]+663, ypos[i]+300, i, i );
    ellipse(xpos[i]+755, ypos[i]+300, i, i );
  }
}



