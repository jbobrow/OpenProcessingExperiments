
void setup()
{
  size(640,480);
  //bookshelf outer
  fill(99,60,14);
  rect(220,100,200,300);
  
  //bookshelf inner
  fill(71,44,13);
  rect(230,110,180,280);
  
  //bookshelf backboard
  fill(59,34,6);
  rect(260,140,120,220); 

  //drawing lines
  line(230,110,260,140);
  line(410,110,380,140);
  line(230,390,260,360);
  line(410,390,380,360);

  //draw shelf
  //topshelf
  fill(99,60,14);
  rect(230, 195, 180,10);  
  
  //bottomself
  fill(99,60,14);
  rect(230, 294, 180,10);

  //bottom part of topshelf
  fill(92,56,13);
  beginShape();
    vertex(230,206);
    vertex(261,214);
    vertex(381,214);
    vertex(410,206);
  endShape(); 
 
   //top part of bottomshelf
    fill(92,56,13);
    beginShape();
      vertex(230, 294);
      vertex(260,282);
      vertex(380,282);
     vertex(410,294);     
    endShape(); 
}

void draw()
{
  println(mouseX + "," + mouseY);
}


