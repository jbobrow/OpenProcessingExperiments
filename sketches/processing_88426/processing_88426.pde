
PImage img;
boolean planet=false;
PImage planets[] = new PImage[9];
int mousex;
int mousey;
int x=0;
int y=0;
int z=1;
boolean star=false;
void setup() {
 size(800, 800);
  background(1);
 
  smooth();
  frameRate(30);
  img= loadImage("fat.png");
  for(int i =1;i<=8;i++){
  planets[i]=loadImage(i+".png");
 // println(i);
  }
}
 
void draw() {
  background(1);
  if(y>801)
  planet=false;
  if(planet==false){
  x=int(random(600));
  z=int(random(8)+1);  
  
  }
  if(planet==false){
  y= -800;
  planet=true;
  }
  if(planet==true){
    imageMode(CORNER);
   image(planets[z],x,y); 
   //originally had a bunch of if statements to determine which image to draw, then i realized i could use an array.
   //if(z==1)   
     //image(img1,x,y);
     //etc
   //hope i still have the 10 loop requirement
  }
  noStroke();
  fill(255,0,0);
  if(keyPressed==true){
 y+=50;
 triangle(303,466,404,466,303+random(200),466+random(2000));
 triangle(303,466,404,466,303-random(150),466+random(2000));
 triangle(303,466,404,466,303+random(200),466+random(2000));
 fill(255,119,0);
 triangle(303,466,404,466,303+random(175),466+random(1705));
 triangle(303,466,404,466,303-random(125),466+random(1705));
 triangle(303,466,404,466,303+random(175),466+random(1705));
 fill(255,216,0);
 triangle(303,466,404,466,303+random(150),466+random(1500));
 triangle(303,466,404,466,303-random(100),466+random(1500));
 triangle(303,466,404,466,303+random(150),466+random(1500));
  }
  if(keyPressed==false){
 triangle(303,466,404,466,303+random(200),466+random(200));
 triangle(303,466,404,466,303-random(150),466+random(200));
 triangle(303,466,404,466,303+random(200),466+random(200));
 fill(255,119,0);
 triangle(303,466,404,466,303+random(175),466+random(175));
 triangle(303,466,404,466,303-random(125),466+random(175));
 triangle(303,466,404,466,303+random(175),466+random(175));
 fill(255,216,0);
 triangle(303,466,404,466,303+random(150),466+random(150));
 triangle(303,466,404,466,303-random(100),466+random(150));
 triangle(303,466,404,466,303+random(150),466+random(150));
  }
  imageMode(CENTER);
 image(img,400,400);
 y+=5;
 if(star==true){
   /*elipses(mousex,mousey,10);
   elipses(mousex+20,mousey+sin(mousey),10);
 star=false
   */
 }
}
void mouseClicked(){
 mousex=mouseX;
mousey=mouseY; 
}



