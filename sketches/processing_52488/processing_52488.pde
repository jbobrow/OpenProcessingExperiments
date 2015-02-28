
//Drawing my alien, Chester

boolean press = true;

void setup() {
ellipseMode(CENTER);
rectMode(CENTER);
size(500,500);
background(2,3,42); //color: midnight blue
}

void draw() {
//body/chest
stroke(255); 
fill(166,209,127); //color: green
rect(100,100,20,100);
fill(0,188,165); //color:aqua
stroke(247,202,124); //yellow
strokeWeight(4);
for(int y = 50; y <= 150; y+=10)
  line(91,y,109,y);
  
//head and eyes
stroke(255);
strokeWeight(1);
ellipse(100,70,60,60);
fill(0);
ellipse(81,70,16,32);
ellipse(119,70,16,32);
fill(255);
ellipse(83,60,4,4);
ellipse(121,60,4,4);

//laser eye thing
//fill(182,13,31);
int x = mouseX;
int y = mouseY;
int z = (int)random(10,250);
fill(x,y,z);
ellipse(100,55,10,10);
fill(x-20,y-20,z-20);
stroke(x-25,y-25,z-25);
ellipse(101,54,3,3);

//mouth and teeth
stroke(0);
line(93,85,107,85);
fill(255);
stroke(255);
triangle(94,86,96,89,98,86);
triangle(102,86,104,89,106,86);

//limbs
line(90,150,80,160);
line(80,160,80,170);
line(110,150,120,160);
line(120,160,120,170);

//tentacles
//increase stroke width?
stroke(0,188,165);
line(90,90,80,100);
line(110,90,120,100);

//ear things
stroke(255,208,136);
line(120,48,135,42);
line(80,48,65,42);

//println("Greetings. I be Chester");
}

//flap wings
void mousePressed(){
  stroke(0);
  if (press == true) {
    fill(85,18,99);
    triangle(111,115,170,90,155,120);
    triangle(89,115,30,90,40,120);
    fill(2,3,42);
    triangle(112,115,170,120,155,140);
    triangle(88,115,30,120,40,140);
  }
  else {
    fill(2,3,42);
    triangle(111,115,170,90,155,120);
    triangle(89,115,30,90,40,120);
    fill(85,18,99);
    triangle(112,115,170,120,155,140);
    triangle(88,115,30,120,40,140);
  }
  press=!press;
}

void keyPressed() {
  if(key=='s'){ 
    saveImage();
  }
  if (key==' '){
    exit();
  }
}


