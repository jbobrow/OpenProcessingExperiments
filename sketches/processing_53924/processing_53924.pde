
PImage bg;
PFont font;
int x,y,counter=0,counter1 = 0,loc,s=1,dX,dY,wlength=1,fade=10;
int drawMode = 1;
color c;
boolean showbg = false;
String inputText = "You can't sit with us.";
char [] letter = new char [inputText.length()];
String [] word = splitTokens(inputText);

void setup() {
  size(800,600);
  bg = loadImage("void0.jpeg");
  background(bg);
  smooth();
   
  for(int i=0; i<inputText.length()-1;i++){
    letter [i] = inputText.charAt(i);
  }
 
}
 
void draw(){

}
 
 
void mouseMoved(){
  dX=mouseX-pmouseX;
  dY=mouseY-pmouseY;
  s = (int)sqrt(dX*dX+dY*dY);
    font = createFont("Georgia-Italic",1+s);
 
    loc = mouseX+mouseY*bg.width;
     
    loadPixels();
    float r = red(bg.pixels[loc]);
    float g = green(bg.pixels[loc]);
    float b = blue(bg.pixels[loc]);
     
    fill(250,random(78),random(219));
   
    textFont(font);
    x=mouseX;
    y=mouseY;
     
    switch(drawMode) {
    case 1:
      int i = 0;
      text(letter[counter], x+i*textWidth(letter[counter]), y);
      counter++;
      i++;
      break;
    case 2:
      text(word[counter1], x, y);
      counter1++;
      break;
    }
     
   if(counter>inputText.length()-5) counter =0; 
   if(counter1>word.length-1) counter1 =0; 
    
  
}
 
void keyPressed(){
  if (key == 's' || key == 'S') saveFrame("road_##.png");

  if(keyCode == ENTER){
    showbg = !showbg;
    if(showbg){
      background(bg);
    }else{
      background(bg);
    } 
  }
   
  if (key == '1'){
    drawMode = 1;
    println("case 1");
  }
  if (key == '2'){
   drawMode = 2;
   println("case 2");
  }
  if (keyCode == UP){
    fade++;
    println("fade: " + fade);
  }
  if (keyCode == DOWN){
    fade--;
    println("fade: " +fade);
  }
}


