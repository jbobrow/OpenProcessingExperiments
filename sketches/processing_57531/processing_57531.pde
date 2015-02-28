
import controlP5.*;
PFont font;
PrintWriter output;
PImage canvas;
int ascii;
String letter = "y";
String[] pov;
int[] povnums;
int arraynum = 1;
String pointerarray = "";
String povnumsarray = "";
int fontsize = 16;
String fontname = "Arial Bold";
int margin = 2;
boolean savebitimage = false;
boolean saveintegerarray = true;
ControlP5 controlP5;
ListBox l;
Button b;
int cnt = 0;
String[] fontList = PFont.list();
boolean savefilebool = false;
int letterheight = 16;

void setup(){
  size(500,280);
  controlP5 = new ControlP5(this);
  controlP5.addToggle("save_bits",false,390,210,20,20);
  controlP5.addToggle("save_ints",true,450,210,20,20);
  controlP5.addButton("Save_File",0,390,180,80,20);
  Numberbox m = controlP5.addNumberbox("pov_pixel_height",16,390,60,80,20);
  m.setMultiplier(0.1);
  Numberbox o = controlP5.addNumberbox("Font_Size",16,390,100,80,20);
  o.setMultiplier(0.1);
  Numberbox n = controlP5.addNumberbox("Adjust_Margin",2,390,140,80,20);
  n.setMultiplier(0.1);
  
  
  l = controlP5.addListBox("myList",200,80,150,170);
  l.setItemHeight(15);
  l.setBarHeight(20);
  
  l.captionLabel().set("Installed Fonts");
  l.captionLabel().style().marginTop = 3;
  
    for(int i=0;i<fontList.length;i++) {
    l.addItem(fontList[i],i);
      }
  
  updatefont();
  output = createWriter("E:/TestStuff/td1.txt"); 
  output.println("// arrays starts from ascii char 32");
  fill(0);
  stroke(0);
}

void draw(){
  background(20,20,40);
  fill(255);
  rect(15,5,25,25);
    if (savefilebool == true)
    {
    letter = (char(ascii)+"");
    }  
  fill(0);
  text(letter,20,20);
  fill(60,60,100);
  rect(60,20-letterheight+margin,435,letterheight);
  rect(60,40-letterheight+margin,435,letterheight);  
  fill(0);
  text("the quick brown fox jumped over the lazy dog", 60, 20);
  text("THE QUICK BROWN FOX JUMPED OVER THE LAZY DOG", 60, 40);
  if (savefilebool == true)
    {
     savefile();
    }  
  drawbig();  
}


void drawbig(){
  int letterwidth = int(textWidth(letter));
  //fill(255);
  //(20,240-(letterheight*10),letterwidth*10,letterheight*10);
  for (int i = 0; i<letterwidth; i++){  
    for (int j = 0; j<letterheight; j++){
      color pixelcol=get(20+i, ((20+margin)-j)); //you may need to change the 22 as the font dips below the base line for descenders      
      fill(pixelcol);
      stroke(0);
      rect (20+(i*10),230-(j*10),10,10);
    }
  }
}

void keyPressed() {
      letter = ""+key;
  }
  
void savefile(){
  if (ascii < 127){
    int letterwidth = int(textWidth(letter));
    String[] pov = new String[letterwidth];
    int[] povnums = new int[letterwidth];  
    for (int i = 0; i<letterwidth; i++){  
      String povline = ""; //line of 0s and 1s
      for (int j = 0; j<letterheight; j++){
        color pixelcol=get(20+i, ((20+margin)-j)); //you may need to change the 22 as the font dips below the base line for descenders
        if (int(brightness(pixelcol)) > 150){
            povline = povline+"0";
          }
        else{
           povline = povline+"1"; 
          }
        }
    pov[i] = "{"+povline+"}";
    povnums[i] = unbinary(povline);
    arraynum = i;
    }
   
   if (savebitimage == true){
   output.println("{");
   for (int i = 0; i<pov.length; i++){output.println(pov[i]);}; // prints binary display
   output.println("}");
   output.println("// '"+letter+"' ascii char "+ascii);  
   output.println(); 
   }
   
   if (saveintegerarray == true){
   output.print("PROGMEM prog_uint16_t char" + ascii + "["+(arraynum+1)+"] = {" +povnums[0]);
   for (int i = 1; i<pov.length; i++){output.print(", "+povnums[i]);};
   output.println(" }; // '"+letter+"' ascii char "+ascii);
   pointerarray = pointerarray+", char"+ascii;
   }
   povnumsarray = povnumsarray+", "+(arraynum+1);
   println(ascii);
   ascii++;
  }
  else{
  output.println("prog_uint16_t* charArray[] = {"+pointerarray+"};");
  output.println("byte* ArraySize[] = {"+povnumsarray+"};");
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  open("C:/povarrays.txt");
  savefilebool = false;
  }
}
  
void updatefont(){
  font = createFont(fontname,fontsize,false);
  textFont(font);
}

void controlEvent(ControlEvent theEvent) {
  
  if (theEvent.isGroup()) {
    fontname = fontList[int(theEvent.group().value())];
    updatefont();
  }
}

public void Save_File(int theValue){
 ascii = 32;
 savefilebool = true;
}

void Font_Size(int Fontsize) {
  if (Fontsize != fontsize){
  fontsize = Fontsize;
  updatefont();
  }
}

void Adjust_Margin(int Margin) {
  if (Margin != margin){
    margin = Margin;  
  }
}

void pov_pixel_height(int pixelheight) {
  if (letterheight != pixelheight){
    letterheight = pixelheight;  
  }
}

void save_bits(boolean theFlag) {
  if(theFlag==true) {
    savebitimage = true;
  } else {
    savebitimage = false;
  }
}

void save_ints(boolean theFlag) {
  if(theFlag==true) {
    saveintegerarray = true;
  } else {
    saveintegerarray = false;
  }
}

