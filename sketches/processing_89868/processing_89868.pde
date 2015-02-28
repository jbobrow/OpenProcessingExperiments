
//Hi Laura. I only received this lab assignment on the Friday as my lab is 4-6.
// I did not have enough time to figure out why my first attempt here does not work but I will work on it over the weekend.
//Jack and I could not see the reason why it does not work but I will work on it and understand why.
//void setup()
//{
//  size (400,400);
//}

//void draw()
//{
//  MovingImage(1,180,4);// the 3 values will be put in the same order into the 3 set intergers.
//}

//void MovingImage (int x, int y, int speed) //the 3 set intergers
//{
// if(mouseX<190 || mouseX>210 || mouseY<190 || mouseY>210)// this will make it so the the shapes will not move while the mouse is in the center. We do not use && as the mouse can't be in 2 places at once.
//   { 
//      background(150);
//      fill(255,0,0);
//      rect(x,y,40,40);
//      fill(0,255,0);
//      ellipse(x+20,y+20,30,30);
//      fill(0,0,255);
//      triangle(x+20,y+30,x+20,y+10,x+30,y+30);
//      x=x+speed;
//      if (x>width-40 || x<0)
//       {
//         speed=speed*-1;
//       }
//   
//   }
//}

int x = 1; //as the program I intended to submit did not work these had to be initialized.
int y=180;
int speed = 4;

void setup() //The initial setup of the program
{
  size (400,400);
  background (100);
}




void draw()
{
  if(mouseX<190||mouseX>210||mouseY<190||mouseY>210) // this will make it so the the shapes will not move while the mouse is in the center. We do not use && as the mouse can't be in 2 places at once.
  {
background(150);
    fill(255,0,0);
    rect(x,y,40,40);
    fill(0,255,0);
    ellipse(x+20,y+20,30,30);
    fill(0,0,255);
    triangle(x+20,y+30,x+20,y+10,x+30,y+30);//I made a random strange shaped triangle
    x=x+speed; 
    if (x>width-40 || x<0)//the -40 makes it so that the shape stays on the screen at all times.
     {
       speed=speed*-1;//This stops the shape from disappearing off the screen. Positive by negative is negative and negative by negative is posative so it will bounce at both sides.
     }  
     
   }
}
