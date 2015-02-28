
/**
 * Draw a chart of letter pair frequencies.
 * Mouse over the ends of the chords to highlight and examine
 * particular relationships.
 *
 * Bruce Wilson, 5/7/2013
 */

final static String[] kLetters = {
  "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
  "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
};

// English letter frequency:  E T A O I N R S H ... B V K X Q J Z
// http://www.math.cornell.edu/~mec/2003-2004/cryptography/subs/frequencies.html

final static String[] kLettersByFreq = {
  "E", "T", "A", "O", "I", "N", "R", "S", "H", "D", "L", "U", "C",
  "M", "F", "Y", "W", "G", "P", "B", "V", "K", "X", "Q", "J", "Z"
};

final static String countFileDirectory = "";  // implicitly "data" for Processing (Java)
// final static String countFileDirectory = "letterpairs/";  // for direct Processing.js deployment

// Number of lines in the data file heading
final static int HEADING_LINES = 3;

ChordChart chart;
ColorLegend legend;
static color[] colorSpectrum;

void setup() {
  size(800, 620);
//  size(1000, 820);

  // Define the color pallette to be used when creating the chords
  colorSpectrum = colorSpectrum2();
//  colorSpectrum = colorSpectrum1();
  
  // Create the chart and legend
  createChart("info-retr.counts");
  
  smooth();
  
  // Keep the frame rate low, the chord chart is expensive to redraw
  frameRate(6);
}

void draw() {
  background(204);
  drawChartTitle();
  chart.draw();
  legend.draw();
}

void drawChartTitle() {
  String title = "Frequency of English Language Letter Pairs";
  pushStyle();
  fill(20);
  textSize(24);
  textAlign(CENTER, BOTTOM);
  text(title, width / 2.0, 40.0);
  popStyle();
}

/**
 * Build the chart and the associated color legend panel.
 */
void createChart(String countFile) {
  // Create an instance of ChordChart
  chart = new ChordChart(height / 2 - 80, kLetters);
//  chart = new ChordChart(height / 2 - 80, kLettersByFreq);  // try letters ordered by frequency
  
  // Read the pair data from the data file and create chords for the chart
  int maxCount = addChordsFromFile(countFile, 1000);
//  addChordTestPattern();  // debugging
  
  // Draw the ColorLegend chart
  legend = new ColorLegend(width - 100, height - 170, 80, 150, 0.0, (float)maxCount, colorSpectrum);
}

/**
 * @return the highest letterpair count found from the file
 */
int addChordsFromFile(String filename, int limit) {
  String[] data = loadStrings(countFileDirectory + filename);
  
  // Find the max count: it's the first line of non-heading data
  String firstData = data[HEADING_LINES].trim();
  String[] firstColumns = split(firstData, ' ');
  int maxCount = int(firstColumns[3]);
  
  // Reverse the data, draw the smallest counts first so the largest are on top
  data = reverse(data);
  
  color plainColor = color(250);
  color highlightColor = color(250, 40, 40);
  float chordThickness = 1.0;
  
  for ( int i = 0; i < data.length; i++ ) {
    if ( i >= (data.length - HEADING_LINES) ) continue;  // skip the heading lines
    if ( i > limit ) break;
    
    // Trim any whitespace before first column, otherwise splitting
    // on whitespace is thrown off!
    data[i] = data[i].trim();
    
    String[] columns = split(data[i], ' ');
    String letter1 = columns[1].toUpperCase();
    String letter2 = columns[2].toUpperCase();
    int count = int(columns[3]);
    
    // Skip double letters for now
    if ( letter1.equals(letter2) ) continue;
    
//    println(letter1 + " " + letter2);  // debugging
    
    // Apply a spectrum of colors to the chords according to count
    int colorIndex = (int)map(count, 0, maxCount, 0, colorSpectrum.length - 1);
    color chordColor = colorSpectrum[colorIndex];
    
    // Vary the thickness of the chords according to count
    float thickness = map(count, 0, maxCount, 0.3, 2.0);
    
    chart.addChord(letter1, letter2, chordColor, thickness);
  }
  
  return maxCount;
}

