
//Jordana Bungard
//March 25, 2014
//HW 8
//downlaod alice at http://grantstevens.wordpress.com/2013/04/01/epic-disney-watchfest-13-alice-in-wonderland-and-the-emperors-new-groove-a-wondrous-and-groovy-review/
//download alice2 at http://finddisneyworld.com/alice-wonderland-disney-17.html
//download alice3 at http://collider.com/wonderland-nbc-electropolis-cw/
//download rabbit1 at http://screencrave.com/2010-02-04/alice-in-wonderland-cheshire-cat-white-rabbit-posters/
//using the code we saw on Wednesday for image animation a guide
PImage photo;
PImage photo2;
PImage photo3;
PImage photo4;
PImage photo5;
PImage photo6;
float a=0;
float b;

void setup(){
  b=width;//move from left to right

  background(0);//black
  size(300,300);//size
  photo= loadImage("alice.jpg"); 
  photo2= loadImage("alice2.jpg");
  photo3=loadImage("alice3.jpg");
  photo4= loadImage("rabbit1.jpg");
  photo5= loadImage("flowers.jpg");
  photo6= loadImage("rabbit2.jpg");
}

void draw(){
  //fast moving animation
  //copy() if we just want to show part of an image
 copy(photo,50,int(random(50,200)),350,50,0,50,width,50); // second row
   
   int sy= int(map(noise(a),0,1,50,200));//controls the range of the moving image(image starts at 0, then is able to move from 1-200)
  
  copy(photo2,50,sy,350,50,0,200,width,50);//second to last row
  a=a+0.01;//animate
   copy(photo3,50,int(random(10,50)),350,50,0,125,width,50);//center row  a=a+0.05;//animate-controls movement of the image(shaky up or down movement
  copy(photo5,50,int(random(10,50)),350,50,0,250,width,50);//bottom row
  a=a+0.05;//animate-controls movement of the image(shaky up or down movement
    copy(photo6,50,int(random(10,50)),350,50,0,0,width,50);//first row
      a=a+0.01;
image (photo4,b,0);//displays image 4 going across the screen
b=b+2;//moves image 4
if (b>width){
 b=0;}//if image 4 goes to past width of sketch, then returns to 0
if(mousePressed){
  b=b-3;}
}//hold mouse to move image the other way



