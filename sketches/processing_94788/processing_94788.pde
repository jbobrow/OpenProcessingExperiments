
void setup()   
{
size(400,400); //window 400pX400p
}

void draw()
{

  background(#FEFBFC); // color of background
  fill(#A5FF00);
  noStroke();

fill(mouseX,mouseY,200);
ellipse(200,300,200,200);//lower body
ellipse(200,150,150,150);//middle body part
ellipse(200,50,100,100);//head

fill(#43B83D);
ellipse(200,125,25,25);//top button
ellipse(200,175,25,25);//2nd button
ellipse(200,225,25,25);//3rd button
ellipse(200,275,25,25);//4th button
ellipse(180,30,15,15);//eyeball
ellipse(220,30,15,15);//eyeball

fill(#000000);
triangle(210,60,210,45,270,50);//nose
stroke(#392007);
strokeWeight(15);
line(15,15,125,125);//left arm
line(385,15,270,125);//right arm
line(45,45,50,15); // fingers
line(45,45,10,50); // fingers
line(350,45,355,15); // left fingers
line(385,45,355,48); // left fingers

}





  

 


