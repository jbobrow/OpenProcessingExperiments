
int w;
int x;
PFont f;

Target target01;

void setup () {
  size(800, 600);

  target01=new Target(300, 100, 1);
}

void draw() { 
  background(200);
  target01.targetDesign(color(255, 0, 0), color(255, 0, 0));
  target01.movement();


  stroke(220);
  strokeWeight(1);

  for (int i=0; i<width; i+=80) {
    line(i, 0, i, height);

    for (int w=0; w<height; w+=80) {
      line(0, w, width, w);

   

      f = createFont("Zapfino", 16, true); 


      textFont(f, 16);                 
      fill(0);       
      text("y  es", w, mouseY);
      
      beginShape();
      vertex(mouseY-40,mouseY+10);
      vertex(mouseX-100,40);
      vertex(mouseX=42,mouseX-100);
      endShape();
    }
  }
}

class Target{
  int x;
  int y;
  int speed;
  Target(int tempX, int tempY, int tempSpeed){
    x=tempX;
    y=tempY;
    speed=tempSpeed;
  }
  void targetDesign(color outside, color inside){
    strokeWeight(20);
    stroke(210,0,0);
    ellipseMode(CENTER);
    fill(outside);
    noFill();
  
    ellipse(x,y,100,100);
    
    fill(inside);
    noFill();
    ellipse(x,y,20,20);
  }
void movement(){
  x=x+speed;
  if(x>width||x<0){
    speed=speed *-1;
  }
}
}
class Text {

  PFont f;                          // STEP 2 Declare PFont variable

  void setup() {
    size(200, 200);
    f = createFont("Arial", 16, true); // STEP 3 Create Font
  }

  void draw() {
    background(255);
    textFont(f, 16);                 // STEP 4 Specify font to be used
    fill(0);                        // STEP 5 Specify font color 
    text("Hello Strings!", 10, 100);  // STEP 6 Display Text
  }
}


