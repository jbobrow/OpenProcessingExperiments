
// challenge #9
// pascal's triangle
// in processing.js

var node_spacing = 40;
var max = 21;

var iter = 1;
var x_sum[] = [];
var y_sum[] = [];

// make nice colors, from http://krazydad.com/tutorials/makecolors.php
color makeColor(i) {
    var center = 128;
    var width = 127;
    var steps = 6;
    var frequency = 2*Math.PI/steps;

    var r = Math.sin(frequency*i + 0) * width + center;
    var g = Math.sin(frequency*i + 2) * width + center;
    var b = Math.sin(frequency*i + 4) * width + center;

    return color(r, g, b);
}

void setup() {  // this is run once.   
    size(880, 880); // = (max + 1) * node_spacing
    frameRate(2);

    background(255); // clear the canvas
    stroke(0, 0, 0);

    textAlign(LEFT, TOP);
    textSize(9);
} 

void draw() {  // this is run repeatedly.
    for (var x = 1; x <= iter; ++x) {
        var x1 = (x * node_spacing) - (node_spacing / 2);
        var x2 = x1 + node_spacing;

        for (var y = 1; y <= iter; ++y) {
            var y1 = (y * node_spacing) - (node_spacing / 2);
            var y2 = y1 + node_spacing;

            // draw board lines
            fill(0);
            if (x < iter)
                line(x1, y1, x2, y1);
            if (y < iter)
                line(x1, y1, x1, y2);

            if (x == iter || y == iter) {
                // compute number
                var topsum = x_sum[x] || 0;
                var leftsum = y_sum[y] || 0;
                var sum = topsum + leftsum;
                if (sum == 0)
                    sum = 1;

                // store number
                x_sum[x] = sum;
                y_sum[y] = sum;

                // leave diagonal values in black
                if (x == y)
                    fill(0);
                else
                    fill(makeColor(iter));

                // draw number
                text(sum.toString(),
                     x1 + 1, y1 + 1,
                     // use less than full width, otherwise it goes out of bounds
                     node_spacing * 0.7, node_spacing);
            }
        }
    }

    ++iter;
    if (iter > max)
        noLoop();
}
