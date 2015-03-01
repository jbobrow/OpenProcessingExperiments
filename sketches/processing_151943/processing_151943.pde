
//By Richard
//Mandala-like pattern generator
//Move mouse to change ellipse radii
//Mouse click to pause the view
//Press up to increase maximum radius length, down to decrease

void setup() {
 size(500,500); 
}

boolean TF=true;
float x;
float y;
int sens=1;

void draw() {
 background(255);
  for (int i=1; i<200;i+=20) {
    for (int j=1; j<200;j+=20) {
      noFill();
      stroke(0);
      if (TF) {
        x=mouseX;
        y=mouseY;
      }
      ellipse(i*2+70,j*2+70,abs(sens*(x-250)),abs(sens*(y-250)));
      ellipse(i*2+70,j*2+70,abs(sens*(y-250)),abs(sens*(x-250)));
    }
  }
}

void mouseClicked() {
  TF=!TF;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      sens+=1;
    } else if (keyCode == DOWN) {
      sens=max(sens-1,1);
    } 
  } 
}


