
//ihansen
//copyright 2012
//HW 8 - doing stuff with WHILE loops
//input from the keyboard:
//press any key to change the color of the text (random)
//input from the user mouse position:
//put your mouse over the first line to change the "I" to "YOU"




int x, y, space,txtsz;


void setup()
{
  smooth();
  size(600,600);
 space=height/30;
 txtsz=width/20;


  
}



void draw()
{
  background(0);
  whileText();
  mouseYou();
  
}

void keyPressed()
{
  fill(random(255),random(255),random(255));
}



void whileText()
{
  x=width/8;
  y=height/3;
  textSize(width/20);
  text("I don't know how to ", (width/4),(height/4));
  
 while (y<= (height-txtsz)) 
  {
   
    textSize(txtsz);
    text("make",x,y);
    text("a", (x*3),y);
    text("loop",(x*5),y);
    y=y+space;
    x=x+frameCount%txtsz;
   
  
  }
  
    
}

void mouseYou()
{
  if (mouseX >= width / 5 && mouseY >=height/5 && mouseX <=(width-(width/5)) && mouseY<= height/3)
  {
  youText();
  }
  
  

}

void youText()
{
   text("YOU", (width/6.3),(height/4));
}
