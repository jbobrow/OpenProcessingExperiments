
//Array for rectangles
 Rect[] rectangles = new Rect[30];
 //variable to hold the x and y coordinates along with the wPos and hPos
 float xPos, yPos, wPos, hPos;
 PFont f;
 boolean mainScreen = false;
 //boolean initially set to show the calendar screen
 boolean calendar = true;
 boolean receiveText = false;
 String typing = "";
 float bloodSugar = 0;
 //variable to store the image reference
 PImage b;

 
 //setup method that sets screen size, loads images and sets rectangle sizes etc
 void setup(){
   //loads image from local folder
   b = loadImage("TameBadger.jpg");
   //sets the display screen size
   size (800,800);
   
   //sets initial values for the rectangles
   xPos = 30;  //margin
   yPos = 90;  
   wPos = 100;
   hPos = 100;
   
   //uses createFont method to set the font style and size
   f = createFont("Arial", 16, true);
   textAlign(LEFT);
   
   //for each rectangle in the array a new rectangle object is created with the initial x, y, width and height variables
   for(int i=0; i<rectangles.length; i++){
     
     rectangles[i] = new Rect(xPos, yPos, wPos, hPos);
      
     //moves the x coordinate 100 across 
     xPos += 100;
        
     //if condition that if true then starts a new line of rectangles by adding 110 to the y coordinate
     if(i==6 || i==13 || i==20 || i==27)
     {
      
      yPos += 110;
      xPos = 30;
      
     }
 
   }
 }
 
  //draw method that draws the rectangles and text to the screen
  void draw()
  {
   //sets image to the loadImage value in setup
   image(b,0,0);
   //if the calendar screen is true then sets the font style/size specified in setup
   if(calendar == true){
    //println("calendar screen");
      textFont(f, 16);
      fill(0);
     //text("November 2013", 10, 30);
     
     //draw the rectangles
     //for each rectangle in the array it draws it based on whatever index i is at and sets the colour using the fill method.
     for(int i=0; i<rectangles.length; i++){
       rectangles[i].drawRect();
       fill(50);
     }
     
     //sets the dates inside each rectangle
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
     //loads the image 
     b = loadImage("TameBadger.jpg");
     fill(255);
     
     //sets rectangles for the save button and the Blood Sugar Levels entry box
     rect(250,300,250,80);
     fill(255);
     rect(450,400,50,25);
     fill(0);
     text("Save",460,418);
     fill(0);
     text("Enter blood sugar levels", 280, 320);
     
     //println(calendar);
         
     receiveText = true;
     
     if(receiveText == true)
     { 
       
       text(typing, 280, 340);
       fill(155);
    
      }
          
     }        
}

void keyPressed(){
   if(receiveText == true){
     if(key == '\n')
     {
         //assigns the value of whatever the user entered to the bloodSugar variable
         bloodSugar = float(typing);
     }
     else
     {
       //if the key = a number pressed then it concatenates this value onto the previous entered value
       if(key == '1' || key == '2' ||key == '3' ||key == '4' ||key == '5' ||key == '6' ||key == '7' ||key == '8' ||key == '9' ||key =='.')
       {  
        
        typing=typing+key; 
        println(typing);
        
        //attempts to write the user input to a text file output.txt
        PrintWriter output = createWriter("output.txt"); //Writes to file in location
  
         output.flush();
         output.close();
           if (keyCode == ENTER)
             { 
                text("Blood Sugar = " + typing, 50,60);
             }
       }
       // writer = new BufferedWriter(new FileWriter("C:/Users/User/My Documents/output.txt"));
       
     }
   
       if (keyCode == BACKSPACE) 
       {
          if (typing.length() > 0)
          {
            typing = typing.substring(0, typing.length()-1);
          }
       }
      if (keyCode == DELETE)
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

void endScreen(){ 
 //This is code for how the end screen is displayed.
 textSize(20);//sets text size
 fill(255);
 text("Please enter details", 100, 100);
 //String bloodsugar = "165";
 // for(int i=0; i <31; i++)
 // {
 //   BloodSug[i] = "";
 //   if (BloodSug[i]  bloodsugar);
   
 //}
  
}

void shotTime()
{
 while (bloodSugar < 50)
 {
  
 }
 
}

//Rectangle class that sets up the instance variables and constructor for the Rectangle objects
class Rect
{
   int red, green, blue;
   
   boolean isSelected;
   boolean display;
   float x,y,w,h;
   
   //Rectangle constructor that passes in the x, y, width and height as parameters when the object is created
   Rect(float xPos, float yPos, float wPos, float hPos)
   {
     display=true;
     x = xPos;
     y = yPos;
     
     //initialises default rectangle width and height
     w=100;
     h=100;
     isSelected=false;
          
   }
   
   void drawRect()
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
   if(mouseX > x && mouseX <(x+w) && mouseY > y && mouseY < (y+h))

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