color[] colorSpectrum1() {
  pushStyle();
  colorMode(HSB, 360, 100, 100);
  color[] colors = new color[]{
    color(330, 80, 80),
    color(270, 80, 80),
    color(210, 80, 80),
    color(150, 80, 80),
    color(90, 80, 80),
    color(30, 80, 80)
  };
  popStyle();
  return colors;
}

color[] colorSpectrum2() {
  pushStyle();
  colorMode(HSB, 360, 100, 100);
  color[] colors = new color[]{
    color(210, 80, 80),
    color(180, 80, 80),
    color(150, 80, 80),
    color(120, 80, 80),
    color(90, 80, 80),
    color(60, 80, 80),
    color(30, 80, 80),
    color(0, 80, 80)
  };
  popStyle();
  return colors;
}

color[] colorSpectrum3() {
  pushStyle();
  colorMode(HSB, 360, 100, 100);
  color[] colors = new color[]{
    color(330, 80, 80),
    color(300, 80, 80),
    color(270, 80, 80),
    color(240, 80, 80),
    color(210, 80, 80),
    color(180, 80, 80),
    color(150, 80, 80),
    color(120, 80, 80),
    color(90, 80, 80),
    color(60, 80, 80),
    color(30, 80, 80)
  };
  popStyle();
  return colors;
}

void addChordTestPattern() {
  chart.addChord("A", "C", color(250), 1.0);
  chart.addChord("A", "E", color(250), 0.8);
  chart.addChord("A", "G", color(250), 0.6);
  chart.addChord("A", "I", color(250), 0.4);
  chart.addChord("A", "K");
//  chart.addChord("A", "M");
//  chart.addChord("A", "N");
  chart.addChord("A", "P");
  chart.addChord("A", "U");
  chart.addChord("A", "X");
//  chart.addChord("Z", "P");
//  chart.addChord("Z", "U");
//  chart.addChord("Z", "X");
}

/**
 * Chord of a ChordChart.
 *
 * Bruce Wilson, 5/7/2013
 */

class Chord {
  String _label1;
  String _label2;
  float _angle1;
  float _angle2;
  float _thickness = 0.3;
  color _color = color(250);
  color _highlightColor = color(250);
  
  Chord(String label1, String label2, float angle1, float angle2, color clr, float thickness) {
    _label1 = label1;
    _label2 = label2;
    _angle1 = angle1;
    _angle2 = angle2;
    _color = clr;
    _thickness = thickness;
  }
  
  Chord(String label1, String label2, float angle1, float angle2, color clr) {
    _label1 = label1;
    _label2 = label2;
    _angle1 = angle1;
    _angle2 = angle2;
    _color = clr;
  }
  
  Chord(String label1, String label2, float angle1, float angle2) {
    _label1 = label1;
    _label2 = label2;
    _angle1 = angle1;
    _angle2 = angle2;
  }

  void draw(int xc, int yc, int radius, boolean highlight) {
    pushStyle();
    
    // Tension: from 0.0 to 1.0, larger value brings chords
    // further from center
    float tension = 0.50;

    float x1 = xc + radius * cos(_angle1);
    float y1 = yc + radius * sin(_angle1);

    float x2 = xc + tension * radius * cos(_angle1);
    float y2 = yc + tension * radius * sin(_angle1);

    float x3 = xc + tension * radius * cos(_angle2);
    float y3 = yc + tension * radius * sin(_angle2);

    float x4 = xc + radius * cos(_angle2);
    float y4 = yc + radius * sin(_angle2);

    noFill();
    stroke(_color);
    strokeWeight(_thickness);
    
    if ( highlight ) {
      stroke(_highlightColor);
      strokeWeight(2);
      // strokeWeight(2 * _thickness);
    }    
    
    bezier(x1, y1, x2, y2, x3, y3, x4, y4);
    // line(x1, y1, x4, y4);

    popStyle();
  }
  
  String getLabel1() { return _label1; }
  String getLabel2() { return _label2; }
  
  float getAngle1() { return _angle1; }
  float getAngle2() { return _angle2; }
  
