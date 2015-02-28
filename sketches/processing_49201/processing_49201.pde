
ArrayList squares;


void setup()
{
  colorMode(HSB);
  size(1024,568);
  frameRate(50);

  smooth();
  squares = new ArrayList();
  
  for (int i = 0; i < 6; ++i)
  {
    squares.add(new jello_square(random(100,width-100),random(100,height-400)));
  }
  
}



void draw()
{
  //fill(3,220);
  fill(3,200);
  rect(0,0,width,height); //motion blur?
  //background(3); //mostly black
  //add some texture later
  jello_square temp;
  for(int i=0; i < squares.size(); ++i)
  {
    temp = (jello_square)squares.get(i);
    temp.render();
  }
    
  
}


class jello_square
{
  float xpos, ypos;
  float vx, vy; //velocity
  color s_color;
  float x_size, y_size;
  float cx1, cy1, cx2, cy2;
  float offset;
  float count; //timer
  float period;
  float ideal_y;
  float rotate_speed, rotate_amt;
  
  jello_square(float ix, float iy)
  {
    xpos = ix;
    ypos = iy;
    x_size = 50;  //distance from center, actual shape is 2 * x_size
    y_size = x_size;
    ideal_y = y_size;
    s_color = color(round(random(255)),round(random(120,255)),round(random(170,255)),70); //eventually randomize
    offset = 0;  //magnitude of sine disturbance along edges
    count = 0;
    period = 1; //what to divide count by to get sin input
    vy = 0;
    vx = random(-4,4);
    rotate_speed = 0.0;
    rotate_amt = 0;
    
  }
  
  void render()
  {
    offset = offset * 0.979;  //vibrations decrease
    y_size = 0.9*y_size + 0.1*ideal_y;
    rotate_amt += rotate_speed;
    rotate_speed *= 0.955;
    
    count = count + 1;
    fill(s_color);
    noStroke();
    pushMatrix();
    translate(xpos,ypos);
    rotate(rotate_amt);
    
    for(int i = 0; i < 4; ++i) //number of shapes
    {
    beginShape();
    vertex(-x_size,y_size); //top left
    curveVertex(-2*x_size, y_size + offset*sin(count/period));
    curveVertex(-x_size,y_size); //top left
    curveVertex(x_size,y_size); //top right
    curveVertex(2*x_size,y_size - offset*sin(count/period));
    vertex(x_size,y_size); //top right
    curveVertex(x_size + offset*sin(count/period),2*y_size);
    curveVertex(x_size,y_size); //top right
    curveVertex(x_size,-y_size); //bottom right
    curveVertex(x_size - offset*sin(count/period), -y_size);
    vertex(x_size,-y_size); //bottom right
    curveVertex(2*x_size, -y_size + offset*sin(count/period));
    curveVertex(x_size,-y_size); //bottom right
    curveVertex(-x_size, -y_size);
    curveVertex(-2*x_size, -y_size - offset*sin(count/period));
    vertex(-x_size, -y_size);
    curveVertex(-x_size + offset*sin(count/period), -2*y_size);
    curveVertex(-x_size,-y_size);
    curveVertex(-x_size,y_size);
    curveVertex(-x_size - offset*sin(count/period), 2*y_size);
 
    endShape();
    scale(0.95);
    }
    popMatrix();
    
    vy += 0.5;
    ypos += vy;
    xpos += vx;
    
    if (ypos > height - y_size)
    {
      ypos = height - y_size;
      vy = -vy;
      offset = random(160,200);
      period = random(0.7,2);
      y_size = ideal_y * 0.7;
      rotate_speed = vx*random(0.03,0.1);
    }
    
    if (xpos > width - x_size)
    {
      xpos = width - x_size;
      vx = -vx;
    }
    else if(xpos < x_size)
    {
      xpos = x_size;
      vx = -vx;
    }
    
  }
    
}

void keyPressed(){
  noLoop();
  //save("screenshot_p2_2.png");

}

void mousePressed(){
  loop();
}


