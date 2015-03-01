
import controlP5.*;

ControlP5 MyController;


boolean button = false;

boolean LineColour = false;

boolean brush = true;


int R = 0;

int G = 0;

int B = 0;


int x = 5;

int y = 5;

int w = 175;

int h = 100;


int colour = 0;

public float linethickness = 5;

float thickness = 1;


//Menu Button                                    ADDED CODE


int scaling = 1;

int rectX, rectY; // Note The rectangle uses the Upper Left Cornor as start points for Co-ordinates

int rectSizeW = w; // width of rectangle

int rectSizeH = h; // Height of rectanlge

color rectColour, baseColour;

color currentColour = baseColour;

color rectHighlight;

boolean rectOver = false;


// Second menu button


int rect1X, rect1Y;

int rect1SizeW = w;

int rect1SizeH = h;

color rect1Colour, base1Colour;

color current1Colour = base1Colour;

color rect1Highlight;

boolean rect1Over = false;


// Third menu button


int rect2X, rect2Y;

int rect2SizeW = w;

int rect2SizeH = h;

color rect2Colour, base2Colour;

color current2Colour = base2Colour;

color rect2Highlight;

boolean rect2Over = false;


//Fourth Menu button


int rect3X, rect3Y;

int rect3SizeW = w;

int rect3SizeH = h;

color rect3Colour, base3Colour;

color current3Colour = base3Colour;

color rect3Highlight;

boolean rect3Over = false;

// ADDED CODE


