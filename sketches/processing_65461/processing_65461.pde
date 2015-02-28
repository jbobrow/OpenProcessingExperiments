
/* GraphLayout
This class is the responsible of producing the graphical output of a recursive data 
structure represented by its parent node.
*/

interface GraphLayout {
  
  //A visitor method to set node positions, arranging nodes properly over a canvas
  void sortChildren (Node root);
  //A method to display the information 
  void display      (Node root);  

}

/* ClassicLayout
The exact output I wanted here.
TODO: create an abstract class to be extended by this one
*/

class BudgetsLayout implements GraphLayout {
  
  
  PGraphics 
  theCanvas;
  
  PFont 
  titlesFont, 
  textsFont;
  
  PVector 
  titlePosition,
  mainCaptionPosition,
  nodeNamePosition,
  nodeCaptionPosition;
  
  float
  parentX, 
  parentY,
  height,
  margin,
  horOffset,
  offsetFactor=1f,
  scaleF,
  tightness= 0;
  
  int             //default values
  backgroundColor   = -1,
  linkColor         = 0x90000000,
  nodeColor         = -1,
  selectedLinkColor = 0x900055ff,
  selectedNodeColor = 0x900055ff,
  selectedIndex     = -1;
  
  String 
  title,
  caption,
  selected_N, 
  selected_C;
  
  /*Constructor
  */
  
  BudgetsLayout (PGraphics theCanvas, float parentX, float parentY, float margin, float horOffset, float tightness) {
    this.theCanvas      = theCanvas;
    this.parentX        = parentX;
    this.parentY        = parentY;
    this.height         = height;
    this.margin         = margin;
    this.horOffset      = horOffset;
    this.tightness      = tightness;
    titlesFont          = new PFont();
    textsFont           = new PFont();
    titlePosition       = new PVector();
    mainCaptionPosition = new PVector();
    nodeNamePosition    = new PVector();
    nodeCaptionPosition = new PVector();
    title               = "";
    caption             = "";
    selected_N          = ""; 
    selected_C          = "";
    graphicalSetup (theCanvas);
  }
  
  /*
  Setters
  */
   
  //To set the color of the selected links 
  void setSelectedColor (int newColor) { 
    selectedLinkColor = newColor; 
  } 
   
  //To set the color of the unselected links 
  void setLinkColor (int newColor) { 
    linkColor = newColor; 
  }
  
  //To set a bold font
  void setTitleFont (String fontName){
    titlesFont = loadFont (fontName);
  }
  
  //To set a regular font
  void setTextsFont (String fontName){
    textsFont = loadFont (fontName);
  }
  
  //To set the title of the chart
  void setTitle (String newTitle){
    title = newTitle; 
  }
  
  //To set the main caption of the chart
  void setMainCaption (String newCaption){
    caption = newCaption; 
  }
  
  //To set the position of the main title
  void setTitlePosition (float x, float y){
    titlePosition.x = x;
    titlePosition.y = y;
  } 
  
  //To set the position of the main caption
  void setMainCaptionPosition (float x, float y){
    mainCaptionPosition.x = x;
    mainCaptionPosition.y = y;
  }
  
  //To set the position of the selected node name
  void setNodeNamePosition (float x, float y){
    nodeNamePosition.x = x;
    nodeNamePosition.y = y;
  }
  
  //To set the position of the selected node caption
  void setNodeCaptionPosition (float x, float y){
    nodeCaptionPosition.x = x;
    nodeCaptionPosition.y = y;
  }
   
  //To set the index of the selected node 
  void setSelectedIndex (int newIndex) {
    selectedIndex = newIndex; 
  } 
  
  //To set the background color
  void setBackgroundColor (int backgroundColor) {
    this.backgroundColor = backgroundColor; 
  } 
  
  //This number multiplies the horizontal distance between columns
  void setOffsetFactor (float offsetFactor){
    this.offsetFactor = offsetFactor; 
  }
   
  //The name of the selected node 
  void setSelected_N (String newN){
    selected_N = newN;
  }
  
  //The caption of the selected node
  void setSelected_C (String newC){
    selected_C = newC;
  } 
   
  /*
  Getters
  */ 
   
  //To get the background color 
  int getBackgroundColor (){
    return backgroundColor; 
  }
  
  //To get the index of the selected node
  int getSelectedIndex () {
    return selectedIndex; 
  }
  
