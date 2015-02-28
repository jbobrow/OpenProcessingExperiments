
//initialise variables
int rect1X, rect1Y, rect2X, rect2Y,rect3X,rect3Y; //variables for the x and y co-ordinates of rectangles
color rect1Color, rect2Color, rect3Color, baseColor;//variables for rectangle answer buttons
int rectDiameter = 90;
String[] questions = new String[10]; //Question array
char[] answers = new char[10]; //Answer array
int i = 0;//sets i to 0
int value = 0; //sets value to 0
int score = 0; //sets score to 0


void setup(){
   size(500, 500);
  //sets up an array for the questions to go into
   questions[0] = "What is the most abundant element in the air?\n 1.Oxygen\n 2.Nitrogen \n 3.Argon";
   questions[1] = "What is the the chemical name for rust?\n 1.Ferric Oxide \n 2.Sodium Chloride \n 3.Aluminium Oxide";
   questions[2] = "What type of structure does DNA have?\n 1.Double Bind \n 2.Double Helix \n 3.Triple Twist";
   questions[3] = "What does a red blood cell have missing that is present\nin all other cells? \n 1.Cell Wall \n 2.Cytoplasm \n 3.Nucleus ";
   questions[4] = "What is the symbol for the speed of light in a vacuum?\n 1.a \n 2.b \n 3.c" ;
   questions[5] = "How many chromosomes does a human have?\n 1.46 \n 2.22 \n 3.23";
   questions[6] = "What is 0.001 in terms of SI units?\n 1.Mili \n 2.Micro \n 3.Nano";
   questions[7] = "What type of fingerprint pattern is the most common? \n 1.Arch \n 2.Loop \n 3.Whorl";
   questions[8] = "What colour is at the end of the\n visible spectrum (700+ nm) \n 1.Red \n 2.Violet \n 3.Blue";
   questions[9] = "What is the chemical name for Vinegar?\n 1.Acetic Acid \n 2.Ethanoic Acid \n 3.Ascorbic Acid";

   //sets up an array for the answers to equal a character being pressed
   answers[0] = '2';
   answers[1] = '1';
   answers[2] = '2';
   answers[3] = '3';
   answers[4] = '3';
   answers[5] = '3';
   answers[6] = '2';
   answers[7] = '2';
   answers[8] = '1';
   answers[9] = '2';

   //sets the rectangle colours
   rect1Color = color(0);
   rect2Color = color(0);
   rect3Color = color(0);
   baseColor = color(193,205,193);
   
   //sets the rectangle answer button sizes 
   rect1X = width/2 - rectDiameter - 70;
   rect1Y = height/2 + rectDiameter + 0;
   
   rect2X = rect1X + rectDiameter + 20;
   rect2Y = height/2 + rectDiameter + 0;
   
   rect3X = rect2X + rectDiameter + 20;
   rect3Y = height/2 + rectDiameter + 0;

}

void draw(){
   {
   background(baseColor);//Creates background
     
   
   //If questions reach 10 then it will display the end screen if not questions will be displayed.
   if(i == 10)
   { 
      rect(0, 0, 500, 500, 255); 
      fill(0);
      endScreen();
      noLoop();
    }
    
   // ask the questions
   else
   {
   
    // question background rectangle
   fill(11, 120, 120);
   noStroke();
   rect(100,100,3,200);
   
   //sets position of the answer buttons background
   stroke(0);
   fill(255);
   rect(rect1X, rect1Y, 100,40);
   rect(rect2X, rect2Y, 100, 40);
   rect(rect3X, rect3Y, 100, 40);
   
   // all text
   fill(0);
   text("1",rect1X + 30,rect1Y + 30, 50);
   text("2",rect2X + 30,rect2Y + 30, 200);
   text("3",rect3X + 30,rect3Y + 30, 200);

   text(questions[i],125,150);
   
   
   textSize(13);//sets text size for score
   text("Score: " + score, 450,20);}
   }
   
   
}

void keyPressed() //keys pressed will check the answers array and increment counter.
                  //If correct increments score counter as well
{
  
 if(i < 10){
   
   if(key == answers[i])

   {
     
      score++;  //increments score
     
   }
    i++;  //increments i counter 
   }
}

void endScreen(){ //This is code for how the end screen is displayed.
 textSize(20);//sets text size
 fill(255); //sets background colour

 ;
if(score >-1&& score < 4 ){ //depending on score achieved in the quiz the display message will be different.
        text("Elementary!\n Your score:",200,200);
     }
    else if (score > 3 && score < 7 )
     {
        text("Eureka!\n Your score:",200,200);}
    else
     {
        text("Einstein!\n Your score:",200,200);
     }
    
    textSize(200);//sets text size of the score number
    text(score,173,400);
        
}


