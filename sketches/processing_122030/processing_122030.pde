
//Array for rectangles
 Rect[] rectangles = new Rect[30];
 float xPos, yPos, wPos, hPos;
 PFont f;
 boolean mainScreen = false;
 boolean calendar = true;
 boolean receiveText = false;
 String typing = "";
 float bloodSugar = 0;
 PImage b;
 
 
 void setup(){
   b = loadImage("TameBadger.jpg");
   size (800,800);
   
   
   xPos = 30;  //margin
   yPos = 90;  
   wPos = 100;
   hPos = 100;
   
   f = createFont("Arial", 16, true);
   textAlign(LEFT);
   
   for(int i=0; i<rectangles.length; i++){
     
     rectangles[i] = new Rect(xPos, yPos, wPos, hPos);
      
     xPos += 100;
        
     if(i==6 || i==13 || i==20 || i==27)
     {
      
      yPos += 110;
      xPos = 30;
      
     }
 
   }
 }
 
 
 
  void draw()
  {
   image(b,0,0);
   if(calendar == true){
    //println("calendar screen");
      textFont(f, 16);
      fill(0);
     //text("November 2013", 10, 30);
     //draw the rectangles
     for(int i=0; i<rectangles.length; i++){
       rectangles[i].drawRect();
       fill(50);
     }
     // Assigns dates to the boxes
     text("1", 40, 110);
     text("2", 140, 110);
     text("3", 240, 110);
     text("4", 340, 110);
     text("5", 440, 110);
     text("6", 540, 110);
     text("7", 640, 110);
     text("8", 40, 220);
     text("9", 140, 220);
     text("10", 240, 220);
     text("11", 340, 220);
     text("12", 440, 220);
     text("13", 540, 220);
     text("14", 640, 220);
     text("15", 40, 330);
     text("16", 140, 330);
     text("17", 240, 330);
     text("18", 340, 330);
     text("19", 440, 330);
     text("20", 540, 330);
     text("21", 640, 330);
     text("22", 40, 440);
     text("23", 140, 440);
     text("24", 240, 440);
     text("25", 340, 440);
     text("26", 440, 440);
     text("27", 540, 440);
     text("28", 640, 440);
     text("29", 40, 550);
     text("30", 140, 550);
     text("165mg", 40, 135);
     text("Shot taken", 40, 165);
   }
   else if(mainScreen == true)
   {
     
     b = loadImage("TameBadger.jpg"); //load background image
     fill(255);
     rect(250,300,250,80); // creates the box for inputting the blood sugar levels
     fill(255);
     rect(450,400,50,25); // save button box
     fill(0);
     text("Save",460,418); //save text
     fill(0);
     text("Enter blood sugar levels", 280, 320); 
     
     //println(calendar);
     
     
     receiveText = true;
     
     if(receiveText == true)
     { 
       
       text(typing, 280, 340); // the position of the text the user inputs
       fill(155);
       
       
      }
      
     
     }   
     
}
     
    
     
    
  

 
 void keyPressed(){ //defines different functions for different key presses
   if(receiveText == true){
     if(key == '\n')
     {
         bloodSugar = float(typing);
     }
     else
     {
       
       if(key == '1' || key == '2' ||key == '3' ||key == '4' ||key == '5' ||key == '6' ||key == '7' ||key == '8' ||key == '9' ||key =='.')
       {  
        
        typing=typing+key; 
        println(typing);
        
        PrintWriter output = createWriter("output.txt"); //Writes to file in location
        
        
         
         output.flush();
         output.close();
           if (keyCode == ENTER) //if the user presses enter, it saves the blood sugar levels
             { 
                text("Blood Sugar = " + typing, 50,60); 
             }
       }
       // writer = new BufferedWriter(new FileWriter("C:/Users/User/My Documents/output.txt"));
       
     }
   
       if (keyCode == BACKSPACE) //if backspace is pressed, deletes a character from the string
       {
          if (typing.length() > 0)
          {
            typing = typing.substring(0, typing.length()-1);
          }
       }
      if (keyCode == DELETE) //if delete is presses returns to the calendar screen
       {
       mainScreen = false;
       calendar = true;
       // writer.write(typing);
       //text("Blood sugar = " + typing, 30, 90); 
       
       } 
     }
  
   }
     
        
 
    
  



void mousePressed() {
  if(mainScreen != true){
    for(int i=0; i<rectangles.length; i++){
       rectangles[i].clicked();
       fill(155);
     }
    // println("mouseclicked");
  }
}







  class Rect //defines the class rectangle
  {
   int red, green, blue;
   
   boolean isSelected;
   boolean display;
   float x,y,w,h;
   
   Rect(float xPos, float yPos, float wPos, float hPos)
   {
     display=true;
     x = xPos;
     y = yPos;
     
     w=100;
     h=100;
     isSelected=false;
          
  }
   
   void drawRect() //draws the boxes in the calendar
   {
     //if(display==true)  
     //{
       if(isSelected==true) 
       {
         fill(0);
       }
       else  
       {
         fill(255);
       }
       rect(x,y,w,h);
     }
         

  
 

  
  void clicked(){
   if(mouseX > x && mouseX <(x+w) && mouseY > y && mouseY < (y+h)) //when mouse is on a box, takes the user to a different screen

           //isSelected = true;
           calendar = false;  
           mainScreen = true;
  }
           
  //if(mouseX > 30 && mouseX < 110 && mouseY > 90 && mouseY <210){
   // rect(0,0,800,800);
   // fill(0);
  //println("Clicked");
 //endScreen();
 //noLoop();
  
  
  

  }



