
    float counter = 0;
    float amplitude = map(sin(counter),-1,1,0,100);

    void setup()
{
    size(500,500);
    background(255);
    smooth();  
}



    void draw()
{ 
    background(255);
    noFill();
    translate(250,250); 
  
   //IF-Abfrage
    println(mouseY);
    if (mouseX >125 && mouseY >0);
{
    if (mousePressed == true)
{
    fill(255);
    ellipse(-125,0,250,250);
    ellipse(+125,0,250,250);
    stroke(0);
    fill(amplitude);
    ellipse(+125,0,150,150);
    ellipse(-125,0,150,150);
}
    else
{
 
    //linkes Auge
    fill(255);
    ellipse(-125,0,250,250);
    stroke(0);
    fill(#325B83);
    ellipse(-125+(sin(counter)*70),0,100,100);
    println(sin(counter));
    counter +=0.05;
    fill(#D6A0A0);
    arc(-125,0,250,250,radians(180),radians(360));
  
   //rechtes Auge
    fill(255);
    ellipse(+125,0,250,250);
    stroke(0);
    fill(#325B83);
    ellipse(125+(sin(counter)*70),0,100,100);
    println(sin(counter));
    counter +=0.05;
    fill(#D6A0A0);
    arc(+125,0,250,250,radians(180),radians(360));
}
}
}
