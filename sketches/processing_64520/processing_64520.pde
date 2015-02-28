
void setup()
{
size(400, 400);
background(255);
noStroke();
}
void draw()
{
 PImage grilla = get(0, 0, width, height); 
//-----------------------------------     
 for(int x = 0; x < width; x+=50)
    {         
     for(int y = 0; y < height; y+=50) 
         {
           fill(x-15, y-15, 128, 20);
           rect(x, y, 50, 50);
         };  
     };
//-----------------------------------  
//central
image(grilla, width/2-((width-mouseX)/2), height/2-((height-mouseY)/2), width-mouseX, height-mouseY); 
//esquinas
image(grilla, 0, 0, mouseX, mouseY); 
image(grilla, width-mouseX, height-mouseY, mouseX, mouseY); 
image(grilla, 0, height-mouseY, mouseX, mouseY); 
image(grilla, width-mouseX, 0, mouseX, mouseY); 
//-----------------------------------   
}

