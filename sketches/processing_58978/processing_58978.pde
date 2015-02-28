

String[] options = {"First", "Second", "Third", "Fourth"}; 
ADRadio radioButton;
int radio;


PFont output; 

void setup()
{
  size(300,300);
  smooth();
  output = createFont("Arial",24,true);  

  radioButton = new ADRadio(117, 78, options, "radioButton"); 
  radioButton.setDebugOn();
  radioButton.setBoxFillColor(#F7ECD4);  
  radioButton.setValue(1);

}

void draw()
{
  background(#FFFFFF);

  radioButton.update();

  textFont(output,24);   
  text(options[radioButton.getValue()], (width-textWidth(options[radioButton.getValue()]))/2, height-20);

}


