
PImage img;
PImage img2;

int m = 255;
int n = 255;
int o = 255;
int p = 255;
int r = 10;

int start_time = 0;

void setup() {

  size(1000, 680);
  noStroke();

  img = loadImage("chalk0.jpg");
  img2 = loadImage("chalk2.jpg");
  //  img.mask(imgMask);
}


void draw() {
  
 if ( millis() >= start_time && millis() < start_time + 15000 ) { 
   image(img, 0, 0);
   }
   
   if ( millis() >= start_time + 15000 && millis() < start_time + 45000 ) { 
   image(img2, 0, 0);
   }
   
    if ( millis() >= start_time + 45000 && millis() < start_time + 75000 ) { 
   image(img2, 0, 0);
   }
   
    if ( millis() >= start_time + 105000 && millis() < start_time + 135000 ) { 
   image(img2, 0, 0);
   }
   
    if ( millis() >= start_time + 165000 && millis() < start_time + 195000 ) { 
   image(img2, 0, 0);
   }
   
   if ( millis() >= start_time + 195000 ) { 
   start_time = millis();
   }

  if (mousePressed) {
    
    if ( mouseX > 0 && mouseX < 300 ) {
      m = m - 7;
      //   r = r + 1;
    } 
    else {
      m = 255;
    }

    if ( mouseX > 250 && mouseX < 500 ) {
      n = n - 7;
      //   r = r + 1;
    } 
    else {
      n = 255;
    }

    if ( mouseX > 500 && mouseX < 750 ) {
      o = o - 7;
      //   r = r + 1;
    } 
    else {
      o = 255;
    }

    if ( mouseX > 750 && mouseX < 1000 ) {
      p = p - 7;
      //   r = r + 1;
    } 
    else {
      p = 255;
    }

    //  image(img, 0, 0);
  }
      fill(0, m);
    rect(0, 0, 250, 960);

    fill(0, n);
    rect(250, 0, 250, 960);

    fill(0, o);
    rect(500, 0, 250, 960);

    fill(0, p);
    rect(750, 0, 250, 960);
    
    

}

/*
  void mousePressed() {

    if ( mouseX > 0 && mouseX < 300 ) {
      m = m - 20;
      //   r = r + 1;
    } 
    else {
      m = 255;
    }

    if ( mouseX > 300 && mouseX < 600 ) {
      n = n - 20;
      //   r = r + 1;
    } 
    else {
      n = 255;
    }

    if ( mouseX > 600 && mouseX < 900 ) {
      o = o - 20;
      //   r = r + 1;
    } 
    else {
      o = 255;
    }

    if ( mouseX > 900 && mouseX < 1280 ) {
      p = p - 20;
      //   r = r + 1;
    } 
    else {
      p = 255;
    }


    /*

     image(img, 0, 0);
     
     fill(#FFFFFF, m);
     image(img, 0, 0);
     --
     fill(#FFFFFF, m);
     rect(0, 0, 300, 960);
     
     fill(#FFFFFF, n);
     rect(300, 0, 300, 960);
     
     fill(#FFFFFF, o);
     rect(600, 0, 300, 960);
     
     fill(#FFFFFF, p);
     rect(900, 0, 380, 960);
     
     --
     fill(#FFFFFF, m);
     ellipse(mouseX, mouseY, r, r);
     
     fill(#FFFFFF, n);
     ellipse(mouseX, mouseY, r, r);
     
     fill(#FFFFFF, o);
     ellipse(mouseX, mouseY, r, r);
     
     fill(#FFFFFF, p);
     ellipse(mouseX, mouseY, r, r);
     
  }
*/


