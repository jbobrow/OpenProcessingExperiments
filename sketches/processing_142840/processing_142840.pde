
String[] themeArray =
{
  "HAPPY BIRTHDAY DODO!!!"
};
    
void setup()
{
  size(920,160);
  background(230, 200, 150);
    
  PFont font;
  font = createFont("Tahoma", 45);
  textFont(font);
  int index = (int) random(0, themeArray.length);
  fill(160, 30, 40);
  text(themeArray[index], 30, 100);
}


