
void setup() {
  poum = 400;
  pam = 8;
  size(poum,poum);
  background(175);
    frameRate(5);
}
 
void draw() {
  color c1 = color(random(400),random(400),random(400));
  println(frameRate);
    background(175);
     stroke(random(400),random(400),random(400));
         fill(random(400),random(400),random(400));
    rect(pam/4,random(295),random(25),295);
     stroke(random(255),random(255),random(255));
       fill(random(255),random(255),random(255));
       }

                
