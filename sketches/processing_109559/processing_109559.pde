
/**
This is a monster that was created for ATK 302, Fall 2013.
 */

size(640, 400);
background(0);
noStroke();

/**sky color*/
background (149, 178, 255);

/** grass */
fill(0, 175, 0);
rect(0, 280, 640, 120);

/** left leg */
fill(165, 43, 100);
rect(270, 240, 15, 50);

/**left foot */
fill(102);
ellipse(267, 295, 40, 20);

/** right leg */
fill(165, 43, 100);
rect(310, 240, 15, 50);

/**right foot */
fill(102);
ellipse(326, 295, 40, 20);

/** hornleft */
fill(102);
triangle(205, 165, 223, 135, 241, 165);

/** hornright */
fill(102);
triangle(357, 165, 375, 135, 393, 165);

/** body */
fill(26, 54, 129);
ellipse(300, 190, 150, 150);

/** left eye */
fill (255);
arc (275, 170, 40, 60, PI, TWO_PI);

/** left pupil */
fill(0);
arc(275, 170, 20, 40, PI, TWO_PI);

/** right eye */
fill (255);
arc (325, 170, 40, 60, PI, TWO_PI);

/** right pupil */
fill(0);
arc(325, 170, 20, 40, PI, TWO_PI);

/** nose */
fill(102);
ellipse(300, 183, 40, 40);

/** tooth1 */
fill(102);
triangle(270, 215, 278, 235, 284, 215);

/** tooth2 */
fill(102);
triangle(282, 215, 290, 235, 296, 215);

/** tooth3 */
fill(102);
triangle(294, 215, 302, 235, 308, 215);

/** tooth4 */
fill(102);
triangle(306, 215, 314, 235, 320, 215);

/** tooth5 */
fill(102);
triangle(318, 215, 326, 235, 332, 215);

/** mouth */
fill(165, 43, 100);
rect(265, 210, 70, 5);


