
    /* @pjs globalKeyEvents="true"; */
    PImage b;
    PImage c;
    PImage d;
    PImage e;
    
    boolean start = true;
    
    void setup()
    {
      size(300, 300);
      b = loadImage("http://i.imgur.com/BRNot.jpg");
      c = loadImage("https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSaCIv7wtiC2uVzDleupT33cVC9iKsmj8_kh0ycDYoKvbSnnSu9Vg");
      d = loadImage("http://i.imgur.com/DBz93.jpg");
      e = loadImage("http://i.imgur.com/25s7m.jpg");
      
    }
    void draw()
    {
      if (start == true)
      {
        background(0);
        stroke(10, 255, 10);
        fill(0, 250, 0);
        textSize(19);
        text("Welcome to the drawing game!", 0, 20);
        text("Instructions: draw whatever you", 0, 100);
        text("want on any of the provided images.", 0, 138);
        stroke(255, 0, 0);
        text("Right click here for on-screen", 0, 225);
        text("controls to this program.", 0, 250);
        start = false;
      }
      mouseDragged();
    }
    void mouseDragged()
    {
      if (keyPressed == true && key == 'z')
      {
        stroke(100, 100, 100); //gray
        fill(random(10), random(10), random(10), 10 );
        ellipse(mouseX, mouseY, random(10), random(10));
      }
      if (keyPressed == true && key == 'x')
      {
        stroke(0, 228, 0); //green
        fill(random(10), random(10), random(10), 10 );
        ellipse(mouseX, mouseY, random(10), random(10));
      }
      if (keyPressed == true && key == 'c')
      {
        stroke(60, 40, 40); //brown
        fill(random(10), random(10), random(10), 10 );
        ellipse(mouseX, mouseY, random(10), random(10));
      }
      if (keyPressed == true && key == 'v')
      {
        stroke(0); //black
        fill(random(10), random(10), random(10), 10 );
        ellipse(mouseX, mouseY, random(10), random(10));
      }
      if (keyPressed == true && key == 'b')
      {
        stroke(255, 0, 0); //red
        fill(random(10), random(10), random(10), 10 );
        ellipse(mouseX, mouseY, random(10), random(10));
      }
    }
    void keyPressed()
    {
      if (keyPressed == true && key == 'a')
      {
        fill(255, 255, 255, 10);
        image(b, 0, 0, 300, 300);
      }
      if (keyPressed == true && key == 's')
      {
        fill(255, 255, 255, 10);
        image(c, 0, 0, 300, 300);
      }
    
      if (keyPressed == true && key == 'd')
      {
        fill(255, 255, 255, 10);
        image(d, 0, 0, 300, 300);
      }
      if (keyPressed == true && key == 'f')
      {
        fill(255, 255, 255, 10);
        image(e, 0, 0, 300, 300);
      }
    }
    void mousePressed()
    { 
 if (mouseButton == LEFT)
      {
        background(0);
        stroke(10, 255, 10);
        fill(0, 250, 0);
        textSize(19);
        text("Welcome to the drawing game!", 0, 20);
        text("Instructions: draw whatever you", 0, 100);
             text("want on any of the provided images.", 0, 138);
        stroke(255, 0, 0);
        text("Right click here for on-screen", 0, 225);
        text("controls to this program.", 0, 250);
      }
     
    
    
    if (mouseButton == RIGHT)
    {
    background(0);
    stroke(0, 0, 255);
    textSize(18);
    text("Press and hold until an image appears:", 0, 25);
    text("'a' for Santa Clause", 0, 50);
    text("'s' for Spongebob and Patrick", 0, 75);
    text("'d' for Mario", 0, 100);
    text("'f' for Blitzcrank", 0, 125);
    stroke(12, 34, 56);
    text("~Color~", 0, 150);
    stroke(100, 100, 100);
    text("Hold 'z' for gray", 0, 175);
    stroke(0, 228, 0);
    text("Hold 'x' for green", 0, 200);
    stroke(60, 40, 40);
    text("Hold 'c' for brown", 0, 225);
    stroke(0);
    text("Hold 'v' for black", 0, 250);
    stroke(255, 0, 0);
    }
    }
    
    
