
int totalpoints = 100; // How many points do we want to remember? If it's slow.. make it smaller.
int[] x = new int[totalpoints];
int[] y = new int[totalpoints];

PImage amask, angler;
PShape cloud;

int bob;

Animation animation1, animation2;
int xpos=width/2;
int ypos=height/2;
int imageCount;

void setup() {
  size(800, 450);
  smooth();
  y[0] = 90;
  cloud = loadShape("cloud.svg");
  
  animation1 = new Animation("umbrella_", 17);
}

void draw() {
  background(#f11342);

  // Shift everything down by one
  for (int i = x.length-1; i > 0 ; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }

  // Set the top of to our most recent mouse points
  x[0] = mouseX+10;
  y[0] = 80;

  //Draw the last 50 points
  for (int i = x.length-1; i > 0 ; i--) {
    //rect(x[i]+random(-i, 9)-30,y[i]+random(-i,i)-150,2,10);
    //fill(255);
    //fill(#1DCE15,200-i); // Make it fade out as they get older
    for (int j = 0; j < i; j +=15) {
      //ellipse(x[i]+random(-i, i)/5+j*4, y[i]+random(-i, i)/5, 30, 30); //wiggling ellipses
      fill(#214816, 255);
      //rect(x[i]+random(-i, 9)+i-60,y[i]+j*5+random(-j/2,j/2),2,10);
      strokeWeight(1);
      stroke(#f11342);
      //noStroke();
      rect(x[i]+random(-i, 9)+i-60, y[j]+j*2+random(-j, j)+70, 2, 10);
      rect(x[i]+random(-i, 9)+i-60, y[j]+j*2+5+random(-j, j)+70, 2, 10);
    }
  }

  //shape(rainshield, mouseX-600,30,1200,800);

  if ((mouseX<width/2) || (mouseX>width/2+181)) {
    animation1.ReverseDisplay(width/2, height/2);
  }
  else {
    animation1.display(width/2, height/2);
  }


  noStroke();
  fill(#f11342);
  quad(mouseX-100, 0, mouseX-100, height, mouseX-820, height, mouseX-820, 0);
  quad(mouseX+100, 0, mouseX+100, height, mouseX+820, height, mouseX+820, 0);
  
  shape(cloud, mouseX-130, 30, 260, 150);

   if ((mouseX<width/2) || (mouseX>width/2+181)) {
    animation1.ReverseDisplay(width/2, height/2);
  }
  else {
    animation1.display(width/2, height/2);
  }


  //bob++;
}




// Class for animating a sequence of GIFs

class Animation {
  PImage[] images;
  int frame;

  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i+1, 0) + ".jpg";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {

    if (frame<imageCount) {
      tint(255,75);
      image(images[frame], xpos, ypos);
      if (frameCount % 12 == 0) {
        frame = (frame+1);
      }
    }

    if (frame==imageCount) {
      tint(255,75);
      image(images[16], xpos, ypos);
    }
  }

  void ReverseDisplay(float xpos, float ypos) {
      if (frame>0) {
        tint(255,75);
        image(images[frame-1], xpos, ypos);
        if (frameCount % 12 == 0) {
        frame = (frame-1);
        }
      }

    if (frame==0) {
      tint(255,75);
      image(images[0], xpos, ypos);
    }
  }

  int getWidth() {
    return images[0].width;
  }
}





