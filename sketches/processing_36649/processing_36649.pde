
boolean button1 = false;
boolean button2 = false;
boolean button3 = false;

int x1, x2, y1, y2;
int lx, ly;
int s1, s2, s3;
int maxX, maxY;

int rec1x, rec1y, rec1h, rec1w;
int rec2x, rec2y, rec2h, rec2w;
int scrx, scry, scrh, scrw;


color yellow = #FFFF00;
color red    = #FF0000;
color blue   = #0000FF;
color green  = #33FF00;
color white  = #FFFFFF;
color black  = #000000;

void setup(){

  maxX = 800;
  maxY = 500;


  lx=50; ly=10;
  
  x1= 10; y1= 10;
  
  rec1x=500; rec1y=0; rec1h=100; rec1w=40;
  rec2x=200; rec2y=0; rec2h=50;  rec2w=20;

  scrx=maxX-50; scry=0; scrh=maxY-10; scrw=10;
 
  size (maxX, maxY);
  smooth ();
  
     
}


void mousePressed () {
 
  
  
  if ((mouseX <30) && (mouseY <30 )) {
 
    button1 =!button1;
    button2 = false;
    button3 = false;
  }
 
  else if((mouseX < 60) &&(mouseY < 30 )) {
 
    button2 =!button2;
    button1 = false;
    button3 = false;
  }
  else if((mouseX < 100) &&(mouseY < 30 )) {
 
    button3 =!button3;
    button2 = false;
    button1 = false;
  }
}


void draw() {
 
  background (100);
  noStroke();

  fill(white);
  if (button1)       rect (12,12,20,20);
  else if (button2)  rect (42,12,20,20);
  else if (button3)  rect (72,12,20,20);


  fill (yellow);   rect (10,10,20,20);
  fill (blue);  rect (40,10,20,20);
  fill (green); rect (70,10,20,20);
 

  strokeWeight(0);
  fill(yellow); ellipse(lx, maxY-ly, 10, 10); 
  fill(blue);   rect(rec1x,maxY-rec1y-rec1h, rec1w, rec1h);
  fill(green);  rect(rec2x,maxY-rec2y-rec2h, rec2w, rec2h);
  fill(white);  rect(scrx,maxY-scry-scrh, scrw, scrh);    
  
  s1=int(((scrx-lx)*(rec1h-ly)/(rec1x-lx)+ly));
  stroke(blue);   strokeWeight(1); line(lx, maxY-ly, scrx, maxY-s1);
  stroke(blue); strokeWeight(4); line(scrx, maxY-s1, scrx, maxY );    

  s2=int(((scrx-lx)*(rec2h-ly)/(rec2x-lx)+ly));
  stroke(green);   strokeWeight(1); line(lx, maxY-ly, scrx, maxY-s2);
  stroke(green); strokeWeight(4); line(scrx+4, maxY-s2, scrx, maxY );    



  if (keyPressed && (key == CODED)) { 
    if (keyCode == LEFT) {
      if (button1)       lx--;
      else if (button2)  rec1x--;
      else if (button3)  rec2x--;
     } 
    else if (keyCode == RIGHT) {
      if (button1)       lx++;
      else if (button2)  rec1x++;
      else if (button3)  rec2x++;
    }
    else if (keyCode == UP) {
      if (button1)       ly++;
      else if (button2)  rec1h++;
      else if (button3)  rec2h++;
    }
    else if (keyCode == DOWN) {
      if (button1)       ly--;
      else if (button2)  rec1h--;
      else if (button3)  rec2h--;
    }

  }
  
}

