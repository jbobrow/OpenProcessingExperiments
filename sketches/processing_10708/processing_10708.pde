
class GraphPaper { 

int blockWidth; // how many pixels are the blocks?
color lineColor; //what color are the lines?
int transparency; 
  // The Constructor is defined with arguments.
  // SacredCircle [objName] = new SacredCircle(floatXpos, floatYpos, floatRadius, colorFill, colorStroke);
  GraphPaper (int conblockWidth, color conLineColor, int conTransparency) { 
    blockWidth = conblockWidth;
    lineColor = conLineColor;
    transparency = conTransparency;
  }  //end constructor

  void drawSheet() {  
    stroke(lineColor, transparency);
    for( int i = 0; i<= width; i = i + blockWidth){
          for( int j = 0; j<= height; j = j + blockWidth){
            line(i, j, width, j);
            line(i, j, i, height);
          }  
    }  
    
  } //end drawSheet


} // end class

