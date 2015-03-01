
//Working with Images in Processing

//Declare a PImage variable type
PImage bubble;
PImage dotcom;
PImage house;
PImage puppet;
PImage cover2;
PImage comp;
PImage debt;

int counter =0;

//Load image files from HDD
/*Don't forget to add the file
to your sketch 'data' folder*/
void setup() {
  size(800, 600);
  bubble = loadImage("bubble2.png");
  dotcom = loadImage("dotcom bubble.jpg");
  house = loadImage("house.jpg");
  puppet = loadImage("puppet.jpg");
  cover2 = loadImage("cover2.jpg");
  comp = loadImage("comp.jpg");
  debt = loadImage("debt.jpg");  
}

void draw() {
  if (mousePressed)
    {
     counter++;
        if (counter>6)
            counter=0;    
    }

    if  (counter == 0)
    {
       image(bubble, 0, 0); 
    }
    
    if (counter==1)
    {
       image(dotcom, 0, 0); 
    }
    
    if (counter==2)
    {
       image(puppet, 0, 178); 
    }
    
    if (counter==3)
    {
       image(house, 540, 0); 
    }
    
    if (counter==4)
    {
       image(cover2, 500, 200);
    }
    
    if (counter==5)
    {
       image(comp, 225, 417);
    }
  
    if (counter==6)
    {
       image(debt, 203, 147);
    }
  
   
}







