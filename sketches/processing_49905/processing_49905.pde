
public class DropDownMenu {

  private int selection = 0;
  private Object[] data;
  private boolean ellapsed = false;
  private final color boxColour = color(122, 122, 122);
  private final color textColour = color(220);
  private final int boxWidth = 150;
  private final int boxHeight = 30;
  private int x, y;
  private PFont currentFont;
  private int typoOffset = 20;
  private int fontSize = 16; // pt
  private int centerFontSize = 300;
  
  public DropDownMenu(Object[] data, int x, int y) {
    this.data = data;
    this.x = x;
    this.y = y;
    println(data.length);
    setPreviewFont();
  }

  void displayDropDownMenu() {
    textAlign(BASELINE);
    if (ellapsed) {
      renderBox(data[selection].toString(),1);
      renderTriangle();
      
      int stage = 2;
      for (Object o : data) {
        renderBox(o.toString() , stage++);
      }
      
    } else {
      renderBox(data[selection].toString(),1);
      renderTriangle();
    }
  }

  public void renderTriangle(){
    
    fill(110);
    triangle(x+boxWidth-30,y+6,x+boxWidth-17,y+boxHeight-6,x+boxWidth-5,y+6);
    fill(textColour);
  }
  
  public void renderBox(String label, int stage) {
    rectMode(CORNER);
    int yLevel = stage == 1 ? y : (boxHeight * stage);
    
    fill(boxColour);
    rect(x, yLevel , boxWidth, boxHeight);
    
    fill(textColour);
    textFont(currentFont);
    text(label, x+10, yLevel + typoOffset); 
  }

  public boolean contains(int px, int py) {
    if (px <= x + boxWidth && px > x && py <= y + boxHeight+10 && py > y) {
      return true;
    }

    return false;
  }
  
  public int getProbableStage(int px, int py){
    if(px >= x && px <= x + boxWidth && py >= y && py <= (data.length * boxHeight)+y+30){
      
      int probableStage = (int) floor( (py - (y+boxHeight+10)) / boxHeight );
          
      return probableStage;

    }
   
   return -1; 
   
  }
  
  public void setPreviewFont(){
    currentFont = createFont(String.valueOf(data[selection]),fontSize);
  }
  
  public int getIndexOfSelection(){
    return selection;
  }
  
  public PFont getSelection(){
    return createFont(data[selection].toString(),centerFontSize,true);
  }
  
  public void setSelectionIndex(int arg0){
    selection = arg0;
  }
  
  public void adjustFontSize(int delta){
    centerFontSize = centerFontSize + delta > 0 ? centerFontSize + delta : 1;
    
  }
  
}


