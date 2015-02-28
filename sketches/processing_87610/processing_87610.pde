
/*
 * Title: P05_05_ColorSpaces
 * By:    Barton Poulson (bartdoesart.com)
 * Date:  31 January 2013
 *
 * Assignment:
 *   Create a drawing that cycles through the color space using
 *   the 360° of the HSB color space. (In the Processing desktop
 *   application you can go to Tools > Color Selector to see what
 *   this looks like.
 */
 
 int d = 150;
 
 size(600, 200);
 background(240);
 noStroke();
 
 colorMode(HSB, 360, 100, 100);
 
 // This sketch has six circles that are evenly spaced
 // on the x axis, randomly position on the y axis, and
 // filled with colors at even intervals on HSB.
 
 fill(360 * 1/6, 100, 100, 100);
 ellipse(width * 1/7, random(height), d, d);
 
 fill(360 * 2/6, 100, 100, 100);
 ellipse(width * 2/7, random(height), d, d);
 
 fill(360 * 3/6, 100, 100, 100);
 ellipse(width * 3/7, random(height), d, d);
 
 fill(360 * 4/6, 100, 100, 100);
 ellipse(width * 4/7, random(height), d, d);
 
 fill(360 * 5/6, 100, 100, 100);
 ellipse(width * 5/7, random(height), d, d);
 
 fill(360 * 6/6, 100, 100, 100);
 ellipse(width * 6/7, random(height), d, d);
