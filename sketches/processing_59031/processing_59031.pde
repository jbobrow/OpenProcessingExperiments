

String[] options = {"First","Second","Third", "Fourth", "Fifth"}; 
boolean[] results;
ADCheck radioButton;
int radio;


PFont output; 

void setup()
{
  size(300,300);
  smooth();
  output = createFont("Arial",24,true);  

  radioButton = new ADCheck(111, 67, options, "radioButton"); 
  radioButton.setDebugOn();
  radioButton.setBoxFillColor(#F7ECD4);  

  results = new boolean[radioButton.length()];

}

void draw()
{
  background(#FFFFFF);

  radioButton.update();
  results=radioButton.getValues();
  
  textFont(output,24);   
  text(options[radioButton.getLastPicked()], (width-textWidth(options[radioButton.getLastPicked()]))/2, height-20);


}


