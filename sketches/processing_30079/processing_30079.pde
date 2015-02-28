
PFont myFont;

float t = 0;
int page = 0;
// Uncomment the following two lines to see the available fonts 
String[] fontList = PFont.list();
  
int numfonts = fontList.length;

void setup(){
  size(400, 400);  

}

void draw() {
  
  background(200);
  
  t = t + .01;
  
  
  String fontName = "";

  int yPos = 10;
    
  text("page = " + page, width -200, 10);
  
  for(int i = ( page * 10 ) ; i < ((page * 10) + 10) ; i++){
    pushStyle();
    yPos += 30;  
    
    if(i < numfonts){
      
      fontName = fontList[i];
      myFont = createFont(fontName, 32);
      textFont(myFont);
      text(fontName, 10, 40 + yPos);
      
    }
    popStyle();
    
  }
  
  if(t > 100){
     exit(); 
  }
  
}

void mousePressed(){
 page++; 
}
