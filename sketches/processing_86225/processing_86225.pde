
//This program fulls screen with colorful big rectangles.
// usage of function is	....rect(x, y, width, height)

size(900, 700);
background(0);

//horizontalGapDistance is the distance between left and right edges of rectangles
  int horizontalGapBetweenRects = 25;
//verticalGapDistance is the distance between top and bottom edges of rectangles
  int verticalGapBetweenRects = 25;

//Coordinates of the first rectangle's upper Left corner
  int startXCoor = 0;
  int startYCoor = 0; 
//Size of the rectangles   
  int rectWidth = horizontalGapBetweenRects;
  int rectHeight = verticalGapBetweenRects;

//Draw the rectangles on screen
for (int x = startXCoor; x < width; x = x +horizontalGapBetweenRects) {
  for (int y = startYCoor; y < height; y = y +verticalGapBetweenRects) {
    point(x, y);
    fill(random(256));
    rect(x , y, rectWidth, rectHeight);
  }
}

//image will automatically be saved in the same folder with the name rect.png
save("rect.png");


