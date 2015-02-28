
int counter;

void setup() {  //setup function called initially, only once
  size(400, 400);
  background(60,00,130);  //set background purple
  colorMode(HSB);
}

void draw() { 
    if(mousePressed==true)
    {
    boolean t = true;
    while(t)
    {
    noStroke();
    fill();
    ellipse(mouseX,mouseY,100,100);
    t = false
    }
    }
    colorMode(HSB);
    stroke();
    ellipse(mouseX,mouseY,100,100);
    

}
