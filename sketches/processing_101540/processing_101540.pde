
Maxim maxim;

int W = 512; 
int H = 768;
boolean click = true;
int count = 0;   

void setup()
// code that happens every frame
{
  
  size(W, H);
  
  background(255,250,205);
  //textAlign(CENTER, TOP); 
  smooth();
  msg();
  
//  PFont mono;
//  mono = loadFont("FranklinGothic-Book-20.vlw");
//  textFont(mono); 
//  
}

void draw()
{  
    button2(100, 700);
    button1(181, 662.5); 
    button2(412, 700);
    strokeWeight(3); 
    stroke(186,85,211);
    //draw the frame
    noFill();
    rect(5, 100, 500, 500);
    strokeWeight(1);
    stroke(0, 0, blue);
    noFill();
    //hidden circle
    ellipse(x, y, r, r); 

}

void mousePressed()
{   
// code that happens when the mouse button
// is pressed
   if (mouseX >= (5 + r) && mouseX <= (507 - r) && mouseY <= (600 - r) && mouseY >= (100 + r) && click == true){     click = !click;
//      println(mouseX); 
//      println(mouseY);
      //hide the previous text box
      fill(255,250,205);
      rect(0, 0, 512, 100);
      strokeWeight(3); 
      stroke(red, green, 0);
      fill (0, green, blue);
      text(s[1], 256, 30); 
      ellipse(mouseX, mouseY, 10, 10);
      dx = (x - mouseX); 
      dy = (y - mouseY); 
      dist = sq(dx) + sq(dy); 
      if (dist <= sq(r)){
        fill(255,250,205);
        rect(0, 0,  512, 100);
        fill (0, green, blue);
        text(s[1], 256, 30);
        fill(255,250,205);
        rect(0, 0, 512, 100);
        fill (0, green, blue);
        text(s[2], 256, 30); 
//        println(x);
//        println(y);    
//        println("You found it!");
      } 
      
   }          
 }


void mouseReleased()
{
// code that happens when the mouse button
// is released
  {
   click = !click;
   count += 1; 
   println(count); 
   }
}

void mouseDragged()
{
// code that happens when the mouse moves
// with the button down
}
//pick a random color
int red = (int) (Math.random()*256);
int green = (int) (Math.random()*256);
int blue = (int) (Math.random()*256);
// Ensure that x, y is within the bounds of the frame (500x500) 
int x = (int) ((Math.random()*452)+30);
int y = (int)((Math.random()*450)+125);
int r = (int)((Math.random()*40)+10);
 

//put messages in an array
String[] s = {
   "Click inside the frame to find the circle.", 
   "Number of clicks: ",
   "Congrats! You did it in %s clicks. Click again to quit."
  };

void countClicks()
{
}
void button1(float x, float y)
  {
    //rectangular button
    strokeWeight(3);
    stroke(0, 255, 0); 
    fill(0, 0, 255);  
    rect(x, y, 150, 75);
  }

void button2(float x, float y)
  {
    //round button
    strokeWeight(3);
    stroke(0, 0, 255); 
    fill(0, 255, 0);  
    ellipse(x, y, 75, 75);
  }
void msg()
{  
   
  textSize(22);
  textAlign(CENTER, TOP); 
  fill(red, green, blue);
  if (!click){
    text(s[0], 256, 30);
  }
  else
    redraw();
    //text(s[1], 256, 30);  

}

 //    determine whether mouse has clicked within area of the circle
//    int cX = x;
//    int cY = y;
//    float cD = r*2;
   