  String toString() {
    return _label1 + "-" + _label2;
  }
}

/**
 * ChordChart: Chart of correspondences between pairs of things.
 *
 * Bruce Wilson, 5/7/2013
 */

class ChordChart {
  int _xc;
  int _yc;
  int _radius;

  Chord[] _chords = new Chord[0];  
  String[] _labels;

  color _backgroundColor = color(20);
  color _labelTextColor = color(0);
  color _labelBackgroundColor = color(205);
  color _labelHighlightTextColor = color(255);
  color _labelHighlightBackgroundColor = color(140);
  int   _labelCornerRadius = 3;
  
  // Labels around edge of ChordChart
  PFont  _labelFont;
  int    _labelMargin = 10;
  int    _labelSize = 16;
  String _textFamily = "Helvetica";

  float _angleClose = PI / 12.0;  // For measuring closeness to mouse

  // Region of chart that is mouse sensitive
  final float _minMouseOverRadiusPct = 0.70;
  float _innerMouseOverRadius;
  float _outerMouseOverRadius;

  /** Create a new chart */
  ChordChart(int x, int y, int radius, String[] labels) {
    _xc = x;
    _yc = y;
    _radius = radius;
    _innerMouseOverRadius = _minMouseOverRadiusPct * radius;
    _outerMouseOverRadius = radius + _labelMargin + _labelSize;
    _labels = labels;
    _labelFont = createFont(_textFamily, _labelSize, true);
    _angleClose = TWO_PI / (float)labels.length / 2.0;
  }

  /** Create a chart in the center of the window */
  ChordChart(int radius, String[] labels) {
    this(width / 2, height / 2, radius, labels);
  }

  /** Chord with a default color and thickness */
  Chord addChord(String label1, String label2) {
    return addChord(label1, label2, color(250), 0.3);
  }

  /** Chord with a default color */
  Chord addChord(String label1, String label2, color colr) {
    return addChord(label1, label2, colr, 0.3);
  }

  Chord addChord(String label1, String label2, color colr, float thickness) {
    int index1 = indexForLabel(label1);
    int index2 = indexForLabel(label2);

    // Index not found for some label
    if ( (index1 < 0) || (index2 < 0) ) return null;

    float angle1 = labelAngle(index1);
    float angle2 = labelAngle(index2);

    Chord c = new Chord(label1, label2, angle1, angle2, colr, thickness);
    _chords = (Chord[])append(_chords, c);
    return c;
  }

  int indexForLabel(String label) {
    for ( int i=0; i < _labels.length; i++ ) {
      if ( _labels[i].equals(label) ) {
        return i;
      }
    }
    println("Warning: No chord found for label \"" + label + "\"");  // debugging
    return -1;
  }

  void draw() {
    // Draw the filled circle
    pushStyle();
    fill(_backgroundColor);
    ellipseMode(RADIUS);
    ellipse(_xc, _yc, _radius, _radius);
    popStyle();

    // Draw the chords between letters
    for (int i = 0; i < _chords.length; i++ ) {
      Chord c = _chords[i];
      boolean highlight = isMouseNearChord(c);

      _chords[i].draw(_xc, _yc, _radius, highlight);
   }

    // Draw each of the letter labels
    drawLabels();
  }

  void drawLabels() {
    pushStyle();
    textFont(_labelFont);
    textSize(_labelSize);
    textAlign(CENTER, BOTTOM);

    for ( int i = 0; i < _labels.length; i++ ) {
      float angle = labelAngle(i);

      pushMatrix();
      translate(_xc, _yc);                   // move to the center of the circular chart
      rotate(angle);                         // rotate to the direction of the chord end
      translate(_radius + _labelMargin, 0);  // move out to the radius of the circle
      rotate(HALF_PI);                       // rotate the text by 90 degrees

      boolean highlighted = isMouseNearAngle( angle );

      color labelColor = _labelTextColor;
      color rectColor = _labelBackgroundColor;
      if ( highlighted ) {
        labelColor = color(_labelHighlightTextColor);
        rectColor = color(_labelHighlightBackgroundColor);
      }
      
      // Draw the square background to the label
      fill(rectColor);
      noStroke();
      rectMode(CENTER);
      rect(0, -_labelSize / 2, _labelSize + 4, _labelSize + 4, _labelCornerRadius);

      // Draw the text of the label
      fill(labelColor);
      text(_labels[i], 0, 0);

      popMatrix();
    }

    popStyle();
  }

