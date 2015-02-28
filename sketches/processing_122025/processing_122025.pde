
// challenge #9
// pascal's triangle
// in processing.js

// space between vertices
var spacing = 40;
// max number of rows to draw
var max_rows = 21;
// this many iterations before a new row is drawn
var row_iterations = 5;
// number of different colors to use
var color_steps = 6;

// how many rows are currently visible?
var rows = 1;
// has the current row already been drawn?
var new_row = true;
// how many draw() iterations have been done?
var iteration = 0;
// counter to have the colors make nicer waves
var color_offset = 0;
// computed triangle numbers
var numbers = [];

// make nice colors, from http://krazydad.com/tutorials/makecolors.php
color makeColor(i) {
    var center = 128;
    var width = 127;
    var frequency = 2*Math.PI/color_steps;

    var r = Math.sin(frequency*i + 0) * width + center;
    var g = Math.sin(frequency*i + 2) * width + center;
    var b = Math.sin(frequency*i + 4) * width + center;

    return color(r, g, b);
}

void setup() {  // this is run once.   
    canvas_size = (max_rows + 1) * spacing
    size(canvas_size, canvas_size);

    stroke(0, 0, 0);
    textAlign(LEFT, TOP);
    textSize(9);

    frameRate(6);

    for (int i = 0; i < max_rows; ++i)
        numbers[i] = [];
} 

void draw() {  // this is run repeatedly.
    background(255); // clear the canvas

    for (var x = 0; x < rows; ++x) {
        var x1 = (x * spacing) + (spacing / 2);
        var x2 = x1 + spacing;

        for (var y = 0; y < rows; ++y) {
            var y1 = (y * spacing) + (spacing / 2);
            var y2 = y1 + spacing;

            // draw board lines
            fill(0);
            if (x + 1 < rows)
                line(x1, y1, x2, y1);
            if (y + 1 < rows)
                line(x1, y1, x1, y2);

            if (new_row && (x + 1 == rows || y + 1 == rows)) {
                // compute number
                var upnum = (y > 0 ? (numbers[x][y - 1] || 0) : 0);
                var leftnum = (x > 0 ? (numbers[x - 1][y] || 0) : 0);
                var num = upnum + leftnum;
                if (num == 0)
                    num = 1;

                numbers[x][y] = num;
            }

            // leave diagonal values in black
            if (x == y) {
                fill(0);
            } else {
                // make "rings" of color
                var ring = (x > y ? x : y);
                // subtract to make "rings" move left to right
                fill(makeColor(color_offset - ring));
            }

            // draw number
            int num = numbers[x][y];
            text(num.toString(),
                 x1 + 1, y1 + 1,
                 // use less than full width, otherwise it goes out of bounds
                 spacing * 0.7, spacing);
        }
    }

    // update loop state
    if (new_row)
      new_row = false;

    ++iteration;
    if (iteration > row_iterations)
    {
      iteration = 0;
      if (rows < max_rows)
      {
        ++rows;
        new_row = true;
      }
    }
    
    ++color_offset;
    if (color_offset == color_steps)
        color_offset = 0;
}
