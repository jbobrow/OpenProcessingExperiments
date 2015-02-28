
//Sun Kyung Park
//sunkyunp
//Homework7
//Copyright Sun Kyung Park 2012

float bx, by, bd, bxSpeed, bySpeed;
float gx, gy, gd, gxSpeed, gySpeed;
float d;
float px, py, pd, rx, ry, rd, ox, oy, od, lx, ly, ld;
float hits;
float tx, ty, twd, tht;

void setup () {
  size (400, 400);
  smooth ();
  bx = 0;
  by = random (height);
  bd = 100;
  bxSpeed = 3;
  bySpeed = 4;

  gx = width/2;
  gy = height/2;
  gd = 100;
  gxSpeed = 0;
  gySpeed = 0;

  pd = 100;
  rd = 100;
  od = 100;
  ld = 100;

  tx = width/3;
  ty = height/4;
  twd = width/2;
  tht = height/4;

  hits = 0;

  textSize (20);
  textAlign (CENTER);
}


void draw () {
  background (255);
  drawCircle(bx, by);
  bounceCircle ();
  drawMouse (gx, gy);
  moveMouse ();

  collision ();
  displayText ();
  collisionDetection ();

}


void displayText () {
  fill (167,167,167);
  text ("TIME"  +" " +" " +" " + millis()/1000, width*0.5, height*0.2);
}


void drawCircle(float bx, float by) {
  fill (240, 42, 189);
  noStroke ();
  ellipse( bx, by, 20, 20);
}

void bounceCircle () {
  bx = bx+ bxSpeed;
  if (bx > width)
  {
    bxSpeed = -bxSpeed;
  }
  else if (bx < 0) {
    bxSpeed = -bxSpeed;
  }

  by = by + bySpeed;
  if (by > height)
  { 
    bySpeed = -bySpeed;
  }
  else if (by < 0)
  {
    bySpeed = -bySpeed;
  }
}


void drawMouse (float gx, float gy) {
  fill (175,245,238);
  ellipse (gx, gy, gd/3, gd/3);
}

  void mousePressed () {
    if (mouseX > pmouseX) {
      gxSpeed = gxSpeed + 0.5;
    }
    else if (mouseX < pmouseX) {
      gxSpeed = gxSpeed - 0.5;
    }
    if (mouseY > pmouseY) {
      gySpeed = gySpeed + 0.5;
    }
    else if (mouseY < pmouseY) {
      gySpeed = gySpeed - 0.5;
    }
  }


void moveMouse () {

  gx = gx + gxSpeed;
  if (gx > width + gd*0.5) {
    gx = -gd*0.5;
  }

  else if (gx < -gd*0.5) {
    gx = width + gd*0.5;
  }

  gy = gy + gySpeed;
  if (gy > height + gd*0.5) {
    gy = -gd*0.5;
  }
  else if (gy < -gd*0.5) {
    gy = height + gd*0.5;
  }
}


void collision ()
{ //copyright michael loffredo
  d = dist (bx, by, gx, gy);
  if (d < 50) {
    fill (255);
//FILL IT IN
    hits++;
    bx = random (0, width);
    by = random (0, height);
    bxSpeed = random (0, bd/10);
    bySpeed = random (0, bd/10);
    px = random (0, width);
    py = random (0, height);
    //CIRCLE CODE HERE

 fill (210, 20, 40);
  ellipse (px, py, pd/10, pd/10);


    rx = random (0, width);
    ry = random (0, height);
    //CIRCLE CODE HERE
    
     fill (210, 20, 40);
  ellipse (rx, ry, rd/10, rd/10);



    ox = random (0, width);
    oy = random (0, height);

    // CIRCLE CODE HERE

    fill (210, 20, 40);
    ellipse (ox, oy, od/10, od/10);

    lx = random (0, width);
    ly = random (0, height);

    // CIRCLE CODE HERE

    fill (210, 20, 40);
    ellipse (lx, ly, ld/10, ld/10);
  }
}

void collisionDetection ()
{
  fill (167,167,167);
  text ("GOAL:" + " " +hits, width*0.5, height *0.3);
}




