

void setup()
{
size(400, 400);
background(255);
stroke(0);
strokeWeight(1);
}

void draw()
{
background(255);
  
for(int x = 0; x < mouseX+50; x+=50)
{
 for(int y = 0; y < mouseY+50; y+=50)
    {
     fill(x, y, 255, 100);
     ellipse(width/2, height/2, mouseX-x, height-y);
     ellipse(width/2, height/2, width-x, mouseY-y);
     //ellipse(width/2, height/2, mouseX-x, height-mouseX); 
     //ellipse(width/2, height/2, width-mouseY, mouseY-y);
   
    }; 

};
/*
for(int a = 50; a < width; a+=50)
{
     ellipse(width/2, height/2, mouseX-a, a);
    ellipse(width/2, height/2, a, mouseY-a);
};
*/
}

