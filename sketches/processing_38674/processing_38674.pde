
// Homework 7
// 51-757 Computing for the Arts with Processing
// September 22, 2011
// Copyright Molly Nix September 2011 Pittsburgh, PA 15232
 
// IMPORTANT PIXEL POINTS
float wd, ht, x, y, edge, changeinX, changeinY;

// color & text setting
color bg = color(212, 212, 200);
color darkerbg = color(198, 199, 187);
color turquoise = color(129, 193, 184);
color coralred = color(222, 67, 61);
color offyellow = color(218, 187, 75);
color white = color(255, 255, 255);
color badgebg = color(51, 52, 53);
color darkerbadgebg = color(17, 17, 18);
color coralred_alpha = color(222, 67, 61, 70);
color offyellow_alpha = color(218, 187, 75, 70);
color turquoise_alpha = color(129, 193, 184, 70);
color redcircle = coralred_alpha;
color yellowcircle = offyellow_alpha;
color bluecircle = turquoise_alpha;
PFont font;


void setup( ) 
{
      size( 400,400);
      smooth();
      ellipseMode(CENTER);
      wd = 100;
      ht = 100;
      x = 200;
      y = 200;
      edge = width;
      changeinX = random(2, 6 );
      changeinY = random(2, 6 );
      noStroke();
      font = loadFont("Forza-Thin-13.vlw");
      textFont(font, 16); 
}

void draw() 
{
      prepscreen();
      changemousespeed();
      determinemovement();
      drawspeed();
}

void drawspeed() {
  fill(badgebg);
  String changeinXstring = "Horizontal speed: " + changeinX;
  String changeinYstring = "Vertical speed: " + changeinY;
  text(changeinXstring, 10, 20);
  text(changeinYstring, 10, 40);
}

void determinemovement( )
{
   if (keyPressed==true) {
     x = 200;
     y = 200;
     drawinitials(wd,ht,x,y);
   }
   else {
     moveinitials();
     drawinitials(wd,ht,x,y);
   }
}

void changemousespeed() {
  //percentage of 6 (arbitrary fastest speed) based on position on screen
  changeinX = ((mouseX*.25)/100)*6;
  changeinY = ((mouseY*.25)/100)*6;
}

void moveinitials( )
{
   x = x + changeinX; 
   y = y + changeinY;
   if ( x > width + wd )
   {
      x = -wd;
   }
   
   if ( x < -wd )
   {
      x = width + wd; 
   }
   
   if ( y > height + ht )
   {
      y = -ht; 
   }
   
   if ( y < -ht )
   {
      y = height + ht; 
   }
}


