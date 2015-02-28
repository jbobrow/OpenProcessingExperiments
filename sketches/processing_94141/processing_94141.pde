
import java.util.*;
import java.awt.Color;

PImage mapp;
int xSize;
int ySize;
long[] realMoney = new long[51];
float[] percent = new float[51];
String all = "";
long[] money = new long[51];
String[] state = new String[51];
String[]  raw = new String[51];
ArrayList<Color> colors = new ArrayList<Color>();
long[] numPixels = new long[51];
int totalPixels;
long[] taxReturns = new long[51];

void setup(){
  xSize = 800;
  ySize = 353;
  size(800, 353);
  mapp = loadImage("us_map.png");
  image(mapp, 0, 0);
  raw = loadStrings("datat.txt");
  for(int i = 0; i < raw.length; i++){
    String[] x = raw[i].split(" :");
    state[i] = x[0];
    realMoney[i] = Long.parseLong(x[1].substring(1));
    money[i] = Long.parseLong(x[1].substring(1))/1000;
    taxReturns[i] = Long.parseLong(x[2].substring(1));
  }
  calculateTotalPixels();
  setColors();
  calculatePixels();
  fillImage();
}

void draw(){
 fillImage();
 
 printText();
}

void printText(){
  int index;
  loadPixels();
  color hover = pixels[mouseX+xSize*mouseY];
  index = colors.indexOf(new Color((int)red(hover), (int)green(hover), (int)blue(hover)));
  updatePixels();
 
  text("The size of each state represents its income in comparison to other states", 10, 350);

  if(index!=-1){ 
    text("Name: " + state[index], 550, 320);
    text("Adjusted Gross Income: $"+realMoney[index], 550, 330);
    text("Total Number of Tax Returns: " + taxReturns[index], 550, 340);
  }
}
void setColors(){
  for(int i = 0; i < 51; i++){
    int r = (int)random(254);
    int g = (int)random(254);
    int b = (int)random(254);
    colors.add(new Color(r, g, b));
  }
}

void calculateTotalPixels(){
  int excess = 0;
  loadPixels();
   for(int i = 0; i < pixels.length; i++){
     if(red (mapp.pixels[i]) == 255 || blue(mapp.pixels[i]) == 255 ){
       excess++;
     }
   }
   
   totalPixels = xSize*ySize-excess;
}

void calculatePixels(){
  long total = 0; 
  for(int i = 0; i < 51; i++){
    total = total+money[i];
  }
  for(int i = 0; i < 51; i++){
    double asdf = (double)money[i]/total;
    double ff = (double)totalPixels;
    
    numPixels[i] =(long)(ff*asdf);
  }
}

void fillImage(){
  loadPixels();
  int counter =0;
  int pixelsFilled = 0;
  for(int i = 0; i < pixels.length;i++){
    if(counter<51){
      if(!(red (mapp.pixels[i]) == 255) && blue(mapp.pixels[i]) != 255){
      if(pixelsFilled < numPixels[counter]){
        pixels[i] = color(colors.get(counter).getRed(), colors.get(counter).getGreen(), colors.get(counter).getBlue());
        pixelsFilled++;
      } else{
        counter++;
        pixelsFilled = 0;
      }
      } else{
        pixels[i] = color(0);
      }
    } else{
      counter = 0;
    }
  }
  updatePixels();
}

