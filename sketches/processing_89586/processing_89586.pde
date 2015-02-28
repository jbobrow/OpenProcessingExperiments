
void setup() {
  size(400,400);
  background (250,15,8);
  
}
 void draw() {
 
   
   ellipse(100,100,50,50);
   fill(65,245,12); // green
   ellipse(200,200,300,300); // head
   fill(255);
   ellipse(100,100, 150,150); //right eye 
   fill(0);
   ellipse(100,100,50,50); //right black pupil
   fill(255);
   ellipse(330,100,150,150);// left eye
   fill(0);
   ellipse(330,100,50,50); // left black pupil
   arc(200, 200, 10, 10,0, PI);// nose
   arc (250,250, 100,100,0,PI); // mouth
  
   if (mousePressed) {
    stroke(0);
  } else {
    stroke(255); 
  }
  ellipse(330,100,50,50);

 }
