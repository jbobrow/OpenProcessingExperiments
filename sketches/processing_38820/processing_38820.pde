
int shapecode = 1; // 1 for Ellipse, 2 for Square. Fed to main shape function
int m = 50; //magnitude of main cursor shape
int t = 255; //transparency control variable
int cc = 255; //color control variable

void setup() {
  size(800, 800);
  smooth();
  background(#FF035B);
}

void draw() {


  //background(#FF035B);

  if (keyPressed) {
    switch(key) {
    case's':                //makes main shape square
      shapecode = 2;
      break;
    case 'e':               //makes main shape ellipse
      shapecode = 1;
      break;
    case 'c':               //clears by calling background
      background(#FF035B);
      break;
    case't':                //makes shapes transparent
      t = 30;
      break;
    case'o':                //makes shapes fully opaque
      t = 255;
      break;
    case'h':  
      cc=#03FA0C;          //changed shape fill color to a green
      break;
    case'w':
      cc = 255;      //returns fill color to white
      break;
    case'p':
      mousePressed=true;
      cc = int(random(#000000,#FFFFFF));
      background(int(random(#000000,#FFFFFF)),25);
      break;
    case'n':
      mousePressed=false;    //NO! restores sanity
      cc=255;
      background(#FF035B);
      break;
    case'0':         //resets shape magnitude to original value, 50
      m=50;
      break;
    case'1':         //increases shape magnitude
      m=60;
      break;
    case'2':
      m=70;
      break;
    case'3':
      m=80;
      break;
    case'4':
      m=90;
      break;
    case'5':
      m=100;
      break;
    }
  }

  
  if (mousePressed) {
    MakeShape(int(random(0, width)), int(random(0, height)));
  }

  MakeShape(mouseX, mouseY, shapecode);
}


void MakeShape(int x, int y) {
  ellipse (x, y, 40, 40);
  ellipse (x, y, 20, 20);
  }

  void MakeShape(int x, int y, int d) {

    if(d==1){
      fill(cc,t);
    ellipse (mouseX, mouseY, m, m);
    ellipse (mouseX, mouseY, m/2, m/2);
    }

    if(d==2){
      fill(cc,t);
    rect(mouseX-m/2, mouseY-m/2, m, m);
    rect(mouseX-m/4, mouseY-m/4, m/2, m/2);
    }
  }
                                