  //To get the chart
  PGraphics getChart () {
    return theCanvas; 
  }
  
  /*
  Display methods
  */
  
  //Common display settings
  void graphicalSetup (PGraphics theCanvas){
    theCanvas.beginDraw ();
    theCanvas.strokeCap (SQUARE);
    theCanvas.smooth ();
    theCanvas.endDraw (); 
  }
  
  //Common display method to avoid opening and closing the canvas edition recursively
  void display (Node node) {
    theCanvas.beginDraw ();
      theCanvas.background (backgroundColor);
      displayLinks  (node);
      displayNodes  (node);
      displayLegend (node);
    theCanvas.endDraw ();     
  }
  
  //Methods to select the colors, useful for write less code in the color picking layout
  int getLinkColor (Node n){
     return  selectedIndex == n.getIndex() ? selectedLinkColor : linkColor;
  }
  
  int getNodeColor (Node n){
     return  selectedIndex == n.getIndex() ? selectedNodeColor : nodeColor;
  }
  
  int getFixedColor (Node n){
     return  nodeColor;
  }
  
  //A recursive method to display the links, starting in the node passed to the method  
  void displayLinks (Node parent) {   
    
    PVector pPos = parent.getPosition(); 
    float f = 0f;
    float A = parent.getWeight(); 
    theCanvas.noFill ();   
   
    //Create links between the node passed and its children
    for (Node child : parent.getChildren ()) {    
      PVector cPos = child.getPosition(); 
      float a = child.getWeight();
      float y = pPos.y + (f) + (a-A)/2; 
      float x = pPos.x;  
      theCanvas.strokeWeight (a);
      theCanvas.stroke ( getLinkColor(child));
      theCanvas.bezier (x, y, x+tightness, y, cPos.x-tightness, cPos.y, cPos.x, cPos.y);      
      f+=a;    
    }
      
    //Let's go recursion
    for (Node child : parent.getChildren ())  displayLinks (child);    
  }
  
  //A recursive method to display the nodes, starting in the node passed to the method  
  void displayNodes (Node parent) {   
    
    //display the node passed
    PVector pPos = parent.getPosition (); 
    float A = parent.getWeight ();
    float AA = A * 1.2;
    theCanvas.fill   (getFixedColor(parent)); 
    theCanvas.stroke (getNodeColor (parent));
    theCanvas.strokeWeight (.75);
    theCanvas.ellipse (pPos.x, pPos.y, A, A);
    theCanvas.noFill ();
    theCanvas.ellipse (pPos.x, pPos.y, AA, AA);
    
    //Let's go recursion
    for (Node child : parent.getChildren ()) displayNodes (child); 
  }
  
  //A method to display all the information besides the chart itself
  void displayLegend (Node node){
    //Title
    theCanvas.stroke (linkColor);
    theCanvas.fill (nodeColor);
    theCanvas.textFont (titlesFont,40);   
    theCanvas.text (title, titlePosition.x, titlePosition.y);
    //Main caption
    theCanvas.textFont (textsFont,36);   
    theCanvas.text (caption, mainCaptionPosition.x, mainCaptionPosition.y);
    //Selected information
    if (selectedIndex>0) {
      theCanvas.fill (selectedLinkColor);
      theCanvas.textFont (titlesFont,36);   
      theCanvas.text (selected_N, nodeNamePosition.x, nodeNamePosition.y);
      theCanvas.textFont (textsFont,30);   
      theCanvas.text (selected_C, nodeCaptionPosition.x,nodeCaptionPosition.y);
    }
  }
  
  /*
  These methods arrange the nodes in our layout
  */
  
  void sortChildren (Node parent) {
    sortChildren (parent, parentX, parentY, margin, theCanvas.height-margin, horOffset); 
  }
  
  void sortChildren (Node parent, float theX, float theY, float initialY, float finalY, float hOffset) {    
    parent.setPosition (theX,theY);
    float heightVessel = initialY;
    for (Node child : parent.getChildren()) {   
        float nodeHeight = (finalY-initialY) * child.getWeight() / parent.getWeight();
        float childX = theX + hOffset;
        float childY = heightVessel + nodeHeight/2;
        sortChildren (child, childX, childY, heightVessel, (heightVessel+nodeHeight), hOffset * offsetFactor);
        heightVessel += nodeHeight;
      } 
  }

 
}




