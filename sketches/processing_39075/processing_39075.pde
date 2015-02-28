
int x=10;
color c=#FF0000;

void setup()
{size(600, 600);
 background(255);
 smooth();
 
 
 }
 
 void draw()
 { 
  if(mousePressed==true)
     
  { line(mouseX, mouseY, pmouseX, pmouseY);
    strokeWeight(x);
   
   }
}

void keyPressed()
{
if (key==CODED){if(keyCode==UP) x++;
                else if(keyCode==DOWN && x>0) x--;
                if(keyCode==RIGHT){stroke(c);}
                else if (keyCode==LEFT) {stroke(0);}}
else if(keyPressed==true) line(mouseX-50, mouseY+50, pmouseX, pmouseY);              
}


