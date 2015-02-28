
// Homework 6
// 51-757 Computing for the Arts with Processing
// September 20, 2011
// Copyright Molly Nix September 2011 Pittsburgh, PA 15232
 
// IMPORTANT PIXEL POINTS
float wd;
float ht;
float x;
float y;
       
// other important pixel points
float shadowx;
float shadowy;
float darkershadowx;
float darkershadowy;
float currentx;
float originalwd;
float originalht;

// color setting
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


void setup( ) {
      size( 400,480);
      smooth();  
}



void draw() {
      background(bg);
      noStroke();
      wd = 400/9;
      ht = 400/9;
      x = wd;
      y = ht;
      originalwd = wd;
      originalht = ht;
      currentx = x;
      shadowx = x+.01*wd;
      shadowy = y+.01*ht;
      darkershadowx = shadowx+.01*wd;
      darkershadowy = shadowy+.01*ht;
      while (wd>.1) {
          initials(wd,ht,x,y,shadowx,shadowy,darkershadowx,darkershadowy);
          if (currentx > 400){
            x = originalwd;
            y = y+(ht*2.6);
            currentx = x;
          }
          else {
            x = x+originalwd+(originalwd*.75);
            y = y;
            currentx = x;
          }
          shadowx = x+.01*wd;
          shadowy = y+.01*ht;
          darkershadowx = shadowx+.01*wd;
          darkershadowy = shadowy+.01*ht;
          wd = wd-(wd*.04);
          ht = ht-(ht*.04);
      }
      noLoop();
}