//INITIALS FUNCTION
void drawinitials(float initialswidth, float initialsheight, float initialsx, float initialsy) {
  
      // draw circle enclosure
      stroke(white);
      strokeWeight(.002*initialswidth);
      fill(redcircle);
      ellipse(initialsx, y-.26*initialsheight, initialswidth, initialsheight);
      fill(yellowcircle);
      ellipse(x+.25*initialswidth, y+.16*initialsheight, initialswidth, initialsheight);
      fill(bluecircle);
      ellipse(x-.25*initialswidth, y+.16*initialsheight, initialswidth, initialsheight);
       
      fill(white);
      stroke(badgebg);
      strokeWeight(.015*initialswidth);
      ellipse(initialsx, initialsy, initialswidth, initialsheight);
       
      fill(darkerbadgebg);
      noStroke();
      ellipse(initialsx, initialsy, initialswidth-.06*initialswidth, initialsheight-.06*initialsheight);
       
      fill(badgebg);
      stroke(white);
      strokeWeight(.003*initialswidth);
      ellipse(initialsx, initialsy, initialswidth-.08*initialswidth, initialsheight-.08*initialsheight);
       
      // DRAW M
      fill(white);
      beginShape();
      vertex(x-.25*initialswidth, y+.275*initialsheight);           // -100,110
      vertex(x-.25*initialswidth, y-.25*initialsheight);            // -100,-100
      curveVertex(x-.25*initialswidth, y-.25*initialsheight);       // -100,-100
      curveVertex(x-.25*initialswidth, y-.25*initialsheight);       // -100,-100
      curveVertex(x-.2625*initialswidth, y-.26*initialsheight);     // -105,-104
      curveVertex(x-.255*initialswidth, y-.2775*initialsheight);    // 102,111
      curveVertex(x-.24*initialswidth, y-.285*initialsheight);      // -96,-114
      curveVertex(x-.2225*initialswidth, y-.265*initialsheight);    // -89,-106
      curveVertex(x-.2225*initialswidth, y-.265*initialsheight);    // -89,-106
      curveVertex(x-.2025*initialswidth, y-.285*initialsheight);    // -81,-114
      curveVertex(x-.1725*initialswidth, y-.285*initialsheight);    // -69,-114
      curveVertex(x-.1575*initialswidth, y-.2625*initialsheight);   // -63,-106
      curveVertex(x-.1375*initialswidth, y-.285*initialsheight);    // -55,-114
      curveVertex(x-.1075*initialswidth, y-.285*initialsheight);    // -43,-114
      curveVertex(x-.09*initialswidth, y-.2625*initialsheight);     // -36,-105
      curveVertex(x-.09*initialswidth, y-.2625*initialsheight);     // -36,-105
      vertex(x-.09*initialswidth, y-.2625*initialsheight);          // -36,-105
      vertex(x-.09*initialswidth, y+.275*initialsheight);           // -36,110
      vertex(x-.115*initialswidth, y+.275*initialsheight);          // -46,110
      vertex(x-.115*initialswidth, y-.255*initialsheight);          // -46,-102
      curveVertex(x-.115*initialswidth, y-.255*initialsheight);     // -46,-102
      curveVertex(x-.115*initialswidth, y-.255*initialsheight);     // -46,-102
      curveVertex(x-.1225*initialswidth, y-.255*initialsheight);    // -49,-102
      curveVertex(x-.1325*initialswidth, y-.255*initialsheight);    // -53,-102
      curveVertex(x-.1575*initialswidth, y-.235*initialsheight);    // -63,-94
      curveVertex(x-.1575*initialswidth, y-.235*initialsheight);    // -63,-94
      vertex(x-.1575*initialswidth, y-.235*initialsheight);         // -63,-94
      vertex(x-.1575*initialswidth, y+.275*initialsheight);         // -63,110
      vertex(x-.18*initialswidth, y+.275*initialsheight);           // -72,110
      vertex(x-.18*initialswidth, y-.255*initialsheight);           // -72,-102
      curveVertex(x-.18*initialswidth, y-.255*initialsheight);      // -72,-102
      curveVertex(x-.18*initialswidth, y-.255*initialsheight);      // -72,-102
      curveVertex(x-.1875*initialswidth, y-.255*initialsheight);    // -75,-102
      curveVertex(x-.1975*initialswidth, y-.255*initialsheight);    // -79,-102
      curveVertex(x-.2225*initialswidth, y-.235*initialsheight);    // -89,-94
      curveVertex(x-.2225*initialswidth, y-.235*initialsheight);    // -89,-94
      vertex(x-.2225*initialswidth, y-.235*initialsheight);         // -89,-94
      vertex(x-.2225*initialswidth, y+.275*initialsheight);         // -89,110
      endShape();
       
       
      // DRAW C
      beginShape();
      curveVertex(x-.0125*initialswidth, y-.25*initialsheight);     // -5,-100
      curveVertex(x-.0125*initialswidth, y-.25*initialsheight);     // -5,-100
      vertex(x-.0125*initialswidth, y-.25*initialsheight);          // -5,-100
      vertex(x+.02*initialswidth, y-.235*initialsheight);           // 8,-94
      curveVertex(x+.02*initialswidth, y-.235*initialsheight);      // 8,-94
      curveVertex(x+.02*initialswidth, y-.235*initialsheight);      // 8,-94
      curveVertex(x+.045*initialswidth, y-.255*initialsheight);     // 18,-102
      curveVertex(x+.055*initialswidth, y-.255*initialsheight);     // 22,-102
      curveVertex(x+.0625*initialswidth, y-.255*initialsheight);    // 25,-102
      curveVertex(x+.0625*initialswidth, y-.255*initialsheight);    // 25,-102
      vertex(x+.0625*initialswidth, y-.255*initialsheight);         // 25,-102
      vertex(x+.0625*initialswidth, y-.1675*initialsheight);        // 25,-67
      vertex(x+.0625*initialswidth, y-.1675*initialsheight);        // 25,-67
      vertex(x+.0875*initialswidth, y-.1675*initialsheight);        // 35,-67
      vertex(x+.0875*initialswidth, y-.2625*initialsheight);        // 35,-105
      curveVertex(x+.0875*initialswidth, y-.2625*initialsheight);   // 35,-105
      curveVertex(x+.0875*initialswidth, y-.2625*initialsheight);   // 35,-105
      curveVertex(x+.07*initialswidth, y-.285*initialsheight);      // 28,-114
      curveVertex(x+.04*initialswidth, y-.285*initialsheight);      // 16,-114
      curveVertex(x+.0075*initialswidth, y-.27*initialsheight);     // 3,-108
      curveVertex(x-.0125*initialswidth, y-.25*initialsheight);     // -5,-100
      curveVertex(x-.0125*initialswidth, y-.25*initialsheight);     // -5,-100
      vertex(x-.0125*initialswidth, y-.25*initialsheight);          // -5,-100
      vertex(x+.02*initialswidth, y-.235*initialsheight);           // 8,-94
      vertex(x+.02*initialswidth, y+.24*initialsheight);            // 8,96
      curveVertex(x+.02*initialswidth, y+.24*initialsheight);       // 8,96
      curveVertex(x+.02*initialswidth, y+.24*initialsheight);       // 8,96
      curveVertex(x+.025*initialswidth, y+.2475*initialsheight);    // 10,99
      curveVertex(x+.0525*initialswidth, y+.2475*initialsheight);   // 21,99
      curveVertex(x+.06*initialswidth, y+.24*initialsheight);       // 24,96
      curveVertex(x+.06*initialswidth, y+.24*initialsheight);       // 24,96
      vertex(x+.06*initialswidth, y+.24*initialsheight);            // 24,96
      vertex(x+.06*initialswidth, y+.1025*initialsheight);          // 24,41
      vertex(x+.0875*initialswidth, y+.1025*initialsheight);        // 35,41
      vertex(x+.0875*initialswidth, y+.255*initialsheight);         // 35,102
      curveVertex(x+.0875*initialswidth, y+.255*initialsheight);    // 35,102
      curveVertex(x+.0875*initialswidth, y+.255*initialsheight);    // 35,102
      curveVertex(x+.07*initialswidth, y+.275*initialsheight);      // 28,110
      curveVertex(x+.015*initialswidth, y+.275*initialsheight);     // 6,110
      curveVertex(x-.0125*initialswidth, y+.25*initialsheight);     // -5,100
      curveVertex(x-.0125*initialswidth, y+.25*initialsheight);     // -5,100
      endShape();
       
       
       
      // DRAW N
      beginShape();
      vertex(x+.1675*initialswidth, y+.275*initialsheight);         // 67,110
      vertex(x+.1675*initialswidth, y-.25*initialsheight);          // 67,-100
      curveVertex(x+.1675*initialswidth, y-.25*initialsheight);     // 67,-100
      curveVertex(x+.1675*initialswidth, y-.25*initialsheight);     // 67,-100
      curveVertex(x+.155*initialswidth, y-.26*initialsheight);      // 62,-104
      curveVertex(x+.1625*initialswidth, y-.2775*initialsheight);   // 65,111
      curveVertex(x+.1775*initialswidth, y-.285*initialsheight);    // 71,-114
      curveVertex(x+.195*initialswidth, y-.265*initialsheight);     // 78,-106
      curveVertex(x+.195*initialswidth, y-.265*initialsheight);     // 78,-106
      vertex(x+.195*initialswidth, y-.265*initialsheight);          // 78,-106
      vertex(x+.195*initialswidth, y-.265*initialsheight);          // 78,-106
      curveVertex(x+.195*initialswidth, y-.265*initialsheight);     // 78,-106
      curveVertex(x+.195*initialswidth, y-.265*initialsheight);     // 78,-106
      curveVertex(x+.215*initialswidth, y-.285*initialsheight);     // 86,-114
      curveVertex(x+.245*initialswidth, y-.285*initialsheight);     // 98,-114
      curveVertex(x+.2625*initialswidth, y-.2625*initialsheight);   // 105,-105
      curveVertex(x+.2625*initialswidth, y-.2625*initialsheight);   // 105,-105
      vertex(x+.2625*initialswidth, y-.2625*initialsheight);        // 105,-105
      vertex(x+.2625*initialswidth, y+.275*initialsheight);         // 105,110
      vertex(x+.2375*initialswidth, y+.275*initialsheight);         // 95,110
      vertex(x+.2375*initialswidth, y-.255*initialsheight);         // 95,-102
      curveVertex(x+.2375*initialswidth, y-.255*initialsheight);    // 95,-102
      curveVertex(x+.2375*initialswidth, y-.255*initialsheight);    // 95,-102
      curveVertex(x+.23*initialswidth, y-.255*initialsheight);      // 92,-102
      curveVertex(x+.22*initialswidth, y-.255*initialsheight);      // 88,-102
      curveVertex(x+.195*initialswidth, y-.235*initialsheight);     // 78,-94
      curveVertex(x+.195*initialswidth, y-.235*initialsheight);     // 78,-94
      vertex(x+.195*initialswidth, y-.235*initialsheight);          // 78,-94
      vertex(x+.195*initialswidth, y-.235*initialsheight);          // 78,-94
      vertex(x+.195*initialswidth, y+.275*initialsheight);          // 78,110
      endShape();
}

void prepscreen () 
{
  fill(bg,40);
  rect( -5, -5, width+10, height+10 );
}

