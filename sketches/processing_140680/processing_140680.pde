

float var1;
float var2;
color[] COLORS = { 155, #CC1111, #11CC11, #1111CC, #CCCC11, #CC11CC, #1111CC };
int curColor;
boolean dark = true;
color bg = 10;
float Alpha;
int b;

void setup()  {
                background(0);
                size(500,500,OPENGL);
                smooth();
}

void draw() {
                    background(bg);

                 translate(width/2, height/2);
                 rotateY(map(mouseX, 0, width, -PI/2, PI/2));
                 rotateX(map(mouseY, 0, height, -PI/2, PI/2));
              
                 for(int i = 0; i < 10; i++) {
    
                   
    float Alpha = map(mouseX-mouseY, -250, width/2, 30, 105);
    stroke(COLORS[curColor],Alpha);
    
    rotateX(var1);
    rotateZ(0.05);
    rotateY(var2-float(i));
   
    fill(COLORS[curColor],Alpha);
    box(100, 100,100);}
    
    for(int j = 0; j < 32000; j++) {
    
                   
    float Alpha = map(mouseY-mouseX, -250, width/2, 70, 255);
    stroke(COLORS[curColor],Alpha);
    
    rotateX(var1);
    rotateZ(0.05);
    rotateY(var2-float(j));
    point(70, 70,70);
    
    }
  
  
  
  
  var1 -= 0.03;
  var2 += 0.03;
  
  
  
}
void mouseClicked() {
  // Clicking the left mouse button changes stroke color
  if (mouseButton == LEFT) {
    curColor += 1;
    if (curColor == COLORS.length)
      curColor = 0;
  }
  // Clicking the right mouse button toggle light and dark modes
  if (mouseButton == RIGHT) {
    dark = !dark;
    bg = dark ? 10 : 230;
    COLORS[0] = dark? 230 : 10;
  }
}

