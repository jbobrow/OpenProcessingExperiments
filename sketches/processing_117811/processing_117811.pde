
// This sketch builds on a prior work, "Inscribed Circle", created by Russell Gordon & Emily Cho & Jamie Haberman
// http://bss.sketchpad.cc/sp/pad/view/ro.AzmdUnf7enAuWb/rev.646



// Pressing Control-R will render this sketch.

/*
 * Remember, view the Processing "reference sheet" at this address:
 *
 * http://processingjs.org/reference/
 *
 * Very helpful for determining how to accomplish a particular task.
 *
 * ALSO... here a link to our shared ideas notebook for Processing:
 *
 * http://bit.ly/16mMdEM
 *
 * In this document, share your algorithms or ideas for processing
 * sketches with the group.
 */

/* To declare a variable...
 *
 * type name;
 * OR
 * type name = value;
 *
 * eg.:
 * int penWidth = 30;
 */

/*
 * Setup... code in this function is run once only.
 */
void setup() {
    // set the background color
    background(255);
    
    // canvas size (Integers only, please.)
    size(300, 300); 
      
    // smooth edges
    smooth();
    
    // limit the number of frames per second; draw() function is run
    // 30 times per second if frame rate is set to 30
    frameRate(1);
    
    // no border on shapes
    noStroke();
    
    // draw a star in the middle of the screen
    //drawStar(150, 150, 75, 0);

} 

/*
 * Draw... code in this function is run repeatedly.
 */
void draw() {

    drawStar(random(50, 250), random(50, 250), random(5, 75), random(-23, 23));   

}

/*
 * Additional functions should be declared below.
 * See Processing reference page for possibilities.
 * http://processingjs.org/reference/
 */


/*
 * Draws a five pointed star.
 * Parameters:    int x, int y            - co-ordinates for centre of the star
 *                int radius              - size for star (think of a circle circumscribing the star)
 *                int rotation            - if rotation is 0, the second point of the star faces "north"
 * Returns:       void (nothing)
 */
void drawStar(int x, int y, int radius, int rotation) {
    
    float pointOneX, pointOneY;
    float pointTwoX, pointTwoY;
    float pointThreeX, pointThreeY;
    float pointFourX, pointFourY;
    float pointFiveX, pointFiveY;
    float angle; // in radians
    
    
    // Get the co-ordinates of the five points
    // First point
    angle = toRadians(18 + rotation);    
    //println(angle);
    pointOneX = cos(angle)*radius; // Horizontal difference from centre of circle that would circumscribe the star
    //println(pointOneX);
    pointOneX = pointOneX + x;    // Set 'x' relative to left side of canvas, not just centre of the circle
    //println(pointOneX);
    pointOneY = sin(angle)*radius;    // Vertical difference from centre of circle that would circumscribe the star  
    //println(pointOneY);
    pointOneY = (pointOneY * -1) + y;    // Set 'y' relative to top edge of canvas, not just centre of the circle
    //println(pointOneY);
    //line(x, y, pointOneX, pointOneY); //DEBUG

    // Second point
    angle = toRadians(90 + rotation);    
    pointTwoX = cos(angle)*radius;
    pointTwoX = pointTwoX + x;
    pointTwoY = sin(angle)*radius;
    pointTwoY = (pointTwoY * -1) + y;
    //line(x, y, pointTwoX, pointTwoY); //DEBUG

    // Third point
    angle = toRadians(162 + rotation);    
    pointThreeX = cos(angle)*radius;
    pointThreeX = pointThreeX + x;
    pointThreeY = sin(angle)*radius;
    pointThreeY = (pointThreeY * -1) + y;
    //line(x, y, pointThreeX, pointThreeY); //DEBUG

    // Fourth point
    angle = toRadians(234 + rotation);    
    pointFourX = cos(angle)*radius;
    pointFourX = pointFourX + x;
    pointFourY = sin(angle)*radius;
    pointFourY = (pointFourY * -1) + y;
    //line(x, y, pointFourX, pointFourY); //DEBUG

    // Fifth point
    angle = toRadians(306 + rotation);    
    pointFiveX = cos(angle)*radius;
    pointFiveX = pointFiveX + x;
    pointFiveY = sin(angle)*radius;
    pointFiveY = (pointFiveY * -1) + y;
    //line(x, y, pointFiveX, pointFiveY); //DEBUG

    // Draw the star
    
    /*
    // This code makes an outline, you can see the pentagon in the middle
    line(pointOneX, pointOneY, pointThreeX, pointThreeY); // line one, p1 to p3
    line(pointThreeX, pointThreeY, pointFiveX, pointFiveY); // line two, p3 to p5
    line(pointFiveX, pointFiveY, pointTwoX, pointTwoY); // line three, p5 to p2
    line(pointTwoX, pointTwoY, pointFourX, pointFourY);    // line four, p2 to p4
    line(pointFourX, pointFourY, pointOneX, pointOneY);
    */
    
    // This code defines vertices of a polygon allowing us to set a fill
    fill(random(5,255), random(5,255), random(5,255));
    beginShape();
    vertex(pointOneX, pointOneY);
    vertex(pointThreeX, pointThreeY);
    vertex(pointFiveX, pointFiveY);
    vertex(pointTwoX, pointTwoY);
    vertex(pointFourX, pointFourY);
    vertex(pointOneX, pointOneY);
    endShape();
    

}

/*
 * Converts an angle provided in degrees to radians.
 * Parameters:    float angleInDegrees    - The angle in degrees, to be be converted to radians.
 * Returns:       float                   - The angle in radians.
 */
float toRadians(float angleInDegrees) {
    
    return (angleInDegrees*TWO_PI)/360;

}