//INITIALS FUNCTION
void initials(float initialswidth, float initialsheight, float initialsx, float initialsy, float initialsshadowx, float initialsshadowy, float darkerinitialsshadowx, float darkerinitialsshadowy) {
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
       
       
      // DRAW DARKER SHADOWS
      // start m shadow
      fill(darkerbadgebg);
      noStroke();
      beginShape();
      vertex(darkerinitialsshadowx-.25*initialswidth, darkershadowy+.275*initialsheight);           // -100,110
      vertex(darkerinitialsshadowx-.25*initialswidth, darkershadowy-.25*initialsheight);            // -100,-100
      curveVertex(darkerinitialsshadowx-.25*initialswidth, darkershadowy-.25*initialsheight);       // -100,-100
      curveVertex(darkerinitialsshadowx-.25*initialswidth, darkershadowy-.25*initialsheight);       // -100,-100
      curveVertex(darkerinitialsshadowx-.2625*initialswidth, darkershadowy-.26*initialsheight);     // -105,-104
      curveVertex(darkerinitialsshadowx-.255*initialswidth, darkershadowy-.2775*initialsheight);    // 102,111
      curveVertex(darkerinitialsshadowx-.24*initialswidth, darkershadowy-.285*initialsheight);      // -96,-114
      curveVertex(darkerinitialsshadowx-.2225*initialswidth, darkershadowy-.265*initialsheight);    // -89,-106
      curveVertex(darkerinitialsshadowx-.2225*initialswidth, darkershadowy-.265*initialsheight);    // -89,-106
      curveVertex(darkerinitialsshadowx-.2025*initialswidth, darkershadowy-.285*initialsheight);    // -81,-114
      curveVertex(darkerinitialsshadowx-.1725*initialswidth, darkershadowy-.285*initialsheight);    // -69,-114
      curveVertex(darkerinitialsshadowx-.1575*initialswidth, darkershadowy-.2625*initialsheight);   // -63,-106
      curveVertex(darkerinitialsshadowx-.1375*initialswidth, darkershadowy-.285*initialsheight);    // -55,-114
      curveVertex(darkerinitialsshadowx-.1075*initialswidth, darkershadowy-.285*initialsheight);    // -43,-114
      curveVertex(darkerinitialsshadowx-.09*initialswidth, darkershadowy-.2625*initialsheight);     // -36,-105
      curveVertex(darkerinitialsshadowx-.09*initialswidth, darkershadowy-.2625*initialsheight);     // -36,-105
      vertex(darkerinitialsshadowx-.09*initialswidth, darkershadowy-.2625*initialsheight);          // -36,-105
      vertex(darkerinitialsshadowx-.09*initialswidth, darkershadowy+.275*initialsheight);           // -36,110
      vertex(darkerinitialsshadowx-.115*initialswidth, darkershadowy+.275*initialsheight);          // -46,110
      vertex(darkerinitialsshadowx-.115*initialswidth, darkershadowy-.255*initialsheight);          // -46,-102
      curveVertex(darkerinitialsshadowx-.115*initialswidth, darkershadowy-.255*initialsheight);     // -46,-102
      curveVertex(darkerinitialsshadowx-.115*initialswidth, darkershadowy-.255*initialsheight);     // -46,-102
      curveVertex(darkerinitialsshadowx-.1225*initialswidth, darkershadowy-.255*initialsheight);    // -49,-102
      curveVertex(darkerinitialsshadowx-.1325*initialswidth, darkershadowy-.255*initialsheight);    // -53,-102
      curveVertex(darkerinitialsshadowx-.1575*initialswidth, darkershadowy-.235*initialsheight);    // -63,-94
      curveVertex(darkerinitialsshadowx-.1575*initialswidth, darkershadowy-.235*initialsheight);    // -63,-94
      vertex(darkerinitialsshadowx-.1575*initialswidth, darkershadowy-.235*initialsheight);         // -63,-94
      vertex(darkerinitialsshadowx-.1575*initialswidth, darkershadowy+.275*initialsheight);         // -63,110
      vertex(darkerinitialsshadowx-.18*initialswidth, darkershadowy+.275*initialsheight);           // -72,110
      vertex(darkerinitialsshadowx-.18*initialswidth, darkershadowy-.255*initialsheight);           // -72,-102
      curveVertex(darkerinitialsshadowx-.18*initialswidth, darkershadowy-.255*initialsheight);      // -72,-102
      curveVertex(darkerinitialsshadowx-.18*initialswidth, darkershadowy-.255*initialsheight);      // -72,-102
      curveVertex(darkerinitialsshadowx-.1875*initialswidth, darkershadowy-.255*initialsheight);    // -75,-102
      curveVertex(darkerinitialsshadowx-.1975*initialswidth, darkershadowy-.255*initialsheight);    // -79,-102
      curveVertex(darkerinitialsshadowx-.2225*initialswidth, darkershadowy-.235*initialsheight);    // -89,-94
      curveVertex(darkerinitialsshadowx-.2225*initialswidth, darkershadowy-.235*initialsheight);    // -89,-94
      vertex(darkerinitialsshadowx-.2225*initialswidth, darkershadowy-.235*initialsheight);         // -89,-94
      vertex(darkerinitialsshadowx-.2225*initialswidth, darkershadowy+.275*initialsheight);         // -89,110
      endShape();
      // start c shadow
      beginShape();
      curveVertex(darkerinitialsshadowx-.0125*initialswidth, darkershadowy-.25*initialsheight);     // -5,-100
      curveVertex(darkerinitialsshadowx-.0125*initialswidth, darkershadowy-.25*initialsheight);     // -5,-100
      vertex(darkerinitialsshadowx-.0125*initialswidth, darkershadowy-.25*initialsheight);          // -5,-100
      vertex(darkerinitialsshadowx+.02*initialswidth, darkershadowy-.235*initialsheight);           // 8,-94
      curveVertex(darkerinitialsshadowx+.02*initialswidth, darkershadowy-.235*initialsheight);      // 8,-94
      curveVertex(darkerinitialsshadowx+.02*initialswidth, darkershadowy-.235*initialsheight);      // 8,-94
      curveVertex(darkerinitialsshadowx+.045*initialswidth, darkershadowy-.255*initialsheight);     // 18,-102
      curveVertex(darkerinitialsshadowx+.055*initialswidth, darkershadowy-.255*initialsheight);     // 22,-102
      curveVertex(darkerinitialsshadowx+.0625*initialswidth, darkershadowy-.255*initialsheight);    // 25,-102
      curveVertex(darkerinitialsshadowx+.0625*initialswidth, darkershadowy-.255*initialsheight);    // 25,-102
      vertex(darkerinitialsshadowx+.0625*initialswidth, darkershadowy-.255*initialsheight);         // 25,-102
      vertex(darkerinitialsshadowx+.0625*initialswidth, darkershadowy-.1675*initialsheight);        // 25,-67
      vertex(darkerinitialsshadowx+.0875*initialswidth, darkershadowy-.1675*initialsheight);        // 35,-67
      vertex(darkerinitialsshadowx+.0875*initialswidth, darkershadowy-.2625*initialsheight);        // 35,-105
      curveVertex(darkerinitialsshadowx+.0875*initialswidth, darkershadowy-.2625*initialsheight);   // 35,-105
      curveVertex(darkerinitialsshadowx+.0875*initialswidth, darkershadowy-.2625*initialsheight);   // 35,-105
      curveVertex(darkerinitialsshadowx+.07*initialswidth, darkershadowy-.285*initialsheight);      // 28,-114
      curveVertex(darkerinitialsshadowx+.04*initialswidth, darkershadowy-.285*initialsheight);      // 16,-114
      curveVertex(darkerinitialsshadowx+.0075*initialswidth, darkershadowy-.27*initialsheight);     // 3,-108
      curveVertex(darkerinitialsshadowx-.0125*initialswidth, darkershadowy-.25*initialsheight);     // -5,-100
      curveVertex(darkerinitialsshadowx-.0125*initialswidth, darkershadowy-.25*initialsheight);     // -5,-100
      vertex(darkerinitialsshadowx-.0125*initialswidth, darkershadowy-.25*initialsheight);          // -5,-100
      vertex(darkerinitialsshadowx+.02*initialswidth, darkershadowy-.235*initialsheight);           // 8,-94
      vertex(darkerinitialsshadowx+.02*initialswidth, darkershadowy+.24*initialsheight);            // 8,96
      curveVertex(darkerinitialsshadowx+.02*initialswidth, darkershadowy+.24*initialsheight);       // 8,96
      curveVertex(darkerinitialsshadowx+.02*initialswidth, darkershadowy+.24*initialsheight);       // 8,96
      curveVertex(darkerinitialsshadowx+.025*initialswidth, darkershadowy+.2475*initialsheight);    // 10,99
      curveVertex(darkerinitialsshadowx+.0525*initialswidth, darkershadowy+.2475*initialsheight);   // 21,99
      curveVertex(darkerinitialsshadowx+.06*initialswidth, darkershadowy+.24*initialsheight);       // 24,96
      curveVertex(darkerinitialsshadowx+.06*initialswidth, darkershadowy+.24*initialsheight);       // 24,96
      vertex(darkerinitialsshadowx+.06*initialswidth, darkershadowy+.24*initialsheight);            // 24,96
      vertex(darkerinitialsshadowx+.06*initialswidth, darkershadowy+.1025*initialsheight);          // 24,41
      vertex(darkerinitialsshadowx+.0875*initialswidth, darkershadowy+.1025*initialsheight);        // 35,41
      vertex(darkerinitialsshadowx+.0875*initialswidth, darkershadowy+.255*initialsheight);         // 35,102
      curveVertex(darkerinitialsshadowx+.0875*initialswidth, darkershadowy+.255*initialsheight);    // 35,102
      curveVertex(darkerinitialsshadowx+.0875*initialswidth, darkershadowy+.255*initialsheight);    // 35,102
      curveVertex(darkerinitialsshadowx+.07*initialswidth, darkershadowy+.275*initialsheight);      // 28,110
      curveVertex(darkerinitialsshadowx+.015*initialswidth, darkershadowy+.275*initialsheight);     // 6,110
      curveVertex(darkerinitialsshadowx-.0125*initialswidth, darkershadowy+.25*initialsheight);     // -5,100
      curveVertex(darkerinitialsshadowx-.0125*initialswidth, darkershadowy+.25*initialsheight);     // -5,100
      endShape();
      // start n shadow
      beginShape();
      vertex(darkerinitialsshadowx+.1675*initialswidth, darkershadowy+.275*initialsheight);         // 67,110
      vertex(darkerinitialsshadowx+.1675*initialswidth, darkershadowy-.25*initialsheight);          // 67,-100
      curveVertex(darkerinitialsshadowx+.1675*initialswidth, darkershadowy-.25*initialsheight);     // 67,-100
      curveVertex(darkerinitialsshadowx+.1675*initialswidth, darkershadowy-.25*initialsheight);     // 67,-100
      curveVertex(darkerinitialsshadowx+.155*initialswidth, darkershadowy-.26*initialsheight);      // 62,-104
      curveVertex(darkerinitialsshadowx+.1625*initialswidth, darkershadowy-.2775*initialsheight);   // 65,111
      curveVertex(darkerinitialsshadowx+.1775*initialswidth, darkershadowy-.285*initialsheight);    // 71,-114
      curveVertex(darkerinitialsshadowx+.195*initialswidth, darkershadowy-.265*initialsheight);     // 78,-106
      curveVertex(darkerinitialsshadowx+.195*initialswidth, darkershadowy-.265*initialsheight);     // 78,-106
      vertex(darkerinitialsshadowx+.195*initialswidth, darkershadowy-.265*initialsheight);          // 78,-106
      vertex(darkerinitialsshadowx+.195*initialswidth, darkershadowy-.265*initialsheight);          // 78,-106
      curveVertex(darkerinitialsshadowx+.195*initialswidth, darkershadowy-.265*initialsheight);     // 78,-106
      curveVertex(darkerinitialsshadowx+.195*initialswidth, darkershadowy-.265*initialsheight);     // 78,-106
      curveVertex(darkerinitialsshadowx+.215*initialswidth, darkershadowy-.285*initialsheight);     // 86,-114
      curveVertex(darkerinitialsshadowx+.245*initialswidth, darkershadowy-.285*initialsheight);     // 98,-114
      curveVertex(darkerinitialsshadowx+.2625*initialswidth, darkershadowy-.2625*initialsheight);   // 105,-105
      curveVertex(darkerinitialsshadowx+.2625*initialswidth, darkershadowy-.2625*initialsheight);   // 105,-105
      vertex(darkerinitialsshadowx+.2625*initialswidth, darkershadowy-.2625*initialsheight);        // 105,-105
      vertex(darkerinitialsshadowx+.2625*initialswidth, darkershadowy+.275*initialsheight);         // 105,110
      vertex(darkerinitialsshadowx+.2375*initialswidth, darkershadowy+.275*initialsheight);         // 95,110
      vertex(darkerinitialsshadowx+.2375*initialswidth, darkershadowy-.255*initialsheight);         // 95,-102
      curveVertex(darkerinitialsshadowx+.2375*initialswidth, darkershadowy-.255*initialsheight);    // 95,-102
      curveVertex(darkerinitialsshadowx+.23*initialswidth, darkershadowy-.255*initialsheight);      // 92,-102
      curveVertex(darkerinitialsshadowx+.22*initialswidth, darkershadowy-.255*initialsheight);      // 88,-102
      curveVertex(darkerinitialsshadowx+.195*initialswidth, darkershadowy-.235*initialsheight);     // 78,-94
      curveVertex(darkerinitialsshadowx+.195*initialswidth, darkershadowy-.235*initialsheight);     // 78,-94
      vertex(darkerinitialsshadowx+.195*initialswidth, darkershadowy-.235*initialsheight);          // 78,-94
      vertex(darkerinitialsshadowx+.195*initialswidth, darkershadowy-.235*initialsheight);          // 78,-94
      vertex(darkerinitialsshadowx+.195*initialswidth, darkershadowy+.275*initialsheight);          // 78,110
      endShape();
       
       
      // DRAW SHADOWS
      // start m shadow
      fill(coralred);
      noStroke();
      beginShape();
      vertex(initialsshadowx-.25*initialswidth, shadowy+.275*initialsheight);           // -100,110
      vertex(initialsshadowx-.25*initialswidth, shadowy-.25*initialsheight);            // -100,-100
      curveVertex(initialsshadowx-.25*initialswidth, shadowy-.25*initialsheight);       // -100,-100
      curveVertex(initialsshadowx-.25*initialswidth, shadowy-.25*initialsheight);       // -100,-100
      curveVertex(initialsshadowx-.2625*initialswidth, shadowy-.26*initialsheight);     // -105,-104
      curveVertex(initialsshadowx-.255*initialswidth, shadowy-.2775*initialsheight);    // 102,111
      curveVertex(initialsshadowx-.24*initialswidth, shadowy-.285*initialsheight);      // -96,-114
      curveVertex(initialsshadowx-.2225*initialswidth, shadowy-.265*initialsheight);    // -89,-106
      curveVertex(initialsshadowx-.2225*initialswidth, shadowy-.265*initialsheight);    // -89,-106
      curveVertex(initialsshadowx-.2025*initialswidth, shadowy-.285*initialsheight);    // -81,-114
      curveVertex(initialsshadowx-.1725*initialswidth, shadowy-.285*initialsheight);    // -69,-114
      curveVertex(initialsshadowx-.1575*initialswidth, shadowy-.2625*initialsheight);   // -63,-106
      curveVertex(initialsshadowx-.1375*initialswidth, shadowy-.285*initialsheight);    // -55,-114
      curveVertex(initialsshadowx-.1075*initialswidth, shadowy-.285*initialsheight);    // -43,-114
      curveVertex(initialsshadowx-.09*initialswidth, shadowy-.2625*initialsheight);     // -36,-105
      curveVertex(initialsshadowx-.09*initialswidth, shadowy-.2625*initialsheight);     // -36,-105
      vertex(initialsshadowx-.09*initialswidth, shadowy-.2625*initialsheight);          // -36,-105
      vertex(initialsshadowx-.09*initialswidth, shadowy+.275*initialsheight);           // -36,110
      vertex(initialsshadowx-.115*initialswidth, shadowy+.275*initialsheight);          // -46,110
      vertex(initialsshadowx-.115*initialswidth, shadowy-.255*initialsheight);          // -46,-102
      curveVertex(initialsshadowx-.115*initialswidth, shadowy-.255*initialsheight);     // -46,-102
      curveVertex(initialsshadowx-.115*initialswidth, shadowy-.255*initialsheight);     // -46,-102
      curveVertex(initialsshadowx-.1225*initialswidth, shadowy-.255*initialsheight);    // -49,-102
      curveVertex(initialsshadowx-.1325*initialswidth, shadowy-.255*initialsheight);    // -53,-102
      curveVertex(initialsshadowx-.1575*initialswidth, shadowy-.235*initialsheight);    // -63,-94
      curveVertex(initialsshadowx-.1575*initialswidth, shadowy-.235*initialsheight);    // -63,-94
      vertex(initialsshadowx-.1575*initialswidth, shadowy-.235*initialsheight);         // -63,-94
      vertex(initialsshadowx-.1575*initialswidth, shadowy+.275*initialsheight);         // -63,110
      vertex(initialsshadowx-.18*initialswidth, shadowy+.275*initialsheight);           // -72,110
      vertex(initialsshadowx-.18*initialswidth, shadowy-.255*initialsheight);           // -72,-102
      curveVertex(initialsshadowx-.18*initialswidth, shadowy-.255*initialsheight);      // -72,-102
      curveVertex(initialsshadowx-.18*initialswidth, shadowy-.255*initialsheight);      // -72,-102
      curveVertex(initialsshadowx-.1875*initialswidth, shadowy-.255*initialsheight);    // -75,-102
      curveVertex(initialsshadowx-.1975*initialswidth, shadowy-.255*initialsheight);    // -79,-102
      curveVertex(initialsshadowx-.2225*initialswidth, shadowy-.235*initialsheight);    // -89,-94
      curveVertex(initialsshadowx-.2225*initialswidth, shadowy-.235*initialsheight);    // -89,-94
      vertex(initialsshadowx-.2225*initialswidth, shadowy-.235*initialsheight);         // -89,-94
      vertex(initialsshadowx-.2225*initialswidth, shadowy+.275*initialsheight);         // -89,110
      endShape();
      // start c shadow
      fill(offyellow);
      beginShape();
      curveVertex(initialsshadowx-.0125*initialswidth, shadowy-.25*initialsheight);     // -5,-100
      curveVertex(initialsshadowx-.0125*initialswidth, shadowy-.25*initialsheight);     // -5,-100
      vertex(initialsshadowx-.0125*initialswidth, shadowy-.25*initialsheight);          // -5,-100
      vertex(initialsshadowx+.02*initialswidth, shadowy-.235*initialsheight);           // 8,-94
      curveVertex(initialsshadowx+.02*initialswidth, shadowy-.235*initialsheight);      // 8,-94
      curveVertex(initialsshadowx+.02*initialswidth, shadowy-.235*initialsheight);      // 8,-94
      curveVertex(initialsshadowx+.045*initialswidth, shadowy-.255*initialsheight);     // 18,-102
      curveVertex(initialsshadowx+.055*initialswidth, shadowy-.255*initialsheight);     // 22,-102
      curveVertex(initialsshadowx+.0625*initialswidth, shadowy-.255*initialsheight);    // 25,-102
      curveVertex(initialsshadowx+.0625*initialswidth, shadowy-.255*initialsheight);    // 25,-102
      vertex(initialsshadowx+.0625*initialswidth, shadowy-.255*initialsheight);         // 25,-102
      vertex(initialsshadowx+.0625*initialswidth, shadowy-.1675*initialsheight);        // 25,-67
      vertex(initialsshadowx+.0875*initialswidth, shadowy-.1675*initialsheight);        // 35,-67
      vertex(initialsshadowx+.0875*initialswidth, shadowy-.2625*initialsheight);        // 35,-105
      curveVertex(initialsshadowx+.0875*initialswidth, shadowy-.2625*initialsheight);   // 35,-105
      curveVertex(initialsshadowx+.0875*initialswidth, shadowy-.2625*initialsheight);   // 35,-105
      curveVertex(initialsshadowx+.07*initialswidth, shadowy-.285*initialsheight);      // 28,-114
      curveVertex(initialsshadowx+.04*initialswidth, shadowy-.285*initialsheight);      // 16,-114
      curveVertex(initialsshadowx+.0075*initialswidth, shadowy-.27*initialsheight);     // 3,-108
      curveVertex(initialsshadowx-.0125*initialswidth, shadowy-.25*initialsheight);     // -5,-100
      curveVertex(initialsshadowx-.0125*initialswidth, shadowy-.25*initialsheight);     // -5,-100
      vertex(initialsshadowx-.0125*initialswidth, shadowy-.25*initialsheight);          // -5,-100
      vertex(initialsshadowx+.02*initialswidth, shadowy-.235*initialsheight);           // 8,-94
      vertex(initialsshadowx+.02*initialswidth, shadowy+.24*initialsheight);            // 8,96
      curveVertex(initialsshadowx+.02*initialswidth, shadowy+.24*initialsheight);       // 8,96
      curveVertex(initialsshadowx+.02*initialswidth, shadowy+.24*initialsheight);       // 8,96
      curveVertex(initialsshadowx+.025*initialswidth, shadowy+.2475*initialsheight);    // 10,99
      curveVertex(initialsshadowx+.0525*initialswidth, shadowy+.2475*initialsheight);   // 21,99
      curveVertex(initialsshadowx+.06*initialswidth, shadowy+.24*initialsheight);       // 24,96
      curveVertex(initialsshadowx+.06*initialswidth, shadowy+.24*initialsheight);       // 24,96
      vertex(initialsshadowx+.06*initialswidth, shadowy+.24*initialsheight);            // 24,96
      vertex(initialsshadowx+.06*initialswidth, shadowy+.1025*initialsheight);          // 24,41
      vertex(initialsshadowx+.0875*initialswidth, shadowy+.1025*initialsheight);        // 35,41
      vertex(initialsshadowx+.0875*initialswidth, shadowy+.255*initialsheight);         // 35,102
      curveVertex(initialsshadowx+.0875*initialswidth, shadowy+.255*initialsheight);    // 35,102
      curveVertex(initialsshadowx+.0875*initialswidth, shadowy+.255*initialsheight);    // 35,102
      curveVertex(initialsshadowx+.07*initialswidth, shadowy+.275*initialsheight);      // 28,110
      curveVertex(initialsshadowx+.015*initialswidth, shadowy+.275*initialsheight);     // 6,110
      curveVertex(initialsshadowx-.0125*initialswidth, shadowy+.25*initialsheight);     // -5,100
      curveVertex(initialsshadowx-.0125*initialswidth, shadowy+.25*initialsheight);     // -5,100
      endShape();
      // start n shadow
      fill(turquoise);
      beginShape();
      vertex(initialsshadowx+.1675*initialswidth, shadowy+.275*initialsheight);         // 67,110
      vertex(initialsshadowx+.1675*initialswidth, shadowy-.25*initialsheight);          // 67,-100
      curveVertex(initialsshadowx+.1675*initialswidth, shadowy-.25*initialsheight);     // 67,-100
      curveVertex(initialsshadowx+.1675*initialswidth, shadowy-.25*initialsheight);     // 67,-100
      curveVertex(initialsshadowx+.155*initialswidth, shadowy-.26*initialsheight);      // 62,-104
      curveVertex(initialsshadowx+.1625*initialswidth, shadowy-.2775*initialsheight);   // 65,111
      curveVertex(initialsshadowx+.1775*initialswidth, shadowy-.285*initialsheight);    // 71,-114
      curveVertex(initialsshadowx+.195*initialswidth, shadowy-.265*initialsheight);     // 78,-106
      curveVertex(initialsshadowx+.195*initialswidth, shadowy-.265*initialsheight);     // 78,-106
      vertex(initialsshadowx+.195*initialswidth, shadowy-.265*initialsheight);          // 78,-106
      vertex(initialsshadowx+.195*initialswidth, shadowy-.265*initialsheight);          // 78,-106
      curveVertex(initialsshadowx+.195*initialswidth, shadowy-.265*initialsheight);     // 78,-106
      curveVertex(initialsshadowx+.195*initialswidth, shadowy-.265*initialsheight);     // 78,-106
      curveVertex(initialsshadowx+.215*initialswidth, shadowy-.285*initialsheight);     // 86,-114
      curveVertex(initialsshadowx+.245*initialswidth, shadowy-.285*initialsheight);     // 98,-114
      curveVertex(initialsshadowx+.2625*initialswidth, shadowy-.2625*initialsheight);   // 105,-105
      curveVertex(initialsshadowx+.2625*initialswidth, shadowy-.2625*initialsheight);   // 105,-105
      vertex(initialsshadowx+.2625*initialswidth, shadowy-.2625*initialsheight);        // 105,-105
      vertex(initialsshadowx+.2625*initialswidth, shadowy+.275*initialsheight);         // 105,110
      vertex(initialsshadowx+.2375*initialswidth, shadowy+.275*initialsheight);         // 95,110
      vertex(initialsshadowx+.2375*initialswidth, shadowy-.255*initialsheight);         // 95,-102
      curveVertex(initialsshadowx+.2375*initialswidth, shadowy-.255*initialsheight);    // 95,-102
      curveVertex(initialsshadowx+.23*initialswidth, shadowy-.255*initialsheight);      // 92,-102
      curveVertex(initialsshadowx+.22*initialswidth, shadowy-.255*initialsheight);      // 88,-102
      curveVertex(initialsshadowx+.195*initialswidth, shadowy-.235*initialsheight);     // 78,-94
      curveVertex(initialsshadowx+.195*initialswidth, shadowy-.235*initialsheight);     // 78,-94
      vertex(initialsshadowx+.195*initialswidth, shadowy-.235*initialsheight);          // 78,-94
      vertex(initialsshadowx+.195*initialswidth, shadowy-.235*initialsheight);          // 78,-94
      vertex(initialsshadowx+.195*initialswidth, shadowy+.275*initialsheight);          // 78,110
      endShape();
       
       
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

