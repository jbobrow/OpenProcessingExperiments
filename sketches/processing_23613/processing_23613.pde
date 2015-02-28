
int x= 200; 
int y= 150;
int randomX= 0;
float r;
float g;
float b;
float a;
int z = 0;
int speed = 1;
int xspeed = 60 ;
int yspeed = 70;

void setup() {
  size(400,400);
  frameRate(4);
  smooth();
}

void draw() {
  r = random(200);
  g = random(255);
  b = random(255);
  a = random(50);
 //  size(200,200);
  background(255,200,0);
    for (int w = width; w>5; w-=10) {   //background circles
      noStroke();
      fill(r,g,b,a);
      ellipse(x,y,w,w);
       }
//moving character
if (keyPressed) {
  //strokeWeight(2);
  stroke(255);
  x = x + xspeed;
  y = y + yspeed;
  if ((x > width/1.5 || x < 100)) {
    xspeed = xspeed * -1;
    println ("yayy! i'm moving!");
  }
  if ((y > height || y < 0)) 
    yspeed = yspeed * -1;
}

float ran= random(30,50);
println(ran);
  stroke(0);
  //head
  fill(255);
  ellipse(x,y,50,50);
  //body
  rect(x-2.5,y+25,5,80);
  //arms
  line(x-2.5,y+50,x-30,y+randomX);//left
  line(x+2.5,y+50,x+30,y+randomX);//right
  randomX = int(ran);
  println(randomX);
  //legs
  if (mousePressed) { //legs
    line(x-2.5,y+105,x-15,y+115);//left
    line(x+2.5,y+105,x+15,y+115);//right
         
    //rect(x-9,y+110,18,4);
  } 
  else {
    // rect(x-2,y+112,4,2);
    line(x-2.5,y+105,x+-2.5,y+115);//left
    line(x+2.5,y+105,x+2.5,y+115);//right
   }
  
if (mouseY<150) {
  fill(155);
  ellipse(x-10,y+10,10,10);//left eye
  ellipse(x+10,y+10,10,10);//right eye
}else{
  fill (255,155,0);
  ellipse(x-10,y+10,5,5);//left eye
  ellipse(x+10,y+10,5,5);//right eye
//}else if
 // fill(0,155,155);
 // ellipse(x-10,y+10,7,);//left eye
  //ellipse(x+10,y+10,7,7);//right eye*/

   
}
}


