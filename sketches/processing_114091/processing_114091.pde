
int mouse=1;



//now switch to mouse1


void setup()
{

size(1000,800);
background(255);



} 


void draw()
{
  background(255); //for updating the background
mouseNumber(2,0); //our function will use every mouse defined in it and draw the help cross



}


void keyReleased()
{
  if(key=='w')
  {
   
   mouse++;
    
  }
  
  if(key=='s')
  {
   
   mouse--;
    
  }
  println(mouse);
}





//this is the example for a mouse

void mouse1()
{
  //begin like that:
  
  
  
 if(mouse==1)   // this is the number of this mouse.     don't forget this part!!!
 {
  //put your mouse in there
   
   noFill();
   noCursor();   // use this if you use an image or you draw something by yourself
   
   
   ellipse(mouseX,mouseY,40,64);
   line(mouseX,mouseY-32,mouseX,mouseY+32);
   curve(mouseX+30,mouseY+18,mouseX,mouseY+32,mouseX,mouseY+60,mouseX+35,mouseY+60);
   curve(mouseX-30,mouseY+50,mouseX,mouseY+60,mouseX,mouseY+92,mouseX-35,mouseY+92);
   
   //---------------------------------------------
   
   
   
 }
 

 
}

//switch to mouseNumber





void mouse2()
{
  
 if(mouse==2)
{ 
  
  
  fill(255,0,0);
  
 ellipse(mouseX,mouseY,50,50);
  
  
  
  
  
  
  
} 
  
}




void mouse3()
{
  
 if(mouse==3)
{ 
  
  
  
  
 cursor(CROSS);
  
  
  
  
  
  
  
} 
  
}



//put all your mouses you want to use in there:


void mouseNumber(int amount,float help)
{
  
 //amount means how many mouses you've put in there
 
  mouse1();  //our first mouse
   mouse2();
   mouse3();
   
   //switch to manymouses2 and read everything
    
    
     //help shows you a cross at mouseX,mouseY
  //the size of it depends on the size of help
  //if help equals to 5  the size of the cross is 5x5
  //if help is smaller than 1 no cross will be drawn
  
 if(help>0)
 {
  line(mouseX-help/2,mouseY-help/2,mouseX+help/2,mouseY+help/2);
  line(mouseX-help/2,mouseY+help/2,mouseX+help/2,mouseY-help/2);
  
 }
  
}
