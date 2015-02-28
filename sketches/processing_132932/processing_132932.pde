
/*
 * A sketch based on Emily Eifler's art: 
 * http://blinkpopshift.tumblr.com/post/73671335828/retweet-selfie-gif-ink-on-paper-digital
 */

size(600, 600);
colorMode(HSB);
background(255);
frameRate(24);

var counter = 0;
var curveWidth = 30;

// How random the curve is.
var sweep = 10;
var minsweep = -sweep;
var maxsweep = sweep;

// Space between the circles.
var space = 10;

// How long the segments of the curve are.
var length = 50;
var turnLength = 10;
var curveHue;

strokeWeight(2);

void draw () { 
    if (counter === 0) {
        // Pick a different color at the beginning of each curve.
        curveHue = random(255);
        fill(curveHue, 255, 255);

        // Position it at a random location at the top of the screen.
        translate(random(width), 0);

        pushMatrix();
        counter++;
    }

    // Move forward and rotate the curve randomly.
    translate(0, space);
    rotate(random(radians(minsweep), radians(maxsweep)));

    // Fade the curve between white and the choosen color along its
    // length.
    var curveSaturation = sin(
        radians(counter / (2 * length + turnLength) * 180)) * 255;
    fill(curveHue, curveSaturation, 255);

    // Draw the curve.
    ellipse(0, 0, curveWidth, curveWidth);
        
    pushMatrix();
    counter++;
    // If the counter has reached the turning point, set the sweep
    // so that the curve turns around.
    if (counter > length && counter < length + turnLength) {
        minsweep = 180 / turnLength;
        maxsweep = 180 / turnLength;
    }
    // If the counter is passed the turning point, set the sweep
    // back to  the usual randomness.
    if (counter >= length + turnLength) {
        minsweep = -sweep;
        maxsweep = sweep;
    }
    // When the counter is reasonably large, we assume that the
    // curve has gone/ off the screen, so we reset the position and
    // the counter so that a new curve is drawn from scratch.
    if (counter > 3 * length + turnLength) {
        for (var j = 0; j < counter; j++) {
            popMatrix();
        }
        resetMatrix();
        counter = 0;
    }
};

