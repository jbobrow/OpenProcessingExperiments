
void setup()
{
    size(600,600);
    int a=width/2;
    int b=height/2;
    background(0 ,0 , 0);

    noFill();
    stroke(255);
    strokeWeight(1);
    
     ellipse(300, 300, 200, 55);
     ellipse(300, 300, 250, 70);
     ellipse(300, 300, 150, 50);
     ellipse(300, 300, 300, 80);
     ellipse(300, 300, 350, 90);
     ellipse(300, 300, 400, 100);
     ellipse(300, 300, 450, 120);
     ellipse(300, 300, 500,150);


    PImage sun = loadImage("sun.png");
    image(sun, width/2 - 35, height/2 - 35);
    
    PImage jupiter = loadImage("jupiter.png");
    image(jupiter, width/2 - 70, height/2 - 75);
    
    PImage mars = loadImage("mars.png");
    image(mars, width/2 - 150, height/2 - 40);
    
    PImage mercury = loadImage("mercury.gif");
    image(mercury, width/2 - 170, height/2);
    
    PImage venus = loadImage("venus.gif");
    image(venus, width/2 - 222, height/2);
    
    PImage uranus = loadImage("uranus.gif");
    image(uranus, width/2 + 130, height/2);
    
    PImage saturn = loadImage("saturn.png");
    image(saturn, width/2 + 60, height/2);
    
    PImage neptune = loadImage("neptune.gif");
    image(neptune, width/2 + 60, height/2 - 50);
    
    PImage earth = loadImage("earth.png");
    image(earth, width/2, height/2 + 20);
    
    PImage star = loadImage("star.png");
    for (int i = 0; i < 100; i++)
    {
      image(star, random(width), random(height));  
    }
    
    PFont font = loadFont("AgencyFB-Reg-20.vlw"); 
    textFont(font, 20); 
    text("Universe", 15, 25);

}


