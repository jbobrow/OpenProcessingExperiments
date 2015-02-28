
PImage back;
PImage backone;
PImage snow; 
PImage face;
PFont casion;
float speed = 0.5;
int radius = 40;
float x=-radius;
 
void setup () {
smooth();

//loading the image

back=loadImage("back.jpg");
backone=loadImage("backone.jpg");
face=loadImage("face.png");
snow=loadImage("snow.png");
casion =loadFont("ACaslonPro-Regular-48.vlw");

textFont(casion);
size (back.width, back.height);
 
println(back.width);
println(backone.width);
}



//-----------------------------------------------------------------//

void draw(){
 
  
 x += speed;
 if (x > width+radius){
 x = -radius;
 
 }
 
 image(back,0,0);
 if (mousePressed==true) {
   image(backone,0,0);

 }
    image(face, mouseX,mouseY, 150,150); //big one you can move around
    
    image(snow,20,x+90,50,50);//snow dropping
    image(snow,40,x+340,50,50);
    image(snow,100,x,30,30);
    image(snow,200,x+270,30,30);
    image(snow, 240,x, 50,50); 
    image(snow,340,x+400,60,60);
    image(snow,340,x+50,40,40);  
    image(snow,340,x-100,20,20);
        image(snow,40,x-50,20,20);
 
 
 
  textSize(12);
    fill(255,355,255);
    
 
  text("HESHIYUN.", 355,320);
 

  
}


