
int choice;
int slide=0;
PFont font;
void setup()
{
  size(800,480);
  noStroke();  
};

void draw()
{
  background(0);
  font = loadFont("MiriamFixed-48.vlw");
  if(mousePressed && mouseX<400){
    fill(100,200,50);
    rect(0,0,400,480);
  };
  
  if(mousePressed && mouseX>400){
    fill(200,100,50);
    rect(400,0,400,480);
  };
  println(slide);
   if(slide==0)
  {
    fill(255);
    textAlign(CENTER,CENTER);
    textFont(font, 20);
    text("Do you know where it is?", 400, 200);
  };
  if(slide==1)
  {
    fill(255);
    textAlign(CENTER,CENTER);
    textFont(font, 20);
    text("Is it in your sock drawer?", 400, 200);
  };
  
  if(slide==2)
  {
    fill(255);
    textAlign(CENTER,CENTER);
    textFont(font, 20);
    text("Well, is it in your pockets?", 400, 200);
  };
   if(slide==3)
   {
    fill(255);
    textAlign(CENTER,CENTER);
    textFont(font, 20);
    text("Is it on the table?", 400, 200);
}
 if(slide==4){
  fill(255);
  textAlign(CENTER,CENTER);
    textFont(font, 20);
    text("Is it in the car?", 400, 200);}

 if(slide==5){
  fill(255);
  textAlign(CENTER,CENTER);
    textFont(font, 20);
    text("Is it in under the bed?", 400, 200);}

 if(slide==6){
  fill(255);
  textAlign(CENTER,CENTER);
    textFont(font, 20);
    text("Is it next to the computer?", 400, 200);}
  };
  
void mouseReleased(){
  if (mouseX<400){
    slide=0;
  }else{
  slide+=1;
  };
};
