
void setup() {
  size (500, 500);
  background(0);

  smooth();

  pointythingy (random(20), random(30));
}

int margin =50;//scale
int spacing = 105;//number of objects--larger is like a zoom factor-more objects

void pointythingy (float a, float b) {

  for (int y=margin; y< height-margin; y+=spacing) {

    pushMatrix();

    for (int x=margin; x<width-margin; x+=spacing) {//concept is to draw one and then it is copied multiple times
      translate(spacing, 0/4);//y origin

      stroke (128);//line color
      fill (mouseX, mouseY, 42, 50);//fill and transparency
      pushMatrix();
      rotate(radians(random (360/4)));//area of entire circle is used divided into 4 quadrants

      rect (random(0, 100), random(100, 300), spacing-5, spacing-5);//object 1

      stroke(random(-2));
      stroke(5, 5, 5, 50);
      fill (245, 146, mouseY, 50);
      rect (random(25, 75), random(65, 100), (spacing-5)/2, 50);//object2

      fill (5, 50);
      rect (random(75, 100), random(200, 250), 5, 5);//object3

      stroke(-2, 50);
      line (random(5, 5), random(90, 90), 0, 0);//object4

      popMatrix();
    }
    popMatrix();//resets origin to 0
    translate (0, spacing/6);
  }
}

void draw() {
}

void mousePressed() {
  pointythingy(mouseX, mouseY);
}

//This design was created upon seeing images from the cracked mud that are 
//prominent in the current Texas drought. These images convey a sense of organic free
//flowing forms within a particular organic grid order.

//Jared Tarbel conveyed a similar design element in his "substrate" series by using a 
//solid series of squares oriented in multiple directions with shading. Another element in 
//this series was a strong figure to background relationship.

//For my design I wanted to weave together a free flowing element with a sense of order, while
//not sacrificing the negative or background space.
///Ultimately it will be the user that will create the final outcome. As one "clicks"
//on each of the four quadrants the colors of the composition will change.


//Drought:
//http://thumbs.dreamstime.com/thumblarge_281/1213882071pHqmGY.jpg

//Tarbel:
//http://www.complexification.net/gallery/machines/substrate/substrate0001.jpg] />

//This version needed to be revised to meet studio guidelines. Yet the intent remains the same.




