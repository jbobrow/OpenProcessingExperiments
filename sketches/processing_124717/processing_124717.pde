
 /* @pjs font="LuckiestGuy.ttf"; */
 
int x = 0;
int y = 10;
PImage mail;
PVector mailpos ;
boolean alive; 
PFont type;
 
void setup()
{
  size(600, 600);
  mail = loadImage("mail.png") ;
  mailpos = new PVector(0,300); 
  type = createFont("LuckiestGuy.ttf");
  textFont(type,30);
}
 
void draw()
{
  
  background(#0B519B);
  text("Use the right arrow key",100,50);
  text("to send the letter!",100,100);
  fill(#3E3E3C);
  noStroke(); 
  rect(400, 150, 200,100) ; 
  rect(330, 230, 100, 20) ;
  image(mail, mailpos.x, 100, 200, 200);
  
   fill(#20711F);
   rect(0, 500, 700, 300);
  
   fill(#3E2D1E);
   rect(550, 250, 50, 250);
   
   
  
  
}
 
void keyPressed()
                   {
   switch(keyCode) {
   
   
   case 39: //right arrow
   mailpos.x = mailpos.x+20 ;
   break;
   
 
 // println(myCar1.x) ; 
}
}



