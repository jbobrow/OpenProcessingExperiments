
int counter = 0;

String myText;
PFont myFont; 



void setup () {
  size (800, 800);
  
  myText = "0123456789";
  
  myFont = loadFont("Courier-12.vlw");
  textFont(myFont, 12);
  
  println(myText);
}


void draw () {
  background(0);
  
  int y =0;
  while(y<height){
    
    
      int x=0;
      while (x<width){
 
        
        fill(17,82,20);
        rect(x,y,random(10),random(10));
        
        
        char number = myText.charAt (round(random(9)));
         fill(63,222,72);
         text(number, x,y);
        
        
        x = x + 20;
      }
  
   y=y+10;
  }
}




void mousePressed(){
  
  save("pattern"+counter+".jpg");
  counter = counter +1;
}



  






