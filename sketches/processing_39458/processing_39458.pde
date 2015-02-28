
int ellipseOneRadius = 50;
int ellipseTwoRadius = 50;
int ellipseThreeRadius = 50;

int ellipseOneState = 0;
int ellipseTwoState = 0;
int ellipseThreeState = 0;

void setup()
{
 size(640, 360);
 smooth();
}

void draw()
{

 background(255,222,22);

 fill(255);
 PFont font;
 font = loadFont("Times-Roman-12.vlw");
 textFont(font);
 String mousePosition = "mouseX = " + mouseX + ", mouseY = " + mouseY + ", radius = " + ellipseOneRadius;
 text(mousePosition, 15, 20, 640, 70);

 switch(ellipseOneState)
 {
   case 0:
     fill(255);
     if ((200-mouseX)*(200-mouseX) + (180-mouseY)*(180-mouseY) < ellipseOneRadius*ellipseOneRadius)
       ellipseOneState = 1;
     break;
   case 1:
     fill(255-(ellipseOneRadius-50)*255/20);
     ellipseOneRadius += 4;
     if (ellipseOneRadius >= 70)
       ellipseOneState = 2;
     break;
    case 2:
     fill(0);
     if ((200-mouseX)*(200-mouseX) + (180-mouseY)*(180-mouseY) > ellipseOneRadius*ellipseOneRadius)
       ellipseOneState = 3;
     break;
    case 3:
      fill(255-(ellipseOneRadius-50)*255/20);
      ellipseOneRadius -= 3;
      if (ellipseOneRadius <= 50)
       ellipseOneState = 0;
      break;
 }
 //fill(0);
 ellipse(200, 180, ellipseOneRadius*2, ellipseOneRadius*2);

 switch(ellipseTwoState)
 {
   case 0:
     fill(255);
     if ((320-mouseX)*(320-mouseX) + (180-mouseY)*(180-mouseY) < ellipseTwoRadius*ellipseTwoRadius)
       ellipseTwoState = 1;
     break;
   case 1:
     fill(255-(ellipseTwoRadius-50)*255/20);
     ellipseTwoRadius += 5;
     if (ellipseTwoRadius >= 70)
       ellipseTwoState = 2;
     break;
   case 2:
     fill(0);
     if ((320-mouseX)*(320-mouseX) + (180-mouseY)*(180-mouseY) > ellipseTwoRadius*ellipseTwoRadius)
       ellipseTwoState = 3;
     break;
    case 3:
      fill(255-(ellipseTwoRadius-50)*255/20);
      ellipseTwoRadius -= 3;
      if (ellipseTwoRadius <= 50)
       ellipseTwoState = 0;
     break;
 }
 ellipse(320, 180, ellipseTwoRadius*2, ellipseTwoRadius*2);

 switch(ellipseThreeState)
 {
   case 0:
     fill(255);
       if ((440-mouseX)*(440-mouseX) + (180-mouseY)*(180-mouseY) < ellipseThreeRadius*ellipseThreeRadius)
       ellipseThreeState = 1;
     break;
   case 1:
     fill(255-(ellipseThreeRadius-50)*255/20);
     ellipseThreeRadius += 4;
     if (ellipseThreeRadius >= 70)
       ellipseThreeState = 2;
     break;
   case 2:
     fill(0);
     if ((440-mouseX)*(440-mouseX) + (180-mouseY)*(180-mouseY) > ellipseThreeRadius*ellipseThreeRadius)
       ellipseThreeState = 3;
     break;
    case 3:
      fill(255-(ellipseThreeRadius-50)*255/20);
      ellipseThreeRadius -= 4;
      if (ellipseThreeRadius <= 50)
       ellipseThreeState = 0;
     break;
 }
 ellipse(440, 180, ellipseThreeRadius*2, ellipseThreeRadius*2);

}

