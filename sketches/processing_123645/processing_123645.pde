
//Eurydice
 
int rows = 34;
int cols = 42;
int cellsize = 20;
int border = int(cellsize*2.5);
color bg_color = color(239);
color cell_stroke_color = color(255);
color cell_color = color(255, 255, 255, 32);

 
int w = cols*cellsize + 2*border;
int h = rows*cellsize + 2*border;

float tSize = 45;
Text[] Literature;
int numberLiterature=0;
int pos = -1;
String[] vocab = { "Can't","wait","to", "be", "sprung", "from",
"the", "shadow", "to", "be", "known", "from", "a",
"hole", "in", "the", "ground", "Scarcely", "silent", "though", "often",
"unheard", "Winding", "wound", "Wounded", "wind", "She","turned","and", "turns", "She", "opens",
"Keep", "the", "keys", "that", "devil", "told", "her",
"Guess", "the", "the", "question", "Dream", "the", "answer", "Tore",
"down", "almost", "level", "A", "silence", "hardly","likely", "Juicy", "Pour", "them",
"the", "shadow", "to", "be", "known", "from", "a",
"on", "Music", "sways", "her", "she", "concedes", "as", "darker", "she", "goes", "deeper"};
String randomText = voca[0];
int textColor = 0;
 
 
void setup() {
   size(800, 800);
   //PImage fence = loadImage("fence.jpg");
   background(255);
   textSize(tSize);
   Literature = new Text[45];
   smooth();
 }
     
 void draw() {
   draw_grid(true);
   background(255);
   fill(textColor);
   textSize(tSize);
   text(randomText, mouseX, mouseY);
   if(tSize>=0) tSize=tSize-0.5;
   
   /*for(int i=0; i<numberLiterature; i++){
     Literature[i].draw();
   }*/
 }
     
void mouseMoved(){
  if(tSize<45) tSize=tSize+35;
}
 
void mousePressed(){
  if (numberLiterature<45) {
    pos++;
    Literature[numberLiterature]=new Text(randomText,mouseX,mouseY,tSize,textColor);
    randomText = vocab[pos];
    numberLiterature++;
    textColor=int(random(200, 230));
    fill(textColor);
  }
}
 
class Text{
int x, y, tcolor;
String text;
float z;
 
Text(String ntext, int xpos, int ypos, float zpos, int colour){
  text = ntext;
  x = xpos;
  y = ypos;
  z = zpos;
  tcolor = colour;
}
 
void draw(){
  fill(88);
  textSize(z);
  text(text, x, y);
}
}




void draw_grid(boolean is_opaque) {
  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      draw_cell(row, col, is_opaque);
    }
  }
}
 
void draw_cell(int row, int col, boolean is_opaque) {
  //stroke(cell_stroke_color);
  noStroke();
  if (is_opaque) {
    fill(get_opaque(cell_color));
  } else {
    fill(cell_color);
  }
 
  int cellx = col*cellsize + border;
  int celly = row*cellsize + border;
  float margin = cellsize/8.0;
  pushMatrix();
  translate(cellx, celly);
  rect(margin, margin, cellsize-2*margin, cellsize-2*margin);
  popMatrix();
}
 
color get_opaque(color c) {
  /* returns color equivalent to c except with an alpha value of 255 */
  return color(red(c), green(c), blue(c));
}

