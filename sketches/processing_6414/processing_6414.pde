
 float generator;
 PFont font;

 void setup()
 {
  size(700,700);
  smooth();
  strokeWeight(1);
  background(20,20,20);
  font = loadFont("BrowalliaNew-29.vlw");
  textFont(font);
 }

 void draw()
 {
  //white box buddy
  if (generator >=2 && generator <= 3)
  {
   fill(random(20,100),20,20);
   stroke(200,0,0);
   rect(mouseX + random(-10,10),mouseY + random(-10,10), 40,40);
  }
  //red circle buddy
  fill(20,random(20,100), 20);
  if (generator >= 3 && generator < 4)
  {
   stroke(0,200,0);
   ellipse(mouseX ,mouseY, 30 + random(-10,10),30 + random(-10,10));
  }
  //blue triangle buddy
  if (generator >= 4 && generator < 5)
  {
   fill(20,20,random(20,100));
   stroke(0,0,200);
   triangle(mouseX + random(-10,10),mouseY + random(-10,10),
           mouseX-30 + random(-10,10),mouseY+30 + random(-10,10),
           mouseX+30 + random(-10,10),mouseY+30 + random(-10,10));
  }
  //eraser buddy
    fill(100,100,0);
    text("eraser buddy ;)", 50,50);
   if ((mouseX >= 50) && (mouseY >=40) &&
       (mouseX <= 180) && (mouseY <=50))
    {
      background(20,20,20);
    }
  if (millis() >= 8000)
   {
     text("draw something nice", 400,600);
   }
  if (millis() >= 13000)
   { 
     text("I see...", 400,625);
   }
  if (millis() >= 18000)
   {
     text("Interesting...", 400, 650);
   }
 }
  
 void mouseMoved()
 {
   generator = 0;
 }
    
 void mousePressed()
 {
   generator = random(2,5);
 }
 


