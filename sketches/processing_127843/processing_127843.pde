
void setup()  {
   size(800,600);
   smooth();
   rectMode(CENTER);
   stroke(100);
   mouseX = 800/2;
   mouseY = 0;
   textAlign(CENTER);
   redraw();

   
}

void draw()  {
  background(125, mouseX * (255.0/1500), 10);
  // Slight hint for the user!
  strokeWeight(0.5);
  stroke(255);
  line(400,100,400,500);
  textSize(32);
  //text("Can you maybe... create a Circle?", 20,550);
  //redraw(); sent outside of draw()
  stroke(10);
  strokeWeight(5);
  line(800/2,600/2, mouseX, mouseY);
  fill(175);
  ellipse(mouseX,mouseY,30,30);
  println(mouseX);
  if (mouseX > 400)  {
    rect(mouseX,mouseY,30,30);
    text("Polygonal Territory!", 400,575);
    text("Find your lost twin!", 400, 525);
    rect(800/2,600/2,mouseX/4,mouseY/4);
    if (mouseX/4 == mouseY/4)  {
      //fill(10,10,10,10);
      translate(10,10);
      rect(800/2,600/2,mouseX/4,mouseY/4);
      println("It's a Square!");
      text("A twin square!", 400,50);
      //Following restart causing problems with javascript
      //text("Restart? - Mouse Left Button", 400, 100);
      //if (mouseButton == LEFT)  {
        //background(255);
        //mouseX = 800/2;
        //mouseY = 0;
      //}
      
    }
  } else if (mouseX < 400)  {
    
    text("Circular Territory!", 400,575);
 
    text("Move to the Dark Side!", 400, 525);
    ellipse(800/2,600/2,mouseX/2,mouseY/2);
    if (mouseX/2 == mouseY/2)  {
      fill(10);
      ellipse(800/2,600/2,mouseX/2,mouseY/2);
      textSize(32);
      text("You just found your dark side!", 400,50);
      //Following restart causing problems with javascript
      //text("Restart? - Mouse Left Button", 400, 100);
      //if (mouseButton == LEFT)  {
        //background(255);
        //mouseX = 800/2;
        //mouseY = 0;
      //}
      println("It's a Circle!");
    }
  }
}


