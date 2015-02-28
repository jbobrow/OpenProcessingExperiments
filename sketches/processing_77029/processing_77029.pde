
int RectX = 50; //constant x position for progress bar
int RectY = 50; //constant y position for progress bar
int iWidth = 500; //max width for progress bar
int iHeight = 50; //height of progress bar
float initiallevel = 1; //initial value of integer level
float level = initiallevel; //integer to record progress
int Max = 100; //max value that level can take 
float initialn = 2.55; //initial colour value
float n = initialn; //changing colour value
float pos; //width of progress bar
String s; //text to display the progress onscreen
void setup() {
  size(600, 150); //sets size of the display
  background(1); //black background
}

void draw() {
  background(1); //clear screen by setting bg to original value
  if (level >= Max) { //if level is or greater than Max
    n=initialn; //reset n to its initial value
    level = 1; //reset level to its initial value
  }
  if (level < Max) { //if level is less than Max
    level++; //increment level by 1 each time
    n=n+initialn; //increment n by its original value
  }
  pos = (iWidth/Max)*level; //take the original and share it by the max value level can take before multiplying it by level to get a width value
  s = "Progress: " + pos/5; //string detailing the progress
  fill(255); //white
  text(s, 50, 40); //writes text to the screen using string s
  rect(RectX, RectY, iWidth, iHeight); //background bar of progress bar
  fill(0, n, 0); //constantly changing shade based on progress
  rect(RectX, RectY, pos, iHeight); //pos is used to display the progress
}



