
/**
 * Author: Jesse Brown
 * Date: September 12, 2011
 * Details:
 *  Functional piechart. 
 *  Pie charts do not lend themselves to accurate interpretations of data. 
 *  This view aims to solve portions of that problem by adding interactivity 
 *  by dynamically switching between a pie and bar chart for the same data.
 */

/*
 * Take an array of values and normalize that array to fractions of 100%
 * for ease of working with the barchart
 */
float[] normalize(float[] xs) {
    int n = xs.length;
    float[] ys = new float[n];
    float sum = 0;
    for (int i = 0; i < n; ++i) { sum += xs[i]; }
    for (int i = 0; i < n; ++i) { ys[i] = xs[i] / sum; }
    return ys;
}

/*
 * The pie chart is drawn in radians. Given an array of values that are 
 * fractions of 100%, return an array of radians that map those values to 
 * circle coordinates
 */
float[] toRadians(float[] xs) {
    int n = xs.length;
    float[] ys = new float[n];
    for (int i = 0; i < n; ++i) { ys[i] = radians(360*xs[i]); }
    return ys;
}

/*
 * Determine if the mouse cursor is currently within the pie chart area
 * Euclidian distance for a circle
 * (x - x_origin)**2 + (y - y_origin)**2 <= radius**2
 * This also returns true for points *on* the circumfrence
 */
boolean inCircle () {
    float px = pow(mouseX - X_ORIGIN, 2);
    float py = pow(mouseY - Y_ORIGIN, 2);
    float pr = pow(DIAMETER / 2, 2);
    return (px + py <= pr);
}

/*
 * Determine if the mouse is currently bound by the angle of the arc defined
 * between the two radian values
 * atan2 returns values from -PI to PI the positive values being the lower
 * hemisphere. Add 2*PI to negative values to compensate for the upper 
 * hemisphere
 */
boolean inArc (float radian1, float radian2) {
    float v = atan2(mouseY - Y_ORIGIN, mouseX - X_ORIGIN); 
    if (v < 0) { v += TWO_PI; }
    return (v >= radian1 && v < radian2);
}

/*
 * Return the index of the 'slice' that the cursor is currently in.
 * Return -1 if the mouse is not currently in a slice
 */
int getArcIndex () {
    float theta = g_start;
    if (! inCircle ()) { return -1; }
    for (int i = 0; i < g_radian.length; ++i) {
        if (inArc (theta, theta + g_radian[i])) {
            return i;
        }
        theta += g_radian[i];
    }
    return -1;
}

/*
 * Draw the pie chart
 */
void drawPie () {

    // tell the user how to navigate
    float xpos = 0, ypos = TEXTSIZE;
    String msg = "Click any slice...";
    fill(LABCOLOR, pieAlpha);
    textSize(TEXTSIZE);
    textAlign(LEFT);
    text (msg, xpos, ypos);
    noStroke ();
    textSize(10); // reset for labels

    float theta = g_start;
    for (int i = 0; i < g_radian.length; i++){
        if (i == savedIndex) {
            // highlight the selected piece and show in the background
            // this is controlled by *barChart* alpha
            fill(255, barAlpha*0.25);
        } else {
            // color based on alternating position
            int f = i % 2 == 0 ? 50 : 205;
            fill(f, pieAlpha); 
        }
        arc(X_ORIGIN , Y_ORIGIN,
              DIAMETER, DIAMETER, theta, theta + g_radian[i]);

        // Place the label of the arc in the middle of the slice outside circle
        float phi = theta + g_radian[i] / 2;
        float lx = X_ORIGIN + (15 + DIAMETER / 2) * cos (phi);
        float ly = Y_ORIGIN + (15 + DIAMETER / 2) * sin (phi);
        textAlign(CENTER);
        fill(LABCOLOR, pieAlpha);
        text (g_labs[i], lx, ly);

        theta += g_radian[i];  
    }
}

/*
 * Draw the bar chart
 */
