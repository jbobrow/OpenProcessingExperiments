
// Homework 2
// 51-757 Computing for the Arts with Processing
// September 6, 2011
// Copyright Molly Nix September 2011 Pittsburgh, PA 15232

size( 400,400);

// IMPORTANT PIXEL POINTS
float wd = 240;
float ht = 240;
float x = 200;
float y = 200;


//////////////////////////////////////////////////////

// other important pixel points
float shadowx = x+.01*wd;
float shadowy = y+.01*ht;
float darkershadowx = shadowx+.01*wd;
float darkershadowy = shadowy+.01*ht;


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


// smoothing and background setting
smooth();
background(bg);
noStroke();


// draw circle enclosure
stroke(white);
strokeWeight(.002*wd);
fill(coralred_alpha);
ellipse(x, y-.26*ht, wd, ht);
fill(offyellow_alpha);
ellipse(x+.25*wd, y+.16*ht, wd, ht);
fill(turquoise_alpha);
ellipse(x-.25*wd, y+.16*ht, wd, ht);

fill(white);
stroke(badgebg);
strokeWeight(.015*wd);
ellipse(x, y, wd, ht);

fill(darkerbadgebg);
noStroke();
ellipse(x, y, wd-.06*wd, ht-.06*ht);

fill(badgebg);
stroke(white);
strokeWeight(.003*wd);
ellipse(x, y, wd-.08*wd, ht-.08*ht);


