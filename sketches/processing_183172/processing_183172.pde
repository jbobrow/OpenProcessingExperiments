

int rad = 60;       
float xpos, ypos;       

float xspeed = 15.8;  
float yspeed = 15.2; 

int xdirection = 1;  
int ydirection = 1;  


int[] x2pos = new int[50]; 
int[] y2pos = new int[50];

int x = 100, y = 100;
int elpX = 50, elpY = 50;
int GunX = x + 45, GunY = y;
int shotX, shotY;
boolean isShot = false;
char shotTo = 'd', faceTo = 'd';

void setup() {
  size(1366, 768);


  smooth();

    for (int i = 0; i < x2pos.length; i ++ ) {
      x2pos[i] = 0; 
      y2pos[i] = 0;
    }
  
  ellipseMode(RADIUS);

  xpos = width/2;
  ypos = height/2;
 
}

void draw() 
{
  
  background(255);

 
    for (int i = 0; i < x2pos.length-1; i ++ ) 
    {
      x2pos[i] = x2pos[i+1];
      y2pos[i] = y2pos[i+1];
    }
   
    x2pos[x2pos.length-1] = (int)xpos; 
    y2pos[y2pos.length-1] = (int)ypos;


    for (int i = 0; i < x2pos.length; i ++ ) 
    {
     ellipse(x2pos[i],y2pos[i],i,i);
    }

  xpos += (xspeed * xdirection);
  ypos += (yspeed * ydirection);

  fill(#B4D2DE);  


  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }

  ellipse(xpos, ypos, 285, 270); 

  fill(255);

 
  ellipse( xpos, ypos+180, 20, 20);

  ellipse(xpos-190, ypos-50, 33, 33);

  ellipse(xpos+190, ypos-50, 33, 33);

 
  fill(#B4D2DE);
  stroke(0); 

  strokeWeight(10);

  line(xpos-140, ypos-155, xpos-100, ypos-125);
  line(xpos+140, ypos-155, xpos+100, ypos-125);

//---------------------------------------------
  ellipse(x,y,elpX,elpY);
  line(x,y,GunX,GunY);
  
  if(isShot)
  {
    drawShot();
  }
}

void drawShot()
{
  if(shotTo == 'd')
    ellipse(shotX += 5, shotY, 10, 10);
  else if(shotTo == 'a')
    ellipse(shotX -= 5, shotY, 10, 10);
  else if(shotTo == 's')
    ellipse(shotX, shotY += 5, 10, 10);
  else if(shotTo == 'w')
    ellipse(shotX, shotY -= 5, 10, 10);
  
  if(shotX > 1024 || shotY > 768 || shotX < 0 || shotY < 0 || hasHitFace() )
  {
    isShot = false;
  }
}

boolean hasHitFace(){
  return in_circle(xpos,ypos,270,shotX,shotY);
}

boolean in_circle(float center_x, float center_y, float radius, float x, float y){
    
    dist = sqrt(sq(center_x - x) + sq(center_y - y));
    //ellipse(xpos,ypos,radius,radius);
    //println("in_circle "+center_x+" "+center_y+" "+radius+" "+x+" "+y+" "+dist);
    return dist <= radius;
  }

void keyPressed()
{
  if(key == 'w' || key == 'a' || key == 's' || key == 'd')
  {
    Move();
  }
  if(key == 'c' && !isShot)
  {
    Shot();
  }
}

void Move()
{
  switch(key)
  {
    case 'w':
      y -= 2;
      GunX = x;
      GunY = y - 45;
      faceTo = 'w';
      break;
    case 'a':
      x -= 2;
      GunX = x - 45;
      GunY = y;
      faceTo = 'a';
      break;
    case 's':
      y += 2;
      GunX = x;
      GunY = y + 45;
      faceTo = 's';
      break;
    case 'd':
      x += 2;
      GunX = x + 45;
      GunY = y;
      faceTo = 'd';
      break;
  }
}

void Shot()
{
  isShot = true;
  shotX = x;
  shotY = y;
  shotTo = faceTo;
}