void drawBar () {

    // tell the user how to navigate
    float xpos = 0, ypos = TEXTSIZE;
    String msg = "Click to return...";
    fill(LABCOLOR, barAlpha);
    textSize(TEXTSIZE); 
    textAlign(LEFT);
    text (msg, xpos, ypos);
    noStroke ();
    textSize(10); // reset for labels

    float bottom = SIZE * (0.75 + (0.25 / 2));
    float left = SIZE - SIZE * (0.75 + (0.25 / 2));
    float ysize = SIZE - (2 * (SIZE - bottom));
    float xsize = SIZE - 2 * left;

    // Draw the bounding box
    fill(BGCOLOR,barAlpha);
    stroke(0,barAlpha);
    strokeWeight(1);
    rect(left,bottom-ysize,xsize,ysize);
    noStroke();

    // Draw grid *first* 
    stroke (255, barAlpha * 0.25);
    strokeWeight(1);
    float ystep = ysize / 10;
    float yl = bottom - ystep;
    int lab = 10;
    fill(255, barAlpha);
    textAlign(LEFT);
    while (yl > bottom - ysize) {
        line(left, yl, left + xsize, yl);
        String slab = lab + "%";
        text(slab,left - 30, yl + 5);
        yl -= ystep;
        lab += 10;
    }

    // Then draw the bins (with the labels)
    int nbins = g_values.length;
    float x = left;
    float binWidth = xsize / nbins;
    for (int i = 0; i < g_normal.length; ++i) {
        if (i == savedIndex) {
            // Match the background slice with a highlighted bar
            stroke(0,barAlpha);
            strokeWeight(4);
            fill(255, barAlpha);
        } else {
            noStroke ();
            fill(75,barAlpha); 
        }
        rect (x, bottom - g_normal[i]*ysize, binWidth, g_normal[i]*ysize);
        fill(255, barAlpha);
        textAlign(CENTER);
        text(g_labs[i], x + binWidth / 2, bottom + 40);
        x += binWidth;
    }
}

/*
 * Manage the changing of opacity on mouse clicks
 */
void handleTransition () {
    if (! inTransition) { return; }
    pieAlpha += pieStep;
    barAlpha += barStep;
    if (pieAlpha > 100.0) { pieAlpha = 100.0; }
    if (pieAlpha < 0.0) { pieAlpha = 0.0; }
    if (barAlpha > 100.0) { barAlpha = 100.0; }
    if (barAlpha < 0.0) { barAlpha = 0.0; }
    if (pieAlpha == 0.0 || pieAlpha == 100.0 
            || barAlpha == 0.0 || barAlpha == 100.0) {
        inTransition = false;
        pieStep = -pieStep;
        barStep = -barStep;
    }
}


//
// Global definitions/settings
//

int BGCOLOR = 100;              // color of the canvas
int LABCOLOR = 255;             // text color on top
int SIZE = 500;                 // Outer dimensions of the canvas
int TEXTSIZE = 20;              // Size of the message text
float DIAMETER = SIZE * 0.75;   // Diameter of the circle
float X_ORIGIN = SIZE / 2.0;    // centered x
float Y_ORIGIN = SIZE / 2.0;    // centered y

// FIXME: This breaks highlighting for anything other than 0
float g_start = radians(0);     // Angle to start the 'slices' (in radians)

// The original values of the pie 'slices'
float[] g_values = {random(10,50), random(10,50), random(10,50), random(10,50)};
float[] g_normal;               // ... normalized to %
float[] g_radian;               // ... mapped to radians
String[] g_labs = {"A", "B", "C", "D"}; // names of the values above

boolean inTransition = false;   // Currently transitioning between views?
float pieAlpha = 100.0;         // How opaque is the pie chart
float barAlpha = 0.0;           // How opaque is the bar chart
float pieStep = -3.0;           // The step in opacity when in transition
float barStep = 3.0;            // The step in opacity when in transition
int savedIndex = -1;            // When transitioning, save the 'slice'


void setup () {
    size(500, 500);
    background(BGCOLOR);
    smooth();
    noStroke();
    g_normal = normalize(g_values);
    g_radian = toRadians(g_normal);
}

void draw () {
    background(BGCOLOR);
    handleTransition ();
    drawPie ();
    drawBar ();
}

void mouseClicked () {
    if (inTransition) { return; }
    inTransition = true;
    // Only change the index if the pie chart is visible
    if (pieAlpha == 100.0) {
        savedIndex = getArcIndex ();
    } else {
        savedIndex = -1;
    }
}


