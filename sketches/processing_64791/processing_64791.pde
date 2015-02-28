
public class BinaryRGBSquares {

  private int value;
  public int redValue;
  public int greenValue;
  public int blueValue;
  public int imageSize = 600;
  private int origX;
  private int origY;
  private int xCol;
  private int yCol;
  private float scale;
  private int redCol;
  private int greenCol;
  private int blueCol;
  public color origRGB[] = new color[width*imageSize];
  private int RGBsquares = 3;
  private BinarySquare[] squares;

  public BinaryRGBSquares(int _origX, int _origY, float _scale, int _value) {
    
    origX = _origX;
    origY = _origY;
    scale = _scale;
    value = _value;
    init();
  }

  public BinaryRGBSquares(int _origX, int _origY, float _scale) {

    origX = _origX;
    origY = _origY;
    scale = _scale;
    init();

  }

  private void init() {

    squares = new BinarySquare[RGBsquares];

    for (int i = 0; i < RGBsquares; i++) {

        squares[i] = new BinarySquare(origX, origY, scale, value, redCol, greenCol, blueCol);
    }
  }

  public void setRGBposAndCol(int redCol,int greenCol,int blueCol) {
    
    for (int j = 0; j < squares.length; j++) {
      
      if (j == 0) {
        squares[j] = new BinarySquare(origX, origY, scale, redCol, redCol, greenCol, blueCol );
      }
      else if (j == 1) {
        squares[j] = new BinarySquare(origX + (scale*2), origY, scale, greenCol, redCol, greenCol, blueCol );
    }
      else if (j == 2) {
        squares[j] = new BinarySquare(origX + (scale*4), origY, scale, blueCol, redCol, greenCol, blueCol );
    }
    }
  }
  
  public void update() {
    for (int i = 0; i < squares.length; i++) {
      squares[i].update();
    }
  }
  public void update(int _value) {
    if (_value != value) {
      value = _value;
      destroy();
      init();
    }
    for (int j = 0; j < squares.length; j++) {
      squares[j].update();
    }
  }

  private void destroy() {
    for (int k = 0; k < squares.length; k++) {
      squares[k] = null;
    }
  }
}


