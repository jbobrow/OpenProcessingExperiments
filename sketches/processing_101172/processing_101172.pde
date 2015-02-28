
PVector velocity;

float tx = 0;
float ty = 1000;
float speed = 0.001;

void setup()
{
  size(800, 800);  
  background(255);
  velocity = new PVector (1, 1);
}

void draw()
{
  PVector mouse = new PVector(mouseX, mouseY);
  

  // code that happens every frame
  float velocidad = dist(pmouseX, pmouseY, mouse.x, mouse.y);
  float gordo = map (velocidad, 0, height, 0, 20);
  float alpha = map(mouse.y, 0, 255, 0, 0.1);
  noStroke();
  fill(125, alpha);
  rect(0, 0, width, height);

  velocity.x = map (noise(tx), 0, 1, 0, width);
  velocity.y = map (noise(ty), 0, 1, 0, height);

  tx += speed;
  ty += speed;


  stroke (0);
  pincel1(random(0, width), random(0, height), velocity.x, velocity.y, random(0, 0.1), random(0, 255));

  velocity.x += 0.1;
  velocity.y += 0.4;

  if (velocity.y >= height) {

    velocity.y = 0;
    velocity.x = random(0, width);
  }

  if (mouse.x <= width /2) {

   
    mouse.x = random(0, width);
    mouse.y = random(0, height);
  }


  
}




void mouseDragged()

{
  // code that happens when the mouse moves
  // with the button down
}

void mousePressed()
{
  // code that happens when the mouse button
  // is pressed
}

void mouseReleased()
{
  // code that happens when the mouse button
  // is released
  //background(255);
}

void keyPressed()
{
  // code that happens when the mouse button
  // is pressed

    background(255);
}

void pincel1(float x, float y, float px, float py, float grosor, float col){
  strokeWeight(grosor);
  stroke(0,123,127,col);
 //line (x, y, px, py);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  line(px,height/2+((height/2)-py),x,height/2+((height/2)-y));
  line(width/2+((width/2)-px),height/2+((height/2)-py),width/2+((width/2)-x),height/2+((height/2)-y));
  line(width/2+((width/2)-py),width/2-((width/2)-px),width/2+((width/2)-y),width/2-((width/2)-x));
  line(height/2-((height/2)-py),width/2-((width/2)-px),height/2-((height/2)-y),width/2-((width/2)-x));
  line(width/2+((width/2)-py),height/2+((height/2)-px),width/2+((width/2)-y),height/2+((height/2)-x));
  line(width/2-((width/2)-py),height/2+((height/2)-px),width/2-((width/2)-y),height/2+((height/2)-x));  
  
  
  //line(px,py,x,y);
  //line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  //ellipse(width/2-((width/2)-y),height/2+((height/2)-x),px,py);  
  
  return;

     
}