// DRAW DARKER SHADOWS
// start m shadow
fill(darkerbadgebg);
noStroke();
beginShape();
vertex(darkershadowx-.25*wd, darkershadowy+.275*ht);           // -100,110
vertex(darkershadowx-.25*wd, darkershadowy-.25*ht);            // -100,-100
curveVertex(darkershadowx-.25*wd, darkershadowy-.25*ht);       // -100,-100
curveVertex(darkershadowx-.25*wd, darkershadowy-.25*ht);       // -100,-100
curveVertex(darkershadowx-.2625*wd, darkershadowy-.26*ht);     // -105,-104
curveVertex(darkershadowx-.255*wd, darkershadowy-.2775*ht);    // 102,111
curveVertex(darkershadowx-.24*wd, darkershadowy-.285*ht);      // -96,-114
curveVertex(darkershadowx-.2225*wd, darkershadowy-.265*ht);    // -89,-106
curveVertex(darkershadowx-.2225*wd, darkershadowy-.265*ht);    // -89,-106
curveVertex(darkershadowx-.2025*wd, darkershadowy-.285*ht);    // -81,-114
curveVertex(darkershadowx-.1725*wd, darkershadowy-.285*ht);    // -69,-114
curveVertex(darkershadowx-.1575*wd, darkershadowy-.2625*ht);   // -63,-106
curveVertex(darkershadowx-.1375*wd, darkershadowy-.285*ht);    // -55,-114
curveVertex(darkershadowx-.1075*wd, darkershadowy-.285*ht);    // -43,-114
curveVertex(darkershadowx-.09*wd, darkershadowy-.2625*ht);     // -36,-105
curveVertex(darkershadowx-.09*wd, darkershadowy-.2625*ht);     // -36,-105
vertex(darkershadowx-.09*wd, darkershadowy-.2625*ht);          // -36,-105
vertex(darkershadowx-.09*wd, darkershadowy+.275*ht);           // -36,110
vertex(darkershadowx-.115*wd, darkershadowy+.275*ht);          // -46,110
vertex(darkershadowx-.115*wd, darkershadowy-.255*ht);          // -46,-102
curveVertex(darkershadowx-.115*wd, darkershadowy-.255*ht);     // -46,-102
curveVertex(darkershadowx-.115*wd, darkershadowy-.255*ht);     // -46,-102
curveVertex(darkershadowx-.1225*wd, darkershadowy-.255*ht);    // -49,-102
curveVertex(darkershadowx-.1325*wd, darkershadowy-.255*ht);    // -53,-102
curveVertex(darkershadowx-.1575*wd, darkershadowy-.235*ht);    // -63,-94
curveVertex(darkershadowx-.1575*wd, darkershadowy-.235*ht);    // -63,-94
vertex(darkershadowx-.1575*wd, darkershadowy-.235*ht);         // -63,-94
vertex(darkershadowx-.1575*wd, darkershadowy+.275*ht);         // -63,110
vertex(darkershadowx-.18*wd, darkershadowy+.275*ht);           // -72,110
vertex(darkershadowx-.18*wd, darkershadowy-.255*ht);           // -72,-102
curveVertex(darkershadowx-.18*wd, darkershadowy-.255*ht);      // -72,-102
curveVertex(darkershadowx-.18*wd, darkershadowy-.255*ht);      // -72,-102
curveVertex(darkershadowx-.1875*wd, darkershadowy-.255*ht);    // -75,-102
curveVertex(darkershadowx-.1975*wd, darkershadowy-.255*ht);    // -79,-102
curveVertex(darkershadowx-.2225*wd, darkershadowy-.235*ht);    // -89,-94
curveVertex(darkershadowx-.2225*wd, darkershadowy-.235*ht);    // -89,-94
vertex(darkershadowx-.2225*wd, darkershadowy-.235*ht);         // -89,-94
vertex(darkershadowx-.2225*wd, darkershadowy+.275*ht);         // -89,110
endShape();
// start c shadow
beginShape();
curveVertex(darkershadowx-.0125*wd, darkershadowy-.25*ht);     // -5,-100
curveVertex(darkershadowx-.0125*wd, darkershadowy-.25*ht);     // -5,-100
vertex(darkershadowx-.0125*wd, darkershadowy-.25*ht);          // -5,-100
vertex(darkershadowx+.02*wd, darkershadowy-.235*ht);           // 8,-94
curveVertex(darkershadowx+.02*wd, darkershadowy-.235*ht);      // 8,-94
curveVertex(darkershadowx+.02*wd, darkershadowy-.235*ht);      // 8,-94
curveVertex(darkershadowx+.045*wd, darkershadowy-.255*ht);     // 18,-102
curveVertex(darkershadowx+.055*wd, darkershadowy-.255*ht);     // 22,-102
curveVertex(darkershadowx+.0625*wd, darkershadowy-.255*ht);    // 25,-102
curveVertex(darkershadowx+.0625*wd, darkershadowy-.255*ht);    // 25,-102
vertex(darkershadowx+.0625*wd, darkershadowy-.255*ht);         // 25,-102
vertex(darkershadowx+.0625*wd, darkershadowy-.1675*ht);        // 25,-67
vertex(darkershadowx+.0875*wd, darkershadowy-.1675*ht);        // 35,-67
vertex(darkershadowx+.0875*wd, darkershadowy-.2625*ht);        // 35,-105
curveVertex(darkershadowx+.0875*wd, darkershadowy-.2625*ht);   // 35,-105
curveVertex(darkershadowx+.0875*wd, darkershadowy-.2625*ht);   // 35,-105
curveVertex(darkershadowx+.07*wd, darkershadowy-.285*ht);      // 28,-114
curveVertex(darkershadowx+.04*wd, darkershadowy-.285*ht);      // 16,-114
curveVertex(darkershadowx+.0075*wd, darkershadowy-.27*ht);     // 3,-108
curveVertex(darkershadowx-.0125*wd, darkershadowy-.25*ht);     // -5,-100
curveVertex(darkershadowx-.0125*wd, darkershadowy-.25*ht);     // -5,-100
vertex(darkershadowx-.0125*wd, darkershadowy-.25*ht);          // -5,-100
vertex(darkershadowx+.02*wd, darkershadowy-.235*ht);           // 8,-94
vertex(darkershadowx+.02*wd, darkershadowy+.24*ht);            // 8,96
curveVertex(darkershadowx+.02*wd, darkershadowy+.24*ht);       // 8,96
curveVertex(darkershadowx+.02*wd, darkershadowy+.24*ht);       // 8,96
curveVertex(darkershadowx+.025*wd, darkershadowy+.2475*ht);    // 10,99
curveVertex(darkershadowx+.0525*wd, darkershadowy+.2475*ht);   // 21,99
curveVertex(darkershadowx+.06*wd, darkershadowy+.24*ht);       // 24,96
curveVertex(darkershadowx+.06*wd, darkershadowy+.24*ht);       // 24,96
vertex(darkershadowx+.06*wd, darkershadowy+.24*ht);            // 24,96
vertex(darkershadowx+.06*wd, darkershadowy+.1025*ht);          // 24,41
vertex(darkershadowx+.0875*wd, darkershadowy+.1025*ht);        // 35,41
vertex(darkershadowx+.0875*wd, darkershadowy+.255*ht);         // 35,102
curveVertex(darkershadowx+.0875*wd, darkershadowy+.255*ht);    // 35,102
curveVertex(darkershadowx+.0875*wd, darkershadowy+.255*ht);    // 35,102
curveVertex(darkershadowx+.07*wd, darkershadowy+.275*ht);      // 28,110
curveVertex(darkershadowx+.015*wd, darkershadowy+.275*ht);     // 6,110
curveVertex(darkershadowx-.0125*wd, darkershadowy+.25*ht);     // -5,100
curveVertex(darkershadowx-.0125*wd, darkershadowy+.25*ht);     // -5,100
endShape();
// start n shadow
beginShape();
vertex(darkershadowx+.1675*wd, darkershadowy+.275*ht);         // 67,110
vertex(darkershadowx+.1675*wd, darkershadowy-.25*ht);          // 67,-100
curveVertex(darkershadowx+.1675*wd, darkershadowy-.25*ht);     // 67,-100
curveVertex(darkershadowx+.1675*wd, darkershadowy-.25*ht);     // 67,-100
curveVertex(darkershadowx+.155*wd, darkershadowy-.26*ht);      // 62,-104
curveVertex(darkershadowx+.1625*wd, darkershadowy-.2775*ht);   // 65,111
curveVertex(darkershadowx+.1775*wd, darkershadowy-.285*ht);    // 71,-114
curveVertex(darkershadowx+.195*wd, darkershadowy-.265*ht);     // 78,-106
curveVertex(darkershadowx+.195*wd, darkershadowy-.265*ht);     // 78,-106
vertex(darkershadowx+.195*wd, darkershadowy-.265*ht);          // 78,-106
vertex(darkershadowx+.195*wd, darkershadowy-.265*ht);          // 78,-106
curveVertex(darkershadowx+.195*wd, darkershadowy-.265*ht);     // 78,-106
curveVertex(darkershadowx+.195*wd, darkershadowy-.265*ht);     // 78,-106
curveVertex(darkershadowx+.215*wd, darkershadowy-.285*ht);     // 86,-114
curveVertex(darkershadowx+.245*wd, darkershadowy-.285*ht);     // 98,-114
curveVertex(darkershadowx+.2625*wd, darkershadowy-.2625*ht);   // 105,-105
curveVertex(darkershadowx+.2625*wd, darkershadowy-.2625*ht);   // 105,-105
vertex(darkershadowx+.2625*wd, darkershadowy-.2625*ht);        // 105,-105
vertex(darkershadowx+.2625*wd, darkershadowy+.275*ht);         // 105,110
vertex(darkershadowx+.2375*wd, darkershadowy+.275*ht);         // 95,110
vertex(darkershadowx+.2375*wd, darkershadowy-.255*ht);         // 95,-102
curveVertex(darkershadowx+.2375*wd, darkershadowy-.255*ht);    // 95,-102
curveVertex(darkershadowx+.23*wd, darkershadowy-.255*ht);      // 92,-102
curveVertex(darkershadowx+.22*wd, darkershadowy-.255*ht);      // 88,-102
curveVertex(darkershadowx+.195*wd, darkershadowy-.235*ht);     // 78,-94
curveVertex(darkershadowx+.195*wd, darkershadowy-.235*ht);     // 78,-94
vertex(darkershadowx+.195*wd, darkershadowy-.235*ht);          // 78,-94
vertex(darkershadowx+.195*wd, darkershadowy-.235*ht);          // 78,-94
vertex(darkershadowx+.195*wd, darkershadowy+.275*ht);          // 78,110
endShape();


