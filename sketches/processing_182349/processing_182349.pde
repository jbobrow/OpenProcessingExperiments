
void setup()
{
  size(1000,600);
  background(255);
  sferz = 2;
  //qwertuio
  
}

void draw()
{
  translate(width/2,height/2);
  //rect(0,0,sferz,sferz);
  
  
    //translate(500,300);
    rotate(sferz);
    strokeWeight(1);
    //stroke(random(234),random(150),random(200));
    //stroke(random(255));
    stroke(0);
    //point(sferz*5+0,0); //riattiva questo
    //line(0,0,500,500);
    sferz = sferz+PI/2;
    //line(sferz,sferz*5+7,sferz,sferz);
    //triangle(sferz+10,sferz+15,sferz+20,sferz+25,sferz+30,sferz+35);
    //translate(width/2,height/2);
    ellipse(mouseX-500,mouseY-300,80,80);
    
}
