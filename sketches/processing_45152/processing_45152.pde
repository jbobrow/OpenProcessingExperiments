
float vy = 0;
float vx = 0; //twp pixels per frame horizontally
float x = 10;
float y = 550;
float frictionY = -.9;
float frictionX = .998;
float gravity = .90;
float speed;
PImage snickers;
PImage steak;
PImage kitchen;
PImage broccoli;

void setup(){
  size(800,600);
  
  snickers = loadImage("snickers.jpg");
  steak = loadImage("steak-dinner.jpg");
  kitchen = loadImage("Kitchen.jpg");
  broccoli = loadImage("broccoli.jpg");  
}

void draw(){
  
  image(kitchen,0,0);
  
  vy += gravity; // vy = vy + gravity
  vx *= frictionX; // vx = vx* frictionX
  x += vx;
  y += vy;
  
  stroke(206,158,154);
    strokeWeight(4);
    smooth();
    noFill();
  beginShape();
    vertex(50,40);
    vertex(50,400);
    vertex(200,400);
    vertex(200,40);
    vertex(50,40);
    vertex(50,120);
    vertex(200,120);
    vertex(200,290);
    vertex(50,290);
  endShape();
  
  strokeWeight(5);
  line(50,290,50,550);
  line(200,290,200,550);
  
  fill(0);
  rect(50,290,150,110);
  rect(50,40,150,80);
  rect(50,130,150,150);
    
     
  image(snickers,55,50);
  image(steak,65,300);  
  image(broccoli,70,150);


  if(y > height - 50){
   y = height - 50;
   vy *= frictionY;
}


    if(y < height/height){
     y = height/height;
     vy *= -frictionX;
 
   
}

if(x > width){
  x = width;
  vx *= frictionY;
 
}

if(x < width/width){
  x = width/width;
  vx *= -frictionX;

}

fill(100,255,200);
ellipse(x,y,50,50);

}

void mousePressed(){
   if(dist(100,50,mouseX,mouseY) < 75){
    x = mouseX;
    y = mouseY;
    vy = 55;
    vx = 12*3;
    gravity = 3.99;
    
}    
    
    if(dist(100,350,mouseX,mouseY) < 105){
      
    x = mouseX;
    y = mouseY;
    vy = 1/2;
    vx = 5;
    gravity = 3.5;

    }
    
    if(dist(80,200,mouseX,mouseY) < 80){
   
   x = mouseX;
   y = mouseY; 
   vy = 13;
   vx = 13; //twp pixels per frame horizontally
  gravity = .05;  
   
}
}

 

//play with gravity and friction coefficients as well as 
//think about adding object or variable to change direction
//i.e. foot kicking the other way, work with time machine modulus code

