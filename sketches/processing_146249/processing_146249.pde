
int counter;

void setup() 
    {  //setup function called initially, only once
      size(250, 250);
      background(192,64,0);
      stroke(255);
    }

void draw() 
    {  
     line(150,25,mouseX,mouseY);
    }
}
