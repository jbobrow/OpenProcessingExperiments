
/* @pjs preload= "worldmap.png"; */
/* @pjs preload= "mogolia.jpg"; */
/* @pjs preload= "ukraine.jpg"; */
/* @pjs preload= "cuba.jpg"; */
/* @pjs preload= "Unknown.jpg"; */
/* @pjs preload= "madagascar-flag.gif"; */
/* @pjs preload= "fiji.jpg"; */

PImage img;
int x;
int y;
color pix;
float pointillize = 2;
int value = 0;


void setup() {
  size(480, 310);
  img = loadImage("worldmap.png");
  //image(img, 0, 0);
  imageMode(CENTER);
  noStroke();
}

void draw() {

 //asia
  image(img, width/2, height/2); // We don't need this anymore becayse we are drawing our own pixels
  {{ if (mousePressed && (mouseButton == LEFT))  {
    if (mouseX >= 300 &&  mouseX <= 450) {
    if (mouseY >= 0 && mouseY <=160) {
     img = loadImage("mogolia.jpg");

 
  } else {
  value = 0 ;
  }
    }
  }
  }
  
 
 
  //europe
 image(img, width/2, height/2); // We don't need this anymore becayse we are drawing our own pixels
   {if (mousePressed && (mouseButton == LEFT))  {
    if (mouseX >= 200 &&  mouseX <= 300) {
    if (mouseY >= 0 && mouseY <=100) {
     img = loadImage("ukraine.jpg");

 
  } else {
  value = 0 ;
  }
    }
   }
   }
  //america
  image(img, width/2, height/2); // We don't need this anymore becayse we are drawing our own pixels
   {if (mousePressed && (mouseButton == LEFT))  {
    if (mouseX >= 0 &&  mouseX <= 150) {
    if (mouseY >= 0 && mouseY <=120) {
     img = loadImage("cuba.jpg");

 
  } else {
  value = 0 ;
  }
    }
   }
   }
  //south america
  image(img, width/2, height/2); // We don't need this anymore becayse we are drawing our own pixels
   {if (mousePressed && (mouseButton == LEFT))  {
    if (mouseX >= 50 &&  mouseX <= 170) {
    if (mouseY >= 200 && mouseY <=480) {
     img = loadImage("Unknown.jpg");

 
  } else {
  value = 0 ;
  }
    }
   }
   }
  
  //africa
  image(img, width/2, height/2);// We don't need this anymore becayse we are drawing our own pixels
   if (mousePressed && (mouseButton == LEFT))  {
    if (mouseX >= 200 &&  mouseX <= 300) {
    if (mouseY >= 120 && mouseY <=450) {
     img = loadImage("madagascar-flag.gif");

 
  } else {
  value = 0 ;
  }
  
    }
    
    //austrailia
  image(img, width/2, height/2);// We don't need this anymore becayse we are drawing our own pixels
   if (mousePressed && (mouseButton == LEFT))  {
    if (mouseX >= 380 &&  mouseX <= 455) {
    if (mouseY >= 200 && mouseY <=480) {
     img = loadImage("fiji.jpg");

 
  } else {
  value = 0 ;
  }
  
    }
   }
   }
 ///////////////////text///////////////////
 
  //asia
  
  if (mouseX >=300 && mouseX <= 450) {
    if (mouseY >= 0 && mouseY <= 160) {
      fill(0);
      textSize(15);
      text("asia", mouseX, mouseY);
    }
  }
  
  //europe
  if (mouseX >= 200 &&  mouseX <= 300) {
    if (mouseY >= 0 && mouseY <=100) {
      fill(0);
      textSize(15);
      text("europe", mouseX, mouseY);
    }
  }
//africa
if (mouseX >= 200 &&  mouseX <= 300) {
    if (mouseY >= 120 && mouseY <=450) {
      fill(0);
      textSize(15);
      text("africa", mouseX, mouseY);
    }
  }
  
  //austrailia
 if (mouseX >= 380 &&  mouseX <= 455) {
    if (mouseY >= 200 && mouseY <=480) {
      fill(0);
      textSize(15);
      text("austrailia", mouseX, mouseY);
    }
  }
  
  //america
 if (mouseX >= 0 &&  mouseX <= 150) {
    if (mouseY >= 0 && mouseY <=120) {
      fill(0);
      textSize(15);
      text("america", mouseX, mouseY);
    }
  }
  
  //south america
 if (mouseX >=50 && mouseX <=170) {
    if ( mouseY >=200 && mouseY <= 480) {
      fill(0);
      textSize(15);
      text("south america", mouseX, mouseY);
    }
  }
}  
}



