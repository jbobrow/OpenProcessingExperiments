
// Leyli Guliyeva
// Homework 8
// copyrights 2012


////////////////////////////////////////
// Press the mouse for larger circles/////////
// Press any key to bring out the smallest circles////



float x = 40;
float y = 60;


void setup () {
  size (400, 400);
  background (#F5E0CD);
  smooth ();
}

void draw () {
  circles ();

}
    
void circles () {
  smooth();
   float a, b, c, d, e, y1, y2, y3, y4, y5, wd, ht;
   color col, col1;
    a = 30;
    b = 30;
    c = 30;
    d = 30;
    e = 30;
    y1 = height/2;
    y2 = (height/2)+ (height/4);
    y3 = (height/2) - (height/4);
    y4 = 400;
    y5 = 0;
    wd = 40;
    ht = 40;
    x = width-30;
    
    col = color (#18867E);
    col1 = color (#42A7A0);
    
    if (mousePressed == true) {
    stroke (255);
    strokeWeight (9);
    line (0, height/2, width, height/2);
    line (0, (height/2)+ (height/4), width, (height/2)+ (height/4));
    line (0, (height/2)- (height/4), width, (height/2)- (height/4)); 
    wd = 70;
    ht = 70;
  } 
  
    if (keyPressed == true) {
    wd = wd-30;
    ht = ht-30;
}
     
      
  while (a < x) {
    stroke (255);
    strokeWeight(9);
    line (a, 0, a, height);
    strokeWeight (3);
    stroke (col);
    noFill ();
    //noStroke ();
    ellipse (a, y1, wd, ht);
    a = a + 30;
    
  }
    
    
  while (b < x) {
    strokeWeight (3);
    stroke (col1);
    //noFill ();
    //noStroke ();
    ellipse (b, y2, wd, ht);
    b = b + 30;
  }
    
    
    while (c < x) {
    strokeWeight (3);
    stroke (col1);
    //noFill ();
    //noStroke ();
    ellipse (c, y3, wd, ht);
    c = c + 30;
  }
  
    while (d < x) {
    strokeWeight (3);
    stroke (col);
    //noFill ();
    //noStroke ();
    ellipse (d, y4, wd, ht);
    d = d + 30;
  }
  
    while (e < x) {
    strokeWeight (3);
    stroke (col);
    //noFill ();
    //noStroke ();
    ellipse (e, y5, wd, ht);
    e = e + 30;
  }
}

  
  
  
  
  
  

