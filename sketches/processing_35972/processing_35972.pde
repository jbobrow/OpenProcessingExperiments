
void setup( )
{
  size(500, 500);
  background(255);
  smooth();

 
  noFill();
  stroke(0);
  background(32,255,119);
  {
    fill(33,255,255);
  arc(190, 200, 190, 250, 0, PI/2);//facebase
  }
  {
    stroke(33,255,255);
    fill(33,255,255);
    rect(80,150,198,50);
    rect(80,180,110,180);
  }
  {
    stroke(0);
    fill(0,0,0);
    ellipse(150,220,60,60);//eye outer
    ellipse(250,220,60,60);
  }
  {
    fill(223,180,0);
  ellipse(150,220,40,40);//eye inner
  ellipse(250,220,40,40);
  }
  line(140,280,240,280);//glasses bridge
  {
    fill(255,177,159);
    ellipse(130,280,30,30);//cheek
  }
  {
    fill(0,96,84);
    triangle(190,230,220,250,180,260);//nose
  }
  {
    fill(0,0,0);
    rect(80,90,200,100);
  }
  {
    fill(191,43,0);
    curve(80,227,100,101,197,176,56,293);//hair1
    curve(202,292,273,89,167,176,291,298);//hair2
  }
  {
    fill(0,0,0);
    rect(170,210,50,20);
  }
  line(280,90,280,230);
  line(180,220,220,220);
  line(180,230,220,230);//headextend
  line(80,89,280,89);//headtop
  line(80,89,80,350);//headleftandneck
  {
    fill(160,160,169);
    ellipse(60,350,80,30);//leftshouldermail
    ellipse(250,350,80,30);//rightshouldermail
  }
  {
    fill(0,63,96);
    triangle(95,360,155,400,230,360);//mailcenter
  }
}

                
                
