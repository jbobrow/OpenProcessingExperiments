
PFont font;

float x;
float y;


String txt = "Wo Fuchs und Apfel sich in den Schwanz beißen?";

void setup(){
  size(1000,100);
  font= loadFont("AGaramondPro-Regular-50.vlw");
  textFont(font);
  
}


void draw (){
  background(255);
  fill(0);
 
  

  if (x > width){
    x=0;
  }
else{
    
  textSize(50);
  
    x=x+1;
 

  textLeading(50);
  text(txt, x, y+3, 500,300);
  
  
  }
}
