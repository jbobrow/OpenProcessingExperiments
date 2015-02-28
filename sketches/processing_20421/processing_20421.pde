



//StringBuffer numberTyped = new StringBuffer(); 
PFont font;
String letters = "A B C D E F G H I J K L M N O P Q R S T U V W K Y Z";


void setup() {
  
  size(400,400);
  font = loadFont("Times-Roman-48.vlw");
  textSize(50);
  smooth();

   //char letters = 'a, b';

noLoop();
  }


void draw() {
  background(255);
  rotate(PI/7.0);
  fill(0);
  
  
  for (int i = 0; i < 50; i++) {
    //for (int j = 0; j < 100; j++) {
    text(letters,random(i*30) ,random(i*50));
  //}
  }
 

 //save("x.tif");
}
  

  






  




