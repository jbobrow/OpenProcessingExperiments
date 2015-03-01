
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/151943*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
void setup() {
 size(500,500); 
}

boolean TF=true;
float x;
float y;
int sens=1;

void draw() {
 int num=0;
 background(255);
  for (int i=1; i<180;i+=20) {
    for (int j=1; j<180;j+=20) {
      num+=1;
      noFill();
      stroke(0);
      if (TF) {
        x=mouseX;
        y=mouseY;
      }
      if(num % 2==0) {
      //fill(255,0,0,100);
      ellipse(i*2+85,j*2+85,abs(sens*(x-250)),abs(sens*(y-250)));
      }
      else {
      //fill(0,255,0,100);
      ellipse(i*2+85,j*2+85,abs(sens*(y-250)),abs(sens*(x-250)));
      }
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

