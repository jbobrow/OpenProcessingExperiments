
float sferz;
//float qweuiop

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
    strokeWeight(10);
    stroke(random(234),random(150),random(200));
    point(sferz*5+0,0); //riattiva questo
    //line(0,0,500,500);
    sferz = sferz+PI/34;
    //line(sferz,sferz*5+7,sferz,sferz);
    
    
}
