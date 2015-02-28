
 
//import java.awt.*;
 
 
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
 
 
void setup() {
    img1 = loadImage("Periodic_table/background 2 - Copy.png");
     img2 = loadImage("Periodic_table/רקע.png");
    img3 = loadImage("Periodic_table/רעג.png");
    img4 = loadImage("Periodic_table/מצב צבירה.png");
     img5 = 
loadImage("Periodic_table/מתכות.png");
    img6 = loadImage("Periodic_table/Untitled.png");
    img7 = loadImage("Periodic_table/background 3 - Copy - Copy - Copy.png");
    img8 = loadImage("Periodic_table/backgroun 4.png");
    img9 = loadImage("Periodic_table/backgroun 4 (1).png");
    size(1628,818);
} 
 
void draw(){
    background(img2);
    //java.awt.Rectangle img3Rect = new java.awt.Rectangle(315, 520, width/11, height/10);
    //image(img3, img3Rect.x, img3Rect.y, img3Rect.width, img3Rect.height);
    image(img3, 315, 520, width/11, height/10);
    image(img4, 515, 520, width/11, height/10);
    image(img5, 715, 520, width/11, height/10);
    image(img6, 915, 520, width/11, height/10);
    if (mousePressed){
       if ( (mouseX > 315) && (mouseX < 315 + width/11) && 
            (mouseY > 520) && (mouseY < 520+ height/10 ) ) {
         background(img1);
         image(img3, 315, 520, width/11, height/10);
         image(img4, 515, 520, width/11, height/10);
         image(img5, 715, 520, width/11, height/10);
         image(img6, 915, 520, width/11, height/10);
        } 
    }
     
    if (mousePressed){
       if ( (mouseX > 515) && (mouseX < 515 + width/11) && 
            (mouseY > 520) && (mouseY < 520+ height/10 ) ) {
         background(img7);
         image(img3, 315, 520, width/11, height/10);
         image(img4, 515, 520, width/11, height/10);
         image(img5, 715, 520, width/11, height/10);
         image(img6, 915, 520, width/11, height/10);
        } 
    }
 
    if (mousePressed){
       if ( (mouseX > 715) && (mouseX < 715 + width/11) && 
            (mouseY > 520) && (mouseY < 520+ height/10 ) ) {
         background(img8);
         image(img3, 315, 520, width/11, height/10);
         image(img4, 515, 520, width/11, height/10);
         image(img5, 715, 520, width/11, height/10);
         image(img6, 915, 520, width/11, height/10);
        } 
    }
     
        if (mousePressed){
       if ( (mouseX > 915) && (mouseX < 915 + width/11) && 
            (mouseY > 520) && (mouseY < 520+ height/10 ) ) {
         background(img9);
         image(img3, 315, 520, width/11, height/10);
         image(img4, 515, 520, width/11, height/10);
         image(img5, 715, 520, width/11, height/10);
         image(img6, 915, 520, width/11, height/10);
        } 
    }
 
}



