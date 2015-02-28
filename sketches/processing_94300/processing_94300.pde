
ArrayList<Mass> masses;

void setup() {  
    
    masses = new ArrayList<Mass>();
    
    // set the background color
    background(255);
    
    // canvas size (Variable aren't evaluated. Integers only, please.)
    size(300, 300); 
      
    // smooth edges
    smooth();
    
    // limit the number of frames per second
    frameRate(30);
    
    for (int i = 0; i< 15;i++)
    {
        masses.add(new Mass(random(240)+30,random(240)+30,random(10)+10));
    }
} 

void draw() {  
    background(255);
    for (int i = 0; i < masses.size(); i++) {
        Mass m = masses.get(i);
        m.run();
    }
    fill(255,0,50);
    ellipse(mouseX,mouseY,20,20)
}

class Mass
{
    int x;
    int y;
    int w;
 
    Mass(int xpos, int ypos, int d)
    {
        x = xpos;
        y = ypos;  
        w= d;  
    }   

    void run()
    {
        update();
        display();
    }
    
    void update()
    {
        if ((abs(mouseX-x) <= (3*w)) &(abs(mouseY-y) <= (3*w)) )
        {
            if (x>mouseX)
            {
                x=x+(4-round(abs(mouseX-x)/w,0));
            }
            else if (x<mouseX)
            {
                x--;
                x=x-(4-round(abs(mouseX-x)/w,0));
            }
            if (y>mouseY)
            {
                y=y+(4-round(abs(mouseY-y)/w,0));
            }
            else if (y<mouseY)
            {
                y--;
                y=y-(4-round(abs(mouseY-y)/w,0));
            }        
        }
    }
    
    void display()
    {
        fill(5,10,255);
        ellipse(x,y,w,w);
    }
    
    
}