// DRAW SHADOWS
// start m shadow
fill(coralred);
noStroke();
beginShape();
vertex(shadowx-.25*wd, shadowy+.275*ht);           // -100,110
vertex(shadowx-.25*wd, shadowy-.25*ht);            // -100,-100
curveVertex(shadowx-.25*wd, shadowy-.25*ht);       // -100,-100
curveVertex(shadowx-.25*wd, shadowy-.25*ht);       // -100,-100
curveVertex(shadowx-.2625*wd, shadowy-.26*ht);     // -105,-104
curveVertex(shadowx-.255*wd, shadowy-.2775*ht);    // 102,111
curveVertex(shadowx-.24*wd, shadowy-.285*ht);      // -96,-114
curveVertex(shadowx-.2225*wd, shadowy-.265*ht);    // -89,-106
curveVertex(shadowx-.2225*wd, shadowy-.265*ht);    // -89,-106
curveVertex(shadowx-.2025*wd, shadowy-.285*ht);    // -81,-114
curveVertex(shadowx-.1725*wd, shadowy-.285*ht);    // -69,-114
curveVertex(shadowx-.1575*wd, shadowy-.2625*ht);   // -63,-106
curveVertex(shadowx-.1375*wd, shadowy-.285*ht);    // -55,-114
curveVertex(shadowx-.1075*wd, shadowy-.285*ht);    // -43,-114
curveVertex(shadowx-.09*wd, shadowy-.2625*ht);     // -36,-105
curveVertex(shadowx-.09*wd, shadowy-.2625*ht);     // -36,-105
vertex(shadowx-.09*wd, shadowy-.2625*ht);          // -36,-105
vertex(shadowx-.09*wd, shadowy+.275*ht);           // -36,110
vertex(shadowx-.115*wd, shadowy+.275*ht);          // -46,110
vertex(shadowx-.115*wd, shadowy-.255*ht);          // -46,-102
curveVertex(shadowx-.115*wd, shadowy-.255*ht);     // -46,-102
curveVertex(shadowx-.115*wd, shadowy-.255*ht);     // -46,-102
curveVertex(shadowx-.1225*wd, shadowy-.255*ht);    // -49,-102
curveVertex(shadowx-.1325*wd, shadowy-.255*ht);    // -53,-102
curveVertex(shadowx-.1575*wd, shadowy-.235*ht);    // -63,-94
curveVertex(shadowx-.1575*wd, shadowy-.235*ht);    // -63,-94
vertex(shadowx-.1575*wd, shadowy-.235*ht);         // -63,-94
vertex(shadowx-.1575*wd, shadowy+.275*ht);         // -63,110
vertex(shadowx-.18*wd, shadowy+.275*ht);           // -72,110
vertex(shadowx-.18*wd, shadowy-.255*ht);           // -72,-102
curveVertex(shadowx-.18*wd, shadowy-.255*ht);      // -72,-102
curveVertex(shadowx-.18*wd, shadowy-.255*ht);      // -72,-102
curveVertex(shadowx-.1875*wd, shadowy-.255*ht);    // -75,-102
curveVertex(shadowx-.1975*wd, shadowy-.255*ht);    // -79,-102
curveVertex(shadowx-.2225*wd, shadowy-.235*ht);    // -89,-94
curveVertex(shadowx-.2225*wd, shadowy-.235*ht);    // -89,-94
vertex(shadowx-.2225*wd, shadowy-.235*ht);         // -89,-94
vertex(shadowx-.2225*wd, shadowy+.275*ht);         // -89,110
endShape();
// start c shadow
fill(offyellow);
beginShape();
curveVertex(shadowx-.0125*wd, shadowy-.25*ht);     // -5,-100
curveVertex(shadowx-.0125*wd, shadowy-.25*ht);     // -5,-100
vertex(shadowx-.0125*wd, shadowy-.25*ht);          // -5,-100
vertex(shadowx+.02*wd, shadowy-.235*ht);           // 8,-94
curveVertex(shadowx+.02*wd, shadowy-.235*ht);      // 8,-94
curveVertex(shadowx+.02*wd, shadowy-.235*ht);      // 8,-94
curveVertex(shadowx+.045*wd, shadowy-.255*ht);     // 18,-102
curveVertex(shadowx+.055*wd, shadowy-.255*ht);     // 22,-102
curveVertex(shadowx+.0625*wd, shadowy-.255*ht);    // 25,-102
curveVertex(shadowx+.0625*wd, shadowy-.255*ht);    // 25,-102
vertex(shadowx+.0625*wd, shadowy-.255*ht);         // 25,-102
vertex(shadowx+.0625*wd, shadowy-.1675*ht);        // 25,-67
vertex(shadowx+.0875*wd, shadowy-.1675*ht);        // 35,-67
vertex(shadowx+.0875*wd, shadowy-.2625*ht);        // 35,-105
curveVertex(shadowx+.0875*wd, shadowy-.2625*ht);   // 35,-105
curveVertex(shadowx+.0875*wd, shadowy-.2625*ht);   // 35,-105
curveVertex(shadowx+.07*wd, shadowy-.285*ht);      // 28,-114
curveVertex(shadowx+.04*wd, shadowy-.285*ht);      // 16,-114
curveVertex(shadowx+.0075*wd, shadowy-.27*ht);     // 3,-108
curveVertex(shadowx-.0125*wd, shadowy-.25*ht);     // -5,-100
curveVertex(shadowx-.0125*wd, shadowy-.25*ht);     // -5,-100
vertex(shadowx-.0125*wd, shadowy-.25*ht);          // -5,-100
vertex(shadowx+.02*wd, shadowy-.235*ht);           // 8,-94
vertex(shadowx+.02*wd, shadowy+.24*ht);            // 8,96
curveVertex(shadowx+.02*wd, shadowy+.24*ht);       // 8,96
curveVertex(shadowx+.02*wd, shadowy+.24*ht);       // 8,96
curveVertex(shadowx+.025*wd, shadowy+.2475*ht);    // 10,99
curveVertex(shadowx+.0525*wd, shadowy+.2475*ht);   // 21,99
curveVertex(shadowx+.06*wd, shadowy+.24*ht);       // 24,96
curveVertex(shadowx+.06*wd, shadowy+.24*ht);       // 24,96
vertex(shadowx+.06*wd, shadowy+.24*ht);            // 24,96
vertex(shadowx+.06*wd, shadowy+.1025*ht);          // 24,41
vertex(shadowx+.0875*wd, shadowy+.1025*ht);        // 35,41
vertex(shadowx+.0875*wd, shadowy+.255*ht);         // 35,102
curveVertex(shadowx+.0875*wd, shadowy+.255*ht);    // 35,102
curveVertex(shadowx+.0875*wd, shadowy+.255*ht);    // 35,102
curveVertex(shadowx+.07*wd, shadowy+.275*ht);      // 28,110
curveVertex(shadowx+.015*wd, shadowy+.275*ht);     // 6,110
curveVertex(shadowx-.0125*wd, shadowy+.25*ht);     // -5,100
curveVertex(shadowx-.0125*wd, shadowy+.25*ht);     // -5,100
endShape();
// start n shadow
fill(turquoise);
beginShape();
vertex(shadowx+.1675*wd, shadowy+.275*ht);         // 67,110
vertex(shadowx+.1675*wd, shadowy-.25*ht);          // 67,-100
curveVertex(shadowx+.1675*wd, shadowy-.25*ht);     // 67,-100
curveVertex(shadowx+.1675*wd, shadowy-.25*ht);     // 67,-100
curveVertex(shadowx+.155*wd, shadowy-.26*ht);      // 62,-104
curveVertex(shadowx+.1625*wd, shadowy-.2775*ht);   // 65,111
curveVertex(shadowx+.1775*wd, shadowy-.285*ht);    // 71,-114
curveVertex(shadowx+.195*wd, shadowy-.265*ht);     // 78,-106
curveVertex(shadowx+.195*wd, shadowy-.265*ht);     // 78,-106
vertex(shadowx+.195*wd, shadowy-.265*ht);          // 78,-106
vertex(shadowx+.195*wd, shadowy-.265*ht);          // 78,-106
curveVertex(shadowx+.195*wd, shadowy-.265*ht);     // 78,-106
curveVertex(shadowx+.195*wd, shadowy-.265*ht);     // 78,-106
curveVertex(shadowx+.215*wd, shadowy-.285*ht);     // 86,-114
curveVertex(shadowx+.245*wd, shadowy-.285*ht);     // 98,-114
curveVertex(shadowx+.2625*wd, shadowy-.2625*ht);   // 105,-105
curveVertex(shadowx+.2625*wd, shadowy-.2625*ht);   // 105,-105
vertex(shadowx+.2625*wd, shadowy-.2625*ht);        // 105,-105
vertex(shadowx+.2625*wd, shadowy+.275*ht);         // 105,110
vertex(shadowx+.2375*wd, shadowy+.275*ht);         // 95,110
vertex(shadowx+.2375*wd, shadowy-.255*ht);         // 95,-102
curveVertex(shadowx+.2375*wd, shadowy-.255*ht);    // 95,-102
curveVertex(shadowx+.23*wd, shadowy-.255*ht);      // 92,-102
curveVertex(shadowx+.22*wd, shadowy-.255*ht);      // 88,-102
curveVertex(shadowx+.195*wd, shadowy-.235*ht);     // 78,-94
curveVertex(shadowx+.195*wd, shadowy-.235*ht);     // 78,-94
vertex(shadowx+.195*wd, shadowy-.235*ht);          // 78,-94
vertex(shadowx+.195*wd, shadowy-.235*ht);          // 78,-94
vertex(shadowx+.195*wd, shadowy+.275*ht);          // 78,110
endShape();


