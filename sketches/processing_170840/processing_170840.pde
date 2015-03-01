
int r=int(random(255)); //random color
int g=int(random(255)); //random color
int b=int(random(255)); //random color
int w= 50; //sets width to 50
int h=50;  //sets height to 50
int highScore=0;


void setup() {
  size(800, 800); //sets screen to 800,800
   noCursor();//hides cursor
  background(r, g, b); //random color for background
  
}
void draw() {
  background(r, g, b); //random color for background
  
  ellipse(mouseX, mouseY, w, h); //ellipse that follows the mouse
  if ((mouseY-(h/2)<=0) || (mouseY+(h/2)>=800)) //left and right side of the screen
   smaller(); //makes the ellipse smaller
   else 
    bigger(); //makes the ellipse bigger
}

void bigger(){
 if (mousePressed) {
    
      
        w=w+5; //adds 5 to width
        h=h+5; //adds 5 to height
        pointTrack(w); //adds points 
      
      
    
  } 
  
}

void smaller(){
  if (mousePressed) {
     delay(1000);
     w=50; //resets ellipse
     h=50; //resets ellipse
     
    
  } 
}

//keeps track of score out of 100
void pointTrack(int rawPoints){
 int points=rawPoints/8;
if (points>highScore)
  highScore=points; //makes the highScore the current score if it is higher
textSize(32);
fill(0);
 text("Score this round is " +points+"    HighScore is "+highScore, 10, 30);
println("Score this round is " +points+"    HighScore is "+highScore); // tells you current and highScore
fill(255);
if(highScore==100){
for (int i=0; i<=20; i++){ 
  textSize(32);
  fill(0);
 text("YOU WINNN!!!!!!!!!!!", 10, 90);
 fill(255);
println("YOU WINNN!!!!!!!!!!!"); //says you win when the circle is the biggest
 highScore=0;
}
}}

