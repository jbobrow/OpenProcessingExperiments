
//int xpos,ypos;
ball myball;
int score=3;

void setup() 
{ 
  size(200,200,P2D); 
  background(222); 
  noStroke(); 
  smooth();
  myball = new ball(          // Ball installation  
    width/2,                    // Start pos for x
    height/2,                   // Start pos for y 
    1,                          // Speed in x
    1,                          // Speed in y
    1,                          // Direction in x ( + is right while -1 is left )
    1,                          // Direction in y ( + is up and - value is down )
    3,                          // Livesb 
    true                        // Visable?
  );
  
  PFont fontA = loadFont("AmericanTypewriter-CondensedBold-20.vlw");        // Load the font

  textFont(fontA, 20);                                  // Set the font and its size
  fill(55);

  text("Lives : ", 100, height-1);

}

void draw() 
{ 
    back();
    pad();
    myball.play();
    
    if(mousePressed) myball.ball(          // Ball installation  
      width/2,                    // Start pos for x
      height/2,                   // Start pos for y 
      1,                          // Speed in x
      1,                          // Speed in y
      1,                          // Direction in x ( + is right while -1 is left )
      1,                          // Direction in y ( + is up and - value is down )
      3,                          // Livesb 
      true                        // Visable?
     );
}

void pad()
{
  rectMode(CENTER);
  fill(222);
  rect(mouseX,4*(height/5),40,6);
  myball.hit(mouseX,4*(height/5));
}

void back()
{
  rectMode(CORNER);
  //noStroke();
  fill(0);
  rect(10,10,(width-20),(height-20));
  fill(255);
  text(myball.l, 180, height-1);
}





