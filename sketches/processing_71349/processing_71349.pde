
int posX;
int posY;
int speed;
int eyes;
int change;
int value;
void setup(){
  
  size (600,600);
  posX=50;
  posY= 120;
  speed=2;
  eyes=20;
  change= 5;
  value =0;
  
 
  
}
void draw (){
  
  
 
   background (124,217,245);
 //first pink fish
 if (keyPressed) {
    if (key == 'b' || key == 'B') {
      fill(249,250,68);
    }
  } else {
    fill(250,68,229);
  }
  
  triangle (100,170,140,140,100,110);
  ellipse (140,140,40,30);
 
 
  ellipse (160,133,10,15);
  
   stroke (0,0,0);
  fill(0,0,0);
  ellipse (160,133,5,7);
  
  noStroke();
  fill(225,0,0);
  ellipse (160,145,8,5);
  
     noStroke();
  fill(225,0,0);
  ellipse (160,140,8,5);
  
  
  //second pink fish
  
  if (keyPressed) {
    if (key == 'f' || key == 'F') {
      fill(249,250,68);
    }
  } else {
    fill(250,68,229);
  }
  
  triangle (20,270,90,240,20,210);
  ellipse (90,240,70,60);
 
 
  ellipse (120,220,20,18);
  
   stroke (0,0,0);
  fill(0,0,0);
  ellipse (120,220,10,9);
  
  noStroke();
  fill(225,0,0);
  ellipse (125,237,15,11);
  
     noStroke();
  fill(225,0,0);
  ellipse (125,243,15,11);
  
  //3rd pink fish
  
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      fill(167,109,250);
    }
  } else {
    fill(250,68,229);
  }
  
  triangle (3,420,82,450,3,470);
  ellipse (50,450,60,40);
 
 
  ellipse (77,434,20,18);
  
   stroke (0,0,0);
  fill(0,0,0);
  ellipse (77,434,10,9);
  
  noStroke();
  fill(225,0,0);
  ellipse (79,446,10,6);
  
     noStroke();
  fill(225,0,0);
  ellipse (79,450,10,6);


  
//first fish
stroke(255,155,23);
fill(255,155,23);
  triangle (1,150,50,120,1,100);
  ellipse (50,120,70,50);
 
  stroke (225,225,225);
  fill(225,225,225);
  ellipse (82,110,10,15);
  
   stroke (0,0,0);
  fill(0,0,0);
  ellipse (82,110,5,7);
  
  stroke (225,0,0);
  fill(225,0,0);
  ellipse (88,120,8,5);
  
    stroke (225,0,0);
  fill(225,0,0);
  ellipse (88,125,8,5);
  
  
  //second fish 
  
  stroke(255,155,23);
fill(255,155,23);
  triangle (2,370,50,340,1,320);
 
  ellipse (50,340,80,50);
 
  stroke (225,225,225);
  fill(225,225,225);
  ellipse (89,330,10,15);
  
   stroke (0,0,0);
  fill(0,0,0);
  ellipse (90,330,5,7);
  
  stroke (225,0,0);
  fill(225,0,0);
  ellipse (90,340,8,5);
  
    stroke (225,0,0);
  fill(225,0,0);
  ellipse (90,345,8,5);
  
  //3rd fish
  
  
  stroke(255,155,23);
fill(255,155,23);
  triangle (2,570,50,540,1,520);
 
  ellipse (50,540,70,80);
 
  stroke (225,225,225);
  fill(225,225,225);
  ellipse (82,530,10,15);
  
   stroke (0,0,0);
  fill(0,0,0);
  ellipse (82,530,5,7);
  
  stroke (225,0,0);
  fill(225,0,0);
  ellipse (88,540,8,5);
  
    stroke (225,0,0);
  fill(225,0,0);
  ellipse (88,545,8,5);
  
  
  
   
  //4th fish
  
  
  stroke(255,155,23);
fill(255,155,23);
  triangle (40,400,70,400,40,420);
 
  ellipse (80,400,40,30);
 
  stroke (225,225,225);
  fill(225,225,225);
  ellipse (95,390,10,15);
  
   stroke (0,0,0);
  fill(0,0,0);
  ellipse (95,390,5,7);
  
  stroke (225,0,0);
  fill(225,0,0);
  ellipse (100,400,8,5);
  
    stroke (225,0,0);
  fill(225,0,0);
  ellipse (100,405,8,5);
  
    
//5th fish
stroke(255,155,23);
fill(255,155,23);
  triangle (40, 90,70,70,40,40);
  ellipse (70,70,40,30);
 
  stroke (225,225,225);
  fill(225,225,225);
  ellipse (90,63,7,10);
  
   stroke (0,0,0);
  fill(0,0,0);
  ellipse (90,63,2,7);
  
  stroke (225,0,0);
  fill(225,0,0);
  ellipse (90,70,8,5);
  
    stroke (225,0,0);
  fill(225,0,0);
  ellipse (90,73,8,5);
  
 

  
  //shark 
noStroke();
fill(19,30,229);
  triangle (600,250,600,400,400,250);
 
  ellipse (450,300,300,200);
 
  stroke (225,225,225);
  fill(225,225,225);
  ellipse (330,270,25,30);
  
   stroke (0,0,0);
  fill(0,0,0);
  ellipse (330,270,10,15);
  
  stroke (124,217,245);
  fill (124,217,245);
triangle (300,450,250,300,400,300);
noStroke();
fill(19,30,229);
triangle (450,150,400,250,500,250);

  
    
 
      //mouse bubble 
stroke (0,200,245);
    fill(50,217,245,200);
  ellipse (mouseX, mouseY, 100, 90);
  
 //bubbles & line
  
    stroke (0,200,245);
    fill(50,217,245,200);
    ellipse (posX,posY, 10,10);
    line(width/2,0,width/2,height);
    ellipse (posX,350,10,10);
    ellipse (posX,550,15,15);
    ellipse (posX,400,10,10);
    ellipse (posX,70, 15,15);
     ellipse (posX,140, 10,10);
 ellipse (posX,240, 10,10);
 ellipse (posX,450, 15,12);
    //pos=posX+2
  posX+=speed;
  
  if ((posX+5)> width/2 || (posX-52) <0){
    //speed=speed*=1;
    speed*=-15;
  }

 else if (posX<0){
   //speed*=-1;
   speed*=5;
   
  

 
}
}



