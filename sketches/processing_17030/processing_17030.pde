
float x = 133;
float y = 180;
float a = 66;
float f = 66;
float g = 166;
float z = 180;
float r = 66;
float l = 133;
float speed = 1;
float counter = 1;


void draw() {
 



 size(200,200);
 background(255);    // Setting the background to white
 rectMode(CENTER);
 line(100,110,l,130);   // left arm
 line(100,120,l,140);   // left arm
 line(l,130,l,140);   // left arm
 if (l > 100) {
   ellipse(l + 5,135,10,10);
 } else {
   ellipse(l - 5, 135,10,10);  // left hand
   }
 rect(100,100,20,100);
 ellipse(100,70,50,60);
 ellipse(115,65,12,16);
 ellipse(118,65,3,4);

  move();
  display();
}

void move() {
  x = x - speed
  if (x < 66) {
    x = 133;
  }
  a = a + speed
  if (a > 133) {
    a = 66;  
  }
  f = f - speed
  if (f < 0) {
    f = 200;
    }
  g = g - speed
  if (g < 0) {
    g = 200;
    }
  if (a < 100) {
    z = z - speed/3;
  } else {
    z = z + speed/3;
    }
  counter = counter + 1;
  if (counter%136 <= 67) {
    r = r + speed;
    l = l - speed;
   } else if (counter%136 >= 68) {
    r = r - speed;
    l = l + speed;
    }
}

  
void display() {
  line(95,150,x,y);     // leg #1 left side
  line(105,150,x + 10,y);    // leg #1 right side
  line(x,y,x + 10,y);    // leg #1 bottom
  ellipse(x + 10,y + 5,15,10);  // shoe #1
  rect(x + 5,y + 5,10,10);    // shoe #1
  
 line(100,110,r,130);   // right arm
 line(100,120,r,140);   // right arm
 line(r,130,r,140);   // right arm
 if (r > 100) {
   ellipse(r + 5,135,10,10);
 } else {
   ellipse(r - 5, 135,10,10);  // right hand
   }
  
  line(95,150,a,z);         // leg #2 left side
  line(105,150,a + 10,z);   // leg #2 right side
  line(a,z,a + 10,z);    // leg #2 bottom
  ellipse(a + 10,z + 5,15,10);  // shoe #2
  rect(a + 5,z + 5,10,10);    // shoe #2
  line(0,190,200,190)
  
  line(f,190,f,200);    // side walk line #1
  line(g,190,g,200);    // side walk line #2
}
                                
