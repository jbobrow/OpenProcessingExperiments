
int bearX = 50, bearY = 50;
int multipleX = 1, multipleY = 1;
String status;
float rannum = random(0,3);
int free = round(rannum);
int variable = 0;


void bear(int varX, int varY)//setting up a custom function for my bear
{
  background(255);
  strokeWeight(1); 
  stroke(0);
  
  //ears of the bear
  fill(#765B31);
  ellipse(varX-20,varY-15,35,35);
  fill(#765B31);
  ellipse(varX+20,varY-15,35,35);
  
  //head of the bear
  fill(#765B31);
  ellipse(varX,varY,70,50);
  
  //white nose part
  fill(#F0E6D7);
  ellipse(varX,varY+10,28,17);
  
  //nose
  fill(0);
  ellipse(varX,varY+7,7,7);
  
  //eyes
  ellipse(varX-15,varY-10,9,9);
  ellipse(varX+15,varY-10,9,9);
 
  //red face
  fill(#CE4B7D);
  ellipse(varX-20,varY,20,5);
  ellipse(varX+20,varY,20,5);
  
  //month part
  strokeWeight(5);
  line(varX,varY+8,varX,varY+12);//vertical line
  line(varX,varY+12,varX-3,varY+15);//right slope line 
  line(varX,varY+12,varX+3,varY+15);//left slope line
  
}

void setup()
{
  size(400, 300);
  //frameRate(1);
}
void draw()
{
  
 bear(bearX,bearY);//using my bear custom function of draw my bear, and bearX is varX and bearY is varY
 if(status == "horizontal")
 {
 println("horizontal");
 bearX+= multipleX;
 }

else if(status == "vertical")
 {
  println("vertical");
  bearY+= multipleY;
 }
else if(status == "diagonal")
 {
  println("diagonal");
  bearX+= multipleX;
  bearY+= multipleY;
 }
else if(status == "freeform")
 {
  if(variable > 30)
  {
   rannum = random(0,3);
   free = round(rannum);
   variable = 0; 
  }
  variable++;
  println("freeform");
  if(free == 1)
  {
    bearX+= multipleX;
  }
  else if(free == 2)
  {
     bearY+= multipleY;
  }
  else if(free == 3)
  {
     bearX+= multipleX;
     bearY+= multipleY;
  }  
 }


if((bearX >= (width - 35)) || (bearX <= 35))//for horizontal bouncing
 {
     multipleX*= -1;
 }
else if((bearY >= (height - 25)) || (bearY <= 30))//for vertical bouncing
 {
     multipleY*= -1;
 }



}
 
  
void keyPressed()//control the status, which directions to move 
{
  if(key == 'h') 
  {
    status = "horizontal";
  }
  else if(key == 'v')
  {
    status = "vertical";
  }
  else if(key == 'd')
  {
    status = "diagonal";
  }
  else if(key == 'f')
  {
    status = "freeform"; 
  }
  else if(key == ' ')
  {
    status = "stop";
  }
}



/*
float speed = 0;
float gravity = 0.1;

void draw()
{
   bear(bearX, bearY);
   bearY+= speed;
   speed+= gravity;
   
   if(bearY > 275)
   {
     speed*= -0.95;
   }
}
*/
  
 
 
  
  
  
  




