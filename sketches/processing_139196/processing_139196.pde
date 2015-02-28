
String[] fontList =  PFont.list();
String message = "Creative Computing";
int start_time = 0;





void setup() {
size(500, 500);


}

void draw() {

  background(150,150,150);
  
int faces = int(random(0,fontList.length));
PFont   fonts = createFont(fontList[faces],20);
    
    

  int x = 100;
  for (int i = 0; i < message.length(); i++) {
     
    textSize(random(10,50));
    text(message.charAt(i),x,height/2);
    textFont(fonts);
    x += textWidth(message.charAt(i)); 
     
   
  }
    
 
 
   
}