// DRAW M
fill(white);
beginShape();
vertex(x-.25*wd, y+.275*ht);           // -100,110
vertex(x-.25*wd, y-.25*ht);            // -100,-100
curveVertex(x-.25*wd, y-.25*ht);       // -100,-100
curveVertex(x-.25*wd, y-.25*ht);       // -100,-100
curveVertex(x-.2625*wd, y-.26*ht);     // -105,-104
curveVertex(x-.255*wd, y-.2775*ht);    // 102,111
curveVertex(x-.24*wd, y-.285*ht);      // -96,-114
curveVertex(x-.2225*wd, y-.265*ht);    // -89,-106
curveVertex(x-.2225*wd, y-.265*ht);    // -89,-106
curveVertex(x-.2025*wd, y-.285*ht);    // -81,-114
curveVertex(x-.1725*wd, y-.285*ht);    // -69,-114
curveVertex(x-.1575*wd, y-.2625*ht);   // -63,-106
curveVertex(x-.1375*wd, y-.285*ht);    // -55,-114
curveVertex(x-.1075*wd, y-.285*ht);    // -43,-114
curveVertex(x-.09*wd, y-.2625*ht);     // -36,-105
curveVertex(x-.09*wd, y-.2625*ht);     // -36,-105
vertex(x-.09*wd, y-.2625*ht);          // -36,-105
vertex(x-.09*wd, y+.275*ht);           // -36,110
vertex(x-.115*wd, y+.275*ht);          // -46,110
vertex(x-.115*wd, y-.255*ht);          // -46,-102
curveVertex(x-.115*wd, y-.255*ht);     // -46,-102
curveVertex(x-.115*wd, y-.255*ht);     // -46,-102
curveVertex(x-.1225*wd, y-.255*ht);    // -49,-102
curveVertex(x-.1325*wd, y-.255*ht);    // -53,-102
curveVertex(x-.1575*wd, y-.235*ht);    // -63,-94
curveVertex(x-.1575*wd, y-.235*ht);    // -63,-94
vertex(x-.1575*wd, y-.235*ht);         // -63,-94
vertex(x-.1575*wd, y+.275*ht);         // -63,110
vertex(x-.18*wd, y+.275*ht);           // -72,110
vertex(x-.18*wd, y-.255*ht);           // -72,-102
curveVertex(x-.18*wd, y-.255*ht);      // -72,-102
curveVertex(x-.18*wd, y-.255*ht);      // -72,-102
curveVertex(x-.1875*wd, y-.255*ht);    // -75,-102
curveVertex(x-.1975*wd, y-.255*ht);    // -79,-102
curveVertex(x-.2225*wd, y-.235*ht);    // -89,-94
curveVertex(x-.2225*wd, y-.235*ht);    // -89,-94
vertex(x-.2225*wd, y-.235*ht);         // -89,-94
vertex(x-.2225*wd, y+.275*ht);         // -89,110
endShape();


