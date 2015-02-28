
void setup() {
    size (300,300);
    float r=150;
float g=90;
float b=180;
 background(r,g,b);
    stroke(255);
   // diaginal lines;
     int x = 0;
     int y = 0;
int spacing = 10;
  int len = 300;
  stroke (255);
       while (y < 450) {
   line (x+len,y-150,x,y);
   y=y+spacing;
   x=x;
       }
}
void draw () {
float r=250;
float g=290;
float b=280;
  smooth();
  float x = 140;
  float y = 140;
  noStroke();
  fill(r,g,b);
  //bones;
  beginShape(); 
  vertex(x-75,y-5);
  vertex(200,190);
  vertex(210,180);
  vertex(80,130);
  endShape(CLOSE);
 beginShape(); 
  vertex(x-70,y+40);
  vertex(200,125);
  vertex(210,135);
  vertex(80,190);
  endShape(CLOSE);
 ellipse(x-64,y-16,15,15);
 ellipse(x+64,y-16,15,15);
  ellipse(x-71,y-5,15,15);
    ellipse(x+71,y-5,15,15);
  ellipse(x+65,y+52,15,15);
  ellipse(x-65,y+52,15,15);
  ellipse(x+69,y+40,15,15);
    ellipse(x-69,y+40,15,15);
    //skull
     ellipse(x,y,80,80);
  rect (x-36,y+30,75,25);
  fill(0);
  stroke(0);
  ellipse(x+20,y,15,35);
  ellipse(x-20,y,15,35);
  ellipse(x,y+25,9,10);
  //teeth;
  rect(x-30,y+40,x-80,5);
  rect(x-20,175,-3,15);
  rect(x-10,175,3,15);
  rect(x+5,175,3,15);
  rect(x+20,175,3,15);
  fill(random(205),random(150),b);
  noStroke();
  ellipse(mouseX+5,mouseY,15,15);
  
}


