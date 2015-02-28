
 //Declaring variables
float followerX;
float followerY;
float easing = 0.05;

//Background rectangle coordinates
int x1 = 0;
int x2 = 200;
int y1 = 0;
int y2 = 200;
int w = 200;
int h = 200;

//Circle coordinates
int cx1 = 100;
int cx2 = 300;
int cy1 = 100;
int cy2 = 300;
int radius = 40;

void setup() {
  size(400, 400);
  smooth(); 
  noStroke();
  ellipseMode(RADIUS);
}

void draw() {
  //BACKGROUND RECTANGLES
  //Top left - purple
  fill(120, 60, 210); 
  rect(0, 0, width/2, height/2); 
  
  //Top right - light blue
  fill(55, 150, 240);
  rect(width/2, 0, width/2, height/2); 
  
  //Bottom left - dark blue
  fill(55, 65, 225);
  rect(0, height/2, width/2, height/2);
  
  //Bottom right - green
  fill(70, 200, 40);
  rect(width/2, height/2, width/2, height/2);
  
  //HIDDEN CIRCLES
  //setting bounds
  float tl = dist(followerX, followerY, cx1, cy1);
  float tr = dist(followerX, followerY, cx2, cy1);
  float bl = dist(followerX, followerY, cx1, cy2);
  float br = dist(followerX, followerY, cx2, cy2);
  
  //Top left - color changes
  if (tl < radius)
  {
    fill(70, 200, 40); // Green
  }
  else
  {
    fill(120, 60, 210); //Purple
  }
  ellipse(cx1, cy1, radius, radius);
  
  //Top right - color changes
  if (tr < radius)
  {
    fill(55, 65, 225); //Dark Blue
  }
  else
  {
    fill(55, 150, 240); //Light blue
  }
  ellipse(cx2, cy1, radius, radius);
  
  //Bottom left - color changes
  if (bl < radius)
  {
    fill(55, 150, 240); //Light blue
  }
  else
  {
    fill(55, 65, 225); //Dark Blue
  }
  ellipse(cx1, cy2, radius, radius);
  
  //Bottom right - color changes
  if (br < radius)
  {
    fill(120, 60, 210); //Purple
  }
  else
  {
    fill(70, 200, 40); // Green
  }
  ellipse(cx2, cy2, radius, radius);
  
  //CHANGE CURSOR COLOR
  //Mouse buttons
  if (mousePressed) 
           {
             if (mouseButton == LEFT)
             {
               fill(0); //Black
             }
             else if (mouseButton == RIGHT)
             {
               fill(255); //White
             }
             else if (mouseButton == CENTER)
             {
               fill(128); //Gray
             }
           }
  //No mouse buttons
  else 
  {
  //Top left - light blue follower on purple rect
  if ((followerX > x1) && (followerX < x1+w) &&
          (followerY > y1) && (followerY < y1+h))
           {
             fill(55, 150, 240); //Light blue
           }
  //Top right - green follower on light blue rect
  else if ((followerX > x2) && (followerX < x2+w) &&
           (followerY > y1) && (followerY < y1+h))
           {
             fill(70, 200, 40); // Green
           }
  //Bottom left - purple follower on dark blue rect
  else if ((followerX > x1) && (followerX < x1+w) &&
           (followerY > y2) && (followerY < y2+h))
           {
             fill(120, 60, 210); //Purple
           }
  //Bottom right - dark blue follower on green rect
  else if ((followerX > x2) && (followerX < x2+w) &&
           (followerY > y2) && (followerY < y2+h))
           {
             fill(55, 65, 225); //Dark Blue
           }
  }
             
  //FOLLOWER CIRCLE
  float targetX = mouseX;
  float targetY = mouseY;
  followerX += ((targetX - followerX) * easing);
  followerY += ((targetY - followerY) * easing);
  ellipse(followerX, followerY, 10, 10);
  
  
}


