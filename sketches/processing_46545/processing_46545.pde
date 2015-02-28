
void setup()
    {
    size(500,500);
    smooth();
    }
   
void draw()
    {
    //draw a button
    rect(0,0,100,50);
    
    //is the user clicking on the button?

    ellipse(mouseX,mouseY,50,50);
    }

void mousePressed()
    {
    if (mouseX >0 && mouseX<100 && mouseY>0 && mouseY<50)
        {
        fill(random(0,255));
        }
    else
        {
        isdrawing=true;
        }
    }

void mouseReleased()
    {
    isdrawing=false;
    }
