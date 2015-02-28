
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;


void setup() {
    size(600, 600);
    img1 = loadImage("background-01.png");
    img2 = loadImage("bird.png");
    img3 = loadImage("birdr.png");
    img4 = loadImage("cloud.png");
    img5 = loadImage("moon.png");
    img6 = loadImage("background-02-01.png");
    img7 = loadImage("tree.png");
    
}
void draw() {
     image(img1, 0, 0); //place background
     
     noStroke();
     fill(random(0,255),random(0,255),random(0,255));
     ellipse(random(width),random(height),10,10);
       
     
     image(img4,50,50);
     image(img4,70,100);
     image(img4, 400,20);
     image(img7, 30,300);
     image(img7, 400,120);
     
     
     
     if(mousePressed == true) {
       image(img6,0,0);
       image(img5,300,20);
       noStroke();
       fill(255,255,0);
       
       
       image(img7, 30,300);
       image(img7, 400,120);
       
       ellipse(random(width),random(height),50,50);
       
       
       image(img2,0,0);
       image(img2,30,80);
       image(img2,150,100);
       
       
       
      
       
       image(img3,550,200);
       image(img3,450,100);
       image(img3,430,230);
       
       
      
       
       
}
     

     if(mouseX<width/2) image(img2, mouseX, mouseY);
     if(mouseX>width/2) image(img3,mouseX, mouseY);
     
     
     
 
 
 }
 

   





