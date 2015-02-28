
class Button
{
    String name;
    float x;
    float y;
    float buttonWidth;
    float buttonHeight;
    boolean isPressed;
    
    PImage button1;
    PImage button2;
    
    Button(String name, float x, float y)
    {
        this.name = name;
        this.x = x;
        this.y = y;
        isPressed = false;
        
        buttonWidth = 191;
        buttonHeight = 41;
        
        button1 = loadImage("button1.png");
        button2 = loadImage("button2.png");
    }
    
    void display()
    {
        if (isPressed == false)
        {
            image(button1,x,y);
        }
        else
        {
            image(button2,x,y);
        }
        fill(255);
        textSize(12);
        textAlign(CENTER,CENTER);
        text(name,x+(buttonWidth/2),y+(buttonHeight/2));
    }
    
    boolean mouseOver(float mx, float my)
    {
        if (mx > x && mx < x+buttonWidth && my > y && my < y+buttonHeight)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    
    void buttonPressed()
    {
        isPressed = true;
    }
    
    void buttonReleased()
    {
        isPressed = false;
    }
}

