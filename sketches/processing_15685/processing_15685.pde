

PImage totoro;
int ypos = 400;

void setup()
{
  size(800, 800);

  totoro = loadImage("Totoro.jpg");
}

void draw(){
  background(10,100,100);

//this is the loop that changes the ypos
  for(int ypos = 0; ypos < 800; ypos = ypos +201){

 //this is the loop that changes the xpos
  for(int xpos = 0; xpos < 800; xpos = xpos + 136){
   fill(50,200,ypos,230);
   //put xpos or ypos in part of fill to get gradient
   rect(xpos,ypos,70,200);
   fill(265,100,xpos,100);
   ellipse(xpos-30,ypos+10,50,20);
   tint(155,155);
   image(totoro,xpos,ypos);
  }

  }
  

}



