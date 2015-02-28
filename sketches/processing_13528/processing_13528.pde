
void setup () {
  size(500,400);
background(200);
  smooth();}
  void draw () {


    stroke(200,0,0);
    fill(random(255),120,133);

    float y=0.5;

    for(y=0.5; y<1000; y=y*2)
    {ellipse(random(20)*y,100,y,random(400));}
    delay(100);
  }
 
    
    void mousePressed() {
    fill(0,233,225);
    triangle(mouseX,mouseY,mouseX+10,mouseY-16,mouseX+10,mouseY+6);
    triangle(mouseX+10,mouseY,mouseX+16,mouseY-4,mouseX+16,mouseY+4);

}