// DRAW C
beginShape();
curveVertex(x-.0125*wd, y-.25*ht);     // -5,-100
curveVertex(x-.0125*wd, y-.25*ht);     // -5,-100
vertex(x-.0125*wd, y-.25*ht);          // -5,-100
vertex(x+.02*wd, y-.235*ht);           // 8,-94
curveVertex(x+.02*wd, y-.235*ht);      // 8,-94
curveVertex(x+.02*wd, y-.235*ht);      // 8,-94
curveVertex(x+.045*wd, y-.255*ht);     // 18,-102
curveVertex(x+.055*wd, y-.255*ht);     // 22,-102
curveVertex(x+.0625*wd, y-.255*ht);    // 25,-102
curveVertex(x+.0625*wd, y-.255*ht);    // 25,-102
vertex(x+.0625*wd, y-.255*ht);         // 25,-102
vertex(x+.0625*wd, y-.1675*ht);        // 25,-67
vertex(x+.0625*wd, y-.1675*ht);        // 25,-67
vertex(x+.0875*wd, y-.1675*ht);        // 35,-67
vertex(x+.0875*wd, y-.2625*ht);        // 35,-105
curveVertex(x+.0875*wd, y-.2625*ht);   // 35,-105
curveVertex(x+.0875*wd, y-.2625*ht);   // 35,-105
curveVertex(x+.07*wd, y-.285*ht);      // 28,-114
curveVertex(x+.04*wd, y-.285*ht);      // 16,-114
curveVertex(x+.0075*wd, y-.27*ht);     // 3,-108
curveVertex(x-.0125*wd, y-.25*ht);     // -5,-100
curveVertex(x-.0125*wd, y-.25*ht);     // -5,-100
vertex(x-.0125*wd, y-.25*ht);          // -5,-100
vertex(x+.02*wd, y-.235*ht);           // 8,-94
vertex(x+.02*wd, y+.24*ht);            // 8,96
curveVertex(x+.02*wd, y+.24*ht);       // 8,96
curveVertex(x+.02*wd, y+.24*ht);       // 8,96
curveVertex(x+.025*wd, y+.2475*ht);    // 10,99
curveVertex(x+.0525*wd, y+.2475*ht);   // 21,99
curveVertex(x+.06*wd, y+.24*ht);       // 24,96
curveVertex(x+.06*wd, y+.24*ht);       // 24,96
vertex(x+.06*wd, y+.24*ht);            // 24,96
vertex(x+.06*wd, y+.1025*ht);          // 24,41
vertex(x+.0875*wd, y+.1025*ht);        // 35,41
vertex(x+.0875*wd, y+.255*ht);         // 35,102
curveVertex(x+.0875*wd, y+.255*ht);    // 35,102
curveVertex(x+.0875*wd, y+.255*ht);    // 35,102
curveVertex(x+.07*wd, y+.275*ht);      // 28,110
curveVertex(x+.015*wd, y+.275*ht);     // 6,110
curveVertex(x-.0125*wd, y+.25*ht);     // -5,100
curveVertex(x-.0125*wd, y+.25*ht);     // -5,100
endShape();



