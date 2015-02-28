
float x;
PFont text1;
  int size1=40;


void setup()
{
  size(600,600);
background(0);


text1= loadFont("Futura-CondensedExtraBold-48.vlw");
textFont(text1);

}


void draw()
{
  
fill(255,42);
stroke(0,255,45,45);
translate(mouseX,mouseY);
text("Draw",0,0);


}

void keyReleased(){
  if(key==CODED){
if(keyCode==DOWN)
{
  size1+=10;
  textSize(size1);
}

else if(keyCode==UP)
{
  size1-=10;
  textSize(size1);
}

else if(keyCode==RIGHT)
{
    x+=.05;
    rotate(x);

 
}
  }
}


