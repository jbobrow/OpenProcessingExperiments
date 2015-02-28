

PImage[] myimages = new PImage[10];
int imageIndex = 0;
int timer = 0;
int x = 1;

 
void setup() {  
    size(200, 200); 
 
    for (int i = 0; i < myimages.length; i += 1) 
    {
        myimages[i] = loadImage("animal" + i + ".jpg");
    }
}
 
void draw() { 

    timer += x;

    if (timer >= 300) {
        imageIndex += 1;
        timer = 0;
    }
    
    if (mousePressed == true) {
        
       if (mouseButton == LEFT) {
           x -= 1;
       }
       if (mouseButton == RIGHT) {
           x += 1;
       }
    }
    
    if (x > 10) {
        x = 0;
    }
    else if (x < 0) {
        x = 9;
    }
        
    if (keyPressed) {
        if (key == ' ') {
            imageIndex = 4;
        }
    }
    
    if (imageIndex > 9) {
            imageIndex = 0;
    }
    else if (imageIndex < 0) {
        imageIndex = 9;
    }
    image(myimages[imageIndex], 0, 0);
}
 
void keyReleased() {
        if (keyCode == RIGHT) {
            imageIndex = imageIndex + 1;
        }
        if (keyCode == LEFT) {
            imageIndex = imageIndex - 1;
        }
}
 


