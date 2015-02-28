
int value = 0;
int a;
int b;
int valueMax = 9;
PImage myImage;

void setup(){
  size(1300,800);
  background(0);
   imageMode(CENTER);

  myImage = loadImage("parade0.jpg");
}

void draw(){
}

void mousePressed(){
  imageParade();
}

 
 void imageParade(){
   a=value;
   value=int(random(valueMax));
   b=value;
   if (a==b) value++; 
   myImage=loadImage("parade"+value+".jpg");
   image(myImage,mouseX,mouseY);
 }





