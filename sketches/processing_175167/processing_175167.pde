
private TextBox input, output;

private final float CHAR_WIDTH = 11 * 0.63573;
private final float ROW_HEIGHT = 11 * 1.282;

private final int BUFFER_Y = 50;
private final int BUFFER_X = 50;

private final color DEFAULT = color(0);
private final color WARNING = color(200, 200, 0);
private final color ERROR = color(255, 0, 0);

boolean controlPressed;

public void setup() {
  size(950, 600);
  textFont(loadFont("Courier-11.vlw"));

  input = new TextBox();
  output = new TextBox();

  input.canEdit = true; 
  input.resize(2 * (int)(width-BUFFER_X)/5, (int)height-BUFFER_Y);

  output.resize(3 * (int)(width-BUFFER_X)/5, (int)height-BUFFER_Y);
  output.posX += 5 + input.width;
}

public void keyPressed() {
  if (key == 3 || (controlPressed && 
    (key == 'c' || key == 'C'))) {
    Utilities.copy(input.text);
    return;
  }

  if (key == 4 || (controlPressed && 
    (key == 'd' || key == 'D'))) {
    input.clear();
    return;
  }

  if (key == 24 || (controlPressed && 
    (key == 'x' || key == 'X'))) {
    Utilities.copy(input.text);
    input.clear();
    return;
  }

  if (key == 22 || (controlPressed && 
    (key == 'v' || key == 'V'))) {
    String toPaste = Utilities.paste();
    if (toPaste != null) {
        input.append(toPaste);
    }
    return;
  }




  if (key == CODED) {
    switch(keyCode) {
    case LEFT:
      input.moveLeft();
      break;
    case RIGHT:
      input.moveRight();
      break;
    case DOWN:
      input.moveDown();
      break;
    case UP:
      input.moveUp();
      break;

    case CONTROL:
    case 524:
      controlPressed = true;
      break;
    }
  } else {
    switch(key) {
    case 8:
      input.delete();
      break;

    default:
      input.append(key);
    }
  }
}

public void keyReleased() {
  if (key == CODED) {
    switch(keyCode) {
    case CONTROL:
    case 524:
      controlPressed = false;
      break;
    }
  }
}

public void draw() {
  background(255);

  fill(0);
  text("Input Expression: ", 12, 11);

  String inputClean = Utilities.removeComments(input.text);
  output.text = Parser.getExpression(inputClean).toString();

  // Set the default Color
  output.textColor = DEFAULT;

  if (output.text.startsWith("Warning:"))
    output.textColor = WARNING;

  if (output.text.startsWith("Error:"))
    output.textColor = ERROR;

  // Display the two text fields
  input.display();
  output.display();
}


