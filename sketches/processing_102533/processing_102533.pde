
PImage img; //this will be the base image for the sketch
int maxDivs; //this will define the maximum amount of vertical and horizontal divisions
int[] xdiv = new int[2]; //this will store the actual position of the horizontal divisions
int[] ydiv = new int[2]; //this will store the positions of the vertical divisions
ArrayList<SuperPixel> spixels = new ArrayList<SuperPixel>(); //this will store the rectangles(SuperPixels)which will end up painting the sketch

void setup(){
  size(612, 612);
  maxDivs = 60;
  //the first and last divisions are defined by the size of the sketch
  xdiv[0] = 0;
  xdiv[1] = width;
  ydiv[0] = 0;
  ydiv[1] = height;
  //the first SuperPixel is a rectangle with the same size of the sketch
  spixels.add(new SuperPixel(xdiv[0], ydiv[0], xdiv[1], ydiv[1]));
  img = loadImage("test.jpg");
  noStroke();
}

void draw(){
//if the amount of divisions is less than maxDivs we add a new random division
  if(xdiv.length<maxDivs){
    addNewDiv((int)random(width), (int)random(height));
  }else if(xdiv.length>maxDivs){//if the amount is higher we remove one division
    xdiv[xdiv.length-2] = width;
    xdiv = shorten(xdiv);
    ydiv[ydiv.length-2] = height;
    ydiv = shorten(ydiv);
  }
  //at every frame we randomize all the division so they are different in every frame
  xdiv = RandomizeDiv(xdiv, width);
  ydiv = RandomizeDiv(ydiv, height);
  //update all the superpixels so they correspond to the new divisions
  spixels = updateSuperPixels(spixels, xdiv, ydiv, img);
  //paint all SuperPixels
  for(SuperPixel  sp : spixels){
    sp.paint();
  }
}
//You can us the keys + and - to increase or decrease the amount of divisions
void keyPressed(){
  if(key == '+'){
    maxDivs++;
  }else if(key == '-'){
    maxDivs--;
  }
  maxDivs = constrain(maxDivs, 3, 200);
  println(maxDivs);
}
//Here we define the class SuperPixel which will store the coordinates of a rectangle with its correspondent color, also include the paint function which paints the rectangle in the sketch
class SuperPixel{
  int x0, y0, x1, y1;
  color col;
  //constructor with only coordinates
  SuperPixel(int _x0, int _y0, int _x1, int _y1){
    x0 = _x0;
    y0 = _y0;
    x1 = _x1;
    y1 = _y1;
    col = color(0);
  }
  //constructor with coordinates and color
  SuperPixel(int _x0, int _y0, int _x1, int _y1, color _col){
    x0 = _x0;
    y0 = _y0;
    x1 = _x1;
    y1 = _y1;
    col = _col;
  }
  //function for painting the superpixel
  void paint(){
    pushStyle();
    fill(col);
    noStroke();
    //you can comment "rect(..." and uncomment "/*ellipsMode(..." to make the sketch with circles
    rect(x0, y0, x1-x0, y1-y0);
    /*ellipseMode(CORNER);
    int elW = x1-x0;
    for(int i = y0; i<y1-elW; i+=elW){
      ellipse(x0, i, elW, elW);
    }*/
    popStyle();
  }
}
//this function is for updating all the super pixels with the color information of the base image(test.jpg)
ArrayList updateSuperPixels(ArrayList<SuperPixel> _spx, int[] _xdiv, int[] _ydiv, PImage _img){
  _spx = new ArrayList<SuperPixel>();
  //loop through all the divisions to create the superpixels
  for(int i=1; i<_xdiv.length; i++){
    for(int j=1; j<_ydiv.length; j++){
      int x0 = _xdiv[i-1];
      int y0 = _ydiv[j-1];
      int x1 = _xdiv[i];
      int y1 = _ydiv[j];
      int dw = x1 - x0;
      int dh = y1 - y0;
      //create an image with the part of the image corresponding to the superpixel area
      PImage currImg = createImage(dw, dh, RGB);
      currImg.copy(_img, x0, y0, dw, dh, 0, 0, dw, dh);
      color currCol = color(getMeanColor(currImg));
      //create and add a new superpixel
      SuperPixel currSPix = new SuperPixel( x0, y0, x1, y1, currCol);
      _spx.add(currSPix);
    }
  }
  //the following will join vertically superpixels that have a similar color
  int threshold = 70;//this value tells the similarity between to superpixels color
  for(int i = _spx.size()-1; i >= 0; i--){
    SuperPixel sp = _spx.get(i);
    for(int j = _spx.size()-1; j > i; j--){
      SuperPixel spt = _spx.get(j);
      if(sp.y1 == spt.y0 && sp.x0 == spt.x0 && sp.x1 == spt.x1){
      //if the difference between the 2 superpixels colors is less than the threshold, then attach both superpixels
        if(colorDifference(sp.col, spt.col) < threshold){
        //this evaluates the relative areas of the 2 superpixels
          int areasp = (sp.x1-sp.x0)*(sp.y1-sp.y0);
          int areatotal = (spt.x1-spt.x0)*(spt.y1-spt.y0) + areasp;
          float areaRel = areasp*1.0/areatotal;
          //this defines the final color depending on the areas
          sp.col = lerpColor(sp.col, spt.col, areaRel);
          //make the alpha of the color 25 so it semitransparent
          sp.col = color(red(sp.col),green(sp.col), blue(sp.col), 25);
          //make the first (sp) superpixel's bottom part the same as the second (spt)
          sp.y1 = spt.y1;
          //remove the second superpixel (spt)
          _spx.remove(j);
        }
      }
    }
  }
  return _spx;
}
//this function randomize all the value of an int array, sort them and remove any repeated value
int[] RandomizeDiv(int[] _div, int _range){
  for(int i = 0; i<_div.length; i++){
    _div[i] = (int)random(_range);
  }
  _div = sort(_div);
  for(int i = _div.length-1; i>0; i--){
    if(_div[i] == _div[i-1]){
      _div = removeIndex(_div, i);
    }
  }
  _div = sort(_div);
  return _div;
}
//this function removes an specific element of an int array
int[] removeIndex(int[] _array, int _index){
  if(_array.length > 1){
    int _val = _array[_array.length-1];
    _array[_index] = _val;
    _array = shorten(_array);
  }
  return _array;
}
//this is the function to add a new  div value to the arrays, checking that no value repeats
void addNewDiv(int _x, int _y){
  boolean isXunique = true;
  for(int i : xdiv){
    if(i==_x){
      isXunique = false;
    }
  }
  if(isXunique){
    xdiv = append(xdiv, _x);
    xdiv = sort(xdiv);
  }
  boolean isYunique = true;
  for(int i : ydiv){
    if(i==_y){
      isYunique = false;
    }
  }
  if(isYunique){
    ydiv = append(ydiv, _y);
    ydiv = sort(ydiv);
  }
}
//this function returns the mean color of an image
color getMeanColor(PImage _img){
  _img.loadPixels();
  int r = 0;
  int g = 0;
  int b = 0;
  for(int i = 0; i<_img.pixels.length; i++){
    r += red(_img.pixels[i]);
    g += green(_img.pixels[i]);
    b += green(_img.pixels[i]);
  }
  r = r/_img.pixels.length;
  g = g/_img.pixels.length;
  b = b/_img.pixels.length;
  return color(r,g,b);
}
//this function compares every channel of 2 colors and returns a value which represents its difference
int colorDifference(color c1, color c2){
  int dr = (int) abs(red(c1) - red(c2));
  int dg = (int) abs(green(c1) - green(c2));
  int db = (int) abs(blue(c1) - blue(c2));
  return (dr + dg + db);
}


