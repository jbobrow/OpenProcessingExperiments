
boolean button = false;
int r = 9;
int g = 253;
int b = 78;

void setup()
{
  size(600,600);
  smooth();
  strokeWeight(2);
  println("setup has been run");
}

void draw()
{ 
  background(0);


  if (button){

    //colour change
    if (mouseX < width/2){
      g = g - 8;
    }
    else if (mouseX > width/2){
      g = g + 8;
    }
    else {
      g = g;
    }

    if (mouseY < height/2){
      r = r - 8;
    }
    else if (mouseY > height/2){
      r = r + 8;
    }
    else {
      r = r;
    }

    r = constrain (r,0,255);
    g = constrain (g,0,255);
    //b = constrain (b,0,255)

    //feet
    fill(200);
    triangle(150,550,240,475,220,430);
    triangle(450,550,360,475,380,430);

    //eye open
    fill(255);
    ellipse(mouseX,mouseY-200,250,140);

    //pupil
    fill(0);
    ellipse(mouseX,mouseY-200,60,120);

    //neck moving
    fill(r,g,b);
    quad(mouseX-20,(mouseY-200),mouseX+20,(mouseY-200),320,400,280,400);

    //body
    ellipse(300,420,210,130);

    //head moving
    ellipse(mouseX,mouseY-200,270,200);

    //eye moving
    fill(255);
    ellipse(mouseX,mouseY-200,250,140);

    //pupil moving
    fill(0);
    ellipse(mouseX,mouseY-200,60,120);

  }

  else {

    //doesn't work for reset
    r = 9;
    g = 253;
    b = 78; 

    //feet
    fill(200);
    triangle(150,550,240,475,220,430);
    triangle(450,550,360,475,380,430);

    //neck static
    fill(r,g,b);
    quad(280,200,320,200,320,400,280,400);

    //head static
    ellipse(300,180,270,200);

    //body
    ellipse(300,420,210,130);

    //eye closed
    fill(r,g,b);
    ellipse(300,180,250,140);
    fill(0);
    stroke(0);
    rect(175,180,250,1); 
  }


}

void mousePressed(){

  if (mousePressed) {
    button = !button;
  }
}