// DRAW N
beginShape();
vertex(x+.1675*wd, y+.275*ht);         // 67,110
vertex(x+.1675*wd, y-.25*ht);          // 67,-100
curveVertex(x+.1675*wd, y-.25*ht);     // 67,-100
curveVertex(x+.1675*wd, y-.25*ht);     // 67,-100
curveVertex(x+.155*wd, y-.26*ht);      // 62,-104
curveVertex(x+.1625*wd, y-.2775*ht);   // 65,111
curveVertex(x+.1775*wd, y-.285*ht);    // 71,-114
curveVertex(x+.195*wd, y-.265*ht);     // 78,-106
curveVertex(x+.195*wd, y-.265*ht);     // 78,-106
vertex(x+.195*wd, y-.265*ht);          // 78,-106
vertex(x+.195*wd, y-.265*ht);          // 78,-106
curveVertex(x+.195*wd, y-.265*ht);     // 78,-106
curveVertex(x+.195*wd, y-.265*ht);     // 78,-106
curveVertex(x+.215*wd, y-.285*ht);     // 86,-114
curveVertex(x+.245*wd, y-.285*ht);     // 98,-114
curveVertex(x+.2625*wd, y-.2625*ht);   // 105,-105
curveVertex(x+.2625*wd, y-.2625*ht);   // 105,-105
vertex(x+.2625*wd, y-.2625*ht);        // 105,-105
vertex(x+.2625*wd, y+.275*ht);         // 105,110
vertex(x+.2375*wd, y+.275*ht);         // 95,110
vertex(x+.2375*wd, y-.255*ht);         // 95,-102
curveVertex(x+.2375*wd, y-.255*ht);    // 95,-102
curveVertex(x+.2375*wd, y-.255*ht);    // 95,-102
curveVertex(x+.23*wd, y-.255*ht);      // 92,-102
curveVertex(x+.22*wd, y-.255*ht);      // 88,-102
curveVertex(x+.195*wd, y-.235*ht);     // 78,-94
curveVertex(x+.195*wd, y-.235*ht);     // 78,-94
vertex(x+.195*wd, y-.235*ht);          // 78,-94
vertex(x+.195*wd, y-.235*ht);          // 78,-94
vertex(x+.195*wd, y+.275*ht);          // 78,110
endShape();


//saveFrame("hw2.jpg");