void setup() {

  size (1200, 1920);

  background(255);

  MyController = new ControlP5(this);

  strokeWeight(4);

  fill(255);

  rect(x, y, w, h);

  strokeWeight(4);

  MyController.addSlider("R", 0, 255, 0, x, y+(h), w, h)

    .setColorActive(#FF0000)

      .setColorBackground(#AF0000)

        .setColorForeground(#FF0000);

  rect(x, y+(h), w, h);

  strokeWeight(4);

  MyController.addSlider("G", 0, 255, 0, x, y+(h*2), w, h)

    .setColorActive(#00FF00)

      .setColorBackground(#00AF00)

        .setColorForeground(#00FF00);

  rect(x, y+(h*2), w, h);

  strokeWeight(4);

  MyController.addSlider("B", 0, 255, 0, x, y+(h*3), w, h)

    .setColorActive(#0000FF)

      .setColorBackground(#0000AF)

        .setColorForeground(#0000FF);

  rect(x, y+(h*3), w, h);

  strokeWeight(4);

  MyController.addSlider("linethickness", 1, 35, 10, x, y+(h*5), w, h)

    .setColorActive(#9B9B9B)

      .setColorBackground(#C8C8C8)

        .setColorForeground(#9B9B9B);

  MyController.controller("LineThickness");

  fill(255);

  strokeWeight(2);

  rect(x, y+(h*5), w, h);

  rect(x, y+(h), w, h*3);

  strokeWeight(2);

  rect(x, y+(h*3), w, h);

  strokeWeight(2);

  fill(R, G, B);

  rect(x, y+(h*4), w, h);

  fill(185);

  strokeWeight(2);

  rect(x, y+(h*6), w, h);

  fill(0);

  strokeWeight(2);

  rect(x, y+(h*7), w, h);

  fill(255);

  strokeWeight(2);

  rect(x, y+(h*8), w, h);


  rectColour = color(50); 
  // ADDED CODE

  rectHighlight = color(209);

  baseColour = color(162);

  currentColour = baseColour;

  rectX = x;

  rectY = y+(h*9);


  rect1Colour = color(50);

  rect1Highlight = color(209);

  base1Colour = color(162);

  current1Colour = base1Colour;

  rect1X = x;

  rect1Y = y+(h*10);


  rect2Colour = color(50);

  rect2Highlight = color(209);

  base2Colour = color(162);

  current2Colour = base2Colour;

  rect2X = x;

  rect2Y = y+(h*11);


  rect3Colour = color(50);

  rect3Highlight = color(209);

  base3Colour = color(162);

  current3Colour = base3Colour;

  rect3X = x;

  rect3Y = y+(h*12);


  // ADDED CODE
}



void draw() 

{

  if (mousePressed)

  {


    if (brush)

    {

      if (thickness < linethickness) 

      {


        stroke(R, G, B);

        strokeWeight(thickness);


        line(mouseX, mouseY, pmouseX, pmouseY);


        thickness = (thickness) +(linethickness/16);
      }


      else 

      {


        stroke(R, G, B);

        strokeWeight(linethickness);

        line(mouseX, mouseY, pmouseX, pmouseY);
      }
    }

    else

    {

      stroke(R, G, B);

      strokeWeight(linethickness);

      line(mouseX, mouseY, pmouseX, pmouseY);
    }
  }

  if (button) 

  {

    background(255);

    button = !button;
  }

  update(mouseX, mouseY); 
  // ADDED CODE


  if (rectOver) {

    fill(rectHighlight);
  }


  else {

    fill(rectColour);
  }

  stroke(0);

  strokeWeight(2);

  rect(rectX, rectY, rectSizeW, rectSizeH);

  fill(130);

  text("Exit!", x+65, y+45+(h*9)); 



  if (rect1Over) {

    fill(rect1Highlight);
  }


  else {

    fill (rect1Colour);
  }

  stroke(0);

  strokeWeight(2);

  rect(rect1X, rect1Y, rect1SizeW, rect1SizeH);

  fill(130); 


  text("About", x+65, y+45+(h*10));


  if (rect2Over) {

    fill(rect2Highlight);
  }


  else {

    fill (rect2Colour);
  }

  stroke(0);

  strokeWeight(2);

  rect(rect2X, rect2Y, rect2SizeW, rect2SizeH);

  fill(130); 


  text("Save!", x+65, y+45+(h*11));


  if (rect3Over) {

    fill(rect3Highlight);
  }


  else {

    fill (rect3Colour);
  }

  stroke(0);

  strokeWeight(2);

  rect(rect3X, rect3Y, rect3SizeW, rect3SizeH);

  fill(130); 


  text("Help!", x+65, y+45+(h*12));



  // ADDED CODE


  stroke(0);

  strokeWeight(2);

  fill(255);

  rect(x, y, w, h);

  fill(0);

  text("Clear", x+65, y+45);

  strokeWeight(2);

  fill(R, G, B);

  rect(x, y+(h*4), w, h);

  fill(255);

  strokeWeight(2);

  rect(x, y+(h), w, h*3);

  fill(255);

  strokeWeight(2);

  rect(x, y+(h*5), w, h);

  fill(185);

  strokeWeight(2);

  rect(x, y+(h*6), w, h);

  fill(0);

  text("Toggle for Brush or Pencil", x+15, y+40+(h*6));


  fill(0);

  strokeWeight(2);

  rect(x, y+(h*7), w, h);

  fill(255);

  strokeWeight(2);

  rect(x, y+(h*8), w, h);
}



void mouseReleased()

{

  thickness =  thickness/thickness;
}




void mousePressed() 

{

  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) 

  {

    button = !button;
  }

  if (mouseX > x && mouseX < x+w && mouseY > y+(h*6) && mouseY < y+(h*7)) 

  {

    brush = !brush;
  }

  if (mouseX > x && mouseX < x+w && mouseY > y+(h*7) && mouseY < y+(h*8)) 
  {
    R = 0;
    G = 0;
    B = 0;
  }

  if (mouseX > x && mouseX < x+w && mouseY > y+(h*8) && mouseY < y+(h*9)) 
  {
    R = 255;
    G = 255;
    B = 255;
  }

  if (rectOver) { 
    // ADDED CODE

    javax.swing.JOptionPane.showMessageDialog(null, "Application will now exit"); 

    exit();
  } 


  if (rect1Over) {

    javax.swing.JOptionPane.showMessageDialog(null, "Muse Drawing Application was created by Cameron King, Matthew Osborne, Suheel Yasin and Montel Koranteng");
  }





  if (rect2Over) {

    javax.swing.JOptionPane.showMessageDialog(null, "The canvas has been saved.");
    save("CanvasSaved.jpg"); 
    // Suheel
  }

  if (rect3Over) {

    javax.swing.JOptionPane.showMessageDialog(null, "Use the sliders on the left hand side to select colour and thickness. Then use your finger to draw. If all of the RGB sliders are 255, then the brush will be white.");
  }


  // ADDED CODE
}


void update(int x, int y) { 
  // ADDED CODE

  if (overRect(rectX, rectY, rectSizeW, rectSizeH) ) {

    rectOver = true;

    rect1Over = false;

    rect2Over = false;

    rect3Over = false;
  }


  else if (over1Rect(rect1X, rect1Y, rect1SizeW, rect1SizeH) ) {

    rect1Over = true;

    rectOver = false;

    rect2Over = false;

    rect3Over = false;
  }


  else if (over2Rect(rect2X, rect2Y, rect2SizeW, rect2SizeH) ) {

    rect1Over = false;

    rect2Over = true;

    rectOver = false;

    rect3Over = false;
  }


  else if (over3Rect(rect3X, rect3Y, rect3SizeW, rect3SizeH) ) {

    rect1Over = false;

    rect2Over = false;

    rectOver = false;

    rect3Over = true;
  }


  else {

    rectOver = rect1Over = rect2Over = rect3Over = false;
  }
}


boolean overRect(int x, int y, int width, int height) { 


  if (mouseX >= x && mouseX <= x+width && 

    mouseY >= y && mouseY <= y+height) {

    return true;
  }


  else {

    return false;
  }
} 



boolean over1Rect(int x, int y, int width, int height) {

  if (mouseX >= x && mouseX <= x+width && 

    mouseY >= y && mouseY <= y+height) {

    return true;
  }


  else {

    return false;
  }
}


boolean over2Rect(int x, int y, int width, int height) {

  if (mouseX >= x && mouseX <= x+width && 

    mouseY >= y && mouseY <= y+height) {

    return true;
  }


  else {

    return false;
  }
} 



boolean over3Rect(int x, int y, int width, int height) {

  if (mouseX >= x && mouseX <= x+width && 

    mouseY >= y && mouseY <= y+height) {

    return true;
  }


  else {

    return false;
  }
}