  float labelAngle(int index) {
    return TWO_PI - TWO_PI * (float)index / (float)_labels.length;
  }

  boolean isMouseNearChord(Chord c) {
    float mouseAngle = getMouseAngle();
    if ( isMouseNearAngle(c.getAngle1()) ) return true;
    if ( isMouseNearAngle(c.getAngle2()) ) return true;
    return false;
  }
  
  boolean isMouseNearAngle(float angle) {
    float mouseAngle = getMouseAngle();
    if (mouseAngle < 0) return false;  // not in selection range
    
//    println( "Mouse angle: " + nf(mouseAngle, 1, 4) +
//        ", chord angle: " + nf(angle, 1, 4) + ", nearAngle: " + nf(_angleClose, 1, 4));

    // Near the discontinuity (0, TWO_PI) in the angular values
    if ( (mouseAngle < _angleClose) && (angle > (TWO_PI - _angleClose)) ) {
      return true;
    }

    float angleDiff = angle - mouseAngle;
    // return abs(angleDiff) < _angleClose;
    if ( abs(angleDiff) < _angleClose ) {
      return true;
    }
    
    return false;
  }

  boolean isMouseInSelectionRange(float distFromCenter) {
    return ((distFromCenter > _innerMouseOverRadius) &&
        (distFromCenter < _outerMouseOverRadius));
  }

  /**
   * Return the angle (in radians) of the mouse point relative to
   * the center of the chart.  Angles start clockwise from the
   * positive X axis.
   */
  float getMouseAngle() {
    float distFromCenter = dist(_xc, _yc, mouseX, mouseY);
    if ( ! isMouseInSelectionRange(distFromCenter) ) return -1.0;

    // Using arc cosine give x and hypotenuse (dist from center)
    float angle = acos((mouseX - _xc) / distFromCenter);

    // Reverse the angle if it's greater than PI (upper half of the circle
    // if drawing counterclockwise from right).
    //
    // This takes into account the y component of the mouse position: the
    // arccosine function only accounts for the x component.
    //
    if ( (mouseY - _yc) < 0 ) angle = TWO_PI - angle;

    return angle;
  }
}

/**
 * ColorLegend: draw a table of colors
 *
 * Bruce Wilson, 5/15/2013
 */

// TODO: allow -x, -y to position relative to corners of the window

class ColorLegend {
  int _x;
  int _y;
  int _width;
  int _height;
  int _rectWidth;
  int _rectHeight;
  int _padding = 5;
  
  float _startValue;
  float _endValue;
  
  color[] _colors;
  
  ColorLegend(int x, int y, int wid, int hght, float startValue, float endValue, color[] colors) {
    _x = x;  _y = y;
    _width = wid;  _height = hght;
    _rectWidth = _width / 3;
    _rectHeight = (_height - _padding * colors.length - _padding) / colors.length;
    
    _startValue = startValue;
    _endValue = endValue;
    
    _colors = colors;
  }
  
  void draw() {
    pushStyle();

    // Background of legend box
//    fill(60, 60, 60, 200);
//    rect(_x, _y, _width, _height, 5);
    
    textAlign(LEFT, TOP);
    textSize(14);
    
    // Color swatches
    int x = _x + _padding; 
    for ( int i = _colors.length - 1; i >= 0; i-- ) {
      int y = _y + _height - (i + 1) * (_rectHeight + _padding);
      fill(_colors[i]);
      rect(x, y, _rectWidth, _rectHeight);
      
      fill(40);
      int value = (int)map(i, 0, _colors.length - 1, _startValue, _endValue);
      text(value, x + _padding + _rectWidth, y);
    }

    popStyle();
  }
}



