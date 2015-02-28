
PImage myimage;
PImage myimage2;
PImage myimage3;
PImage myimage4;

 int x;
 int y;


void setup() {
size(600,600);



myimage= loadImage("image1.png");
myimage2= loadImage("image2.jpg");
myimage3= loadImage("image3.jpg");
myimage4= loadImage("image4.png");
}

void draw(){
  background(255);
  
  
  y=0;
  x=0;

 while (y < 800){
    x=0;
    
    while (x < 800) {
     image(myimage2,x,y);
      
      
      tint(random(255),random(255),random(255), random(25));
      
      image(myimage3,x+5,y+5);
      //image(myimage4,x-7,y-7);
      
      x=x+30;
    }    
    y=y+30;
    x=x+30;
    }
    
    
    line(0,0,mouseX,mouseY);
    line(600,0,mouseX,mouseY);
    line(0,600,mouseX,mouseY);
    line(600,600,mouseX,mouseY);
    
    
    line(0,0,mouseX,mouseY-200);
    line(600,0,mouseX,mouseY-200);
    line(0,600,mouseX,mouseY-200);
    line(600,600,mouseX,mouseY-200);
    
    noTint();
    image(myimage2,0,0);
    image(myimage2,570,0);
    image(myimage2,570,570);
    image(myimage2,0,570);
    image(myimage, mouseX-15, mouseY-15);
    image(myimage4, mouseX-15, mouseY-215);
}

