
private BinaryRGBSquares RGBImage;
private int scale = 20;
private int xOrig;

public PImage colourSquare;
public PImage writing;
public int imageSize = 500;
public color pixelColour[]; 
private int i = 0;
private int j = 0;
private int k = 0;
private int smoothing = 1;


public void setup() {

  size(500, 354);
  noStroke();
  loadPixels();
  loadColourSquare();
  getImagePixelColour();
  writing = loadImage("thebizzle500.png");
  //RGBImage = new BinaryRGBSquares((width/2)-(scale*2), height/2, scale);
}

public void draw() {
  setRectangleColour();
  image(writing, 0, 0); 
  //RGBImage.setRGBposAndCol(int(red(pixelColour[k])), int(green(pixelColour[k])), int(blue(pixelColour[k])));
  //RGBImage.update();
  System.out.println("pixel number: " +k);
}

public void loadColourSquare() {

  colourSquare = loadImage("back_colour500.jpg");
  image(colourSquare, 0, 0);
}

public void loadWriting() {
 
 writing = loadImage("thebizzle500.png");
 image(writing, 0, 0); 
}

public void getImagePixelColour() {

  pixelColour = new color[width*imageSize];

  
    for (int yCol = 0; yCol < imageSize; yCol++) { 
      if(yCol % 2 == 0){
        for (int xCol = 1; xCol < width-smoothing; xCol++){
        i = (i+1) % pixelColour.length;
        pixelColour[i] = get(xCol, yCol);
      } 
      }
      else{
        for(int xCol = width-smoothing; xCol > 0; xCol--) {
        i = (i+1) % pixelColour.length;
        pixelColour[i] = get(xCol, yCol);
        }
      }
    }
}

public void setRectangleColour() {

  k = k+1 % pixelColour.length;
  fill(pixelColour[k]);
  noStroke();
  rect(0, 0, width, height);
 // delay(100);
}


