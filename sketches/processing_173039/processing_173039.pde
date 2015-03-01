
void setup(){
  size(500,500);
  background(0);
};
float r = random(100,500);

void draw(){
  for (int h=0; h<1; h=h+1) {
    frameRate(random(3, 10));
    float w = random(50,250);
    float b = random(50,200);
    float bC = random(100,255);
    fill(0, 150);
    rect(0,0,width,height);
    filter(BLUR, 0);
    noStroke();
    fill(random(175,255));
    ellipse(random(0,width),random(0,height),w, w);
    stroke(100,100,bC+20);
    fill(100,100,bC);
    ellipse(random(0,width),random(0,height),b, b);
    noFill();
    filter(BLUR, random(1,6));
     
  };
 if (mousePressed) {
   if (mouseButton==RIGHT) {
    noStroke();
    float r = random(20,80);
    filter(BLUR, 0);
    fill(random(100,255),100,100,random(20,80));
    ellipse(random(0,width),random(0,height),r, r);
   };
  };
  if(mousePressed) { 
      if (mouseButton==CENTER) {
         save("myoutput#.jpg");
      }
  };  
}



