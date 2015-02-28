
/* @pjs preload = "papapa.gif, reaf.gif"; */
int y = 150;
int eSize = 5;
PImage img;
PImage reaf;

void setup(){
size(450, 450);
background(255, 255, 0);
noStroke();
fill(255, 255, 0);

img = loadImage("papapa.gif");
reaf = loadImage("reaf.gif");

tint(255, 0, 0);
image(img, 70, 50, 310, 350);

tint(255, 0, 0);
image(reaf, 215, 60);

}

void draw(){   //moyou
 
for(int c = 0; c <= height; c +=25){
  for(int x = 0; x <= width; x += 25){
    ellipse(x, c, eSize, eSize);
  }
}
 
}
void keyPressed(){  //ringo kajirareru
 
switch(key) {
     
    case'k':
    ellipse(140, 190, 160, 160);
    break;
 
   case'a':
    ellipse(300, 310, 183, 183);
    break;
    
   case'j':
    ellipse(130, 310, 183, 183);
    break;
 
   case'i':
    ellipse(300, 200, 160, 160);
    break;

   case'r':
    ellipse(225, 310, 140, 140);
    break;

   case'u':
    ellipse(225, 207, 133, 133);
    break;

   case'5':
    ellipse(380, 220, 130, 130);
    break;
  
}
 
}

void mousePressed() {  //swich ringo deru
  
 if(mouseX > 210 &&  mouseX <  290 && mouseY >  50 && mouseY<  140 ){
image(img, 70, 50, 310, 350);

}

}
 





