
void setup () {

//panda 1
size(675,600);
background(248, 248, 255);

  PFont font; 
  
  font = loadFont ("Tahoma-48.vlw"); 
  fill (0); 
  textFont(font);
  smooth();

}

void draw () {
smooth();
strokeWeight(4);

fill(0);

pushMatrix();

PImage panda;
panda = loadImage("panda.jpg");
image(panda, 290, 0);

ellipse(90,130,50,50); //ear
strokeWeight(3);
fill(105,105,105); //left hand grey
ellipse(250,280,50,45);//left hand

strokeWeight(4);
fill(255);
ellipse(160,354,180,220); //body

popMatrix();

fill(255);
ellipse(150,170,130,150); //head

fill(0);
ellipse(250,300,50,45); //right hand 

fill(255);
strokeWeight(3);
ellipse(170,150,50,60); //white eye ball 
fill(0);
ellipse(180,150,30,50); //black eye ball 

strokeWeight(2);
fill(255, 105, 180);
ellipse(222,180,15,15); //nose

line(185, 130, 150, 95); //eyebrow 

//textbox 
strokeWeight(3);

int x = mouseX;
if (x < 300) {
  fill(255);
  rect(-1, 450, width+1, 600);
  fill(0);
  textSize(30);
  text ("I'm the real panda!", 30, 530);

}
if ( x > 290) {
  fill(255);
    rect(-1, 450, width+1, 600);
  fill(105);
  textSize(30);
  text ("Okay, okay...", 400, 530);

}
}

