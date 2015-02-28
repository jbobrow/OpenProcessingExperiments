
float x, y;
void setup()
{
size(800,800);
smooth();
x= width/2;
y= height/2;
strokeWeight(0.2);
}


void draw()
{
  fill(0,20);
  rect(0,0,width,height);
  stroke(200);
  noFill();
  
  float mouseDist= dist(mouseX, mouseY,x,y);
  float num = map(mouseDist,300,0,0,10);
  
  num=constrain(num,0,10);
 
      float xscaler = map(mouseDist, 800,0, -5, 5);
      float yscaler = map(mouseDist, 800,0, -5, 5);
      x+=xscaler;
      y+=yscaler;
  
    if(mousePressed == true)
  {
    if(mouseButton == LEFT)
  {
    fill(37,83,152);
  }
  else
  {
    fill(128,198,230);
  }
}
  
beginShape();
vertex(x-371+random(-num,num),y-400+random(-num,num));
vertex(x+8+random(-num,num),y-22+random(-num,num));
vertex(x+85+random(-num,num),y-100+random(-num,num));
vertex(x-217+random(-num,num),y-400+random(-num,num));
endShape(CLOSE);

beginShape();
vertex(x-155+random(-num,num),y-400+random(-num,num));
vertex(x+116+random(-num,num),y-131+random(-num,num));
vertex(x+178+random(-num,num),y-193+random(-num,num));
vertex(x+78+random(-num,num),y-291+random(-num,num));
vertex(x+186+random(-num,num),y-400+random(-num,num));
endShape(CLOSE);

beginShape();
vertex(x-400+random(-num,num),y+260+random(-num,num));
vertex(y-271+random(-num,num),y+132+random(-num,num));
vertex(x-356+random(-num,num),y+48+random(-num,num));
vertex(x-340+random(-num,num),y+33+random(-num,num));
vertex(x-294+random(-num,num),y+79+random(-num,num));
vertex(x-232+random(-num,num),y+17+random(-num,num));
vertex(x-400+random(-num,num),y-150+random(-num,num));
endShape(CLOSE);

beginShape();
vertex(x-400+random(-num,num),y-364+random(-num,num));
vertex(x-170+random(-num,num),y-137+random(-num,num));
vertex(x-248+random(-num,num),y-60+random(-num,num));
vertex(x-400+random(-num,num),y-211+random(-num,num));
endShape(CLOSE);

  if(mousePressed == true)
  {
    if(mouseButton == LEFT)
  {
    fill(128,198,230);
  }
  else
  {
    fill(37,83,152);
  }
}

beginShape();
vertex(x+400+random(-num,num),y-183+random(-num,num));
vertex(x+293+random(-num,num),y-77+random(-num,num));
vertex(x+193+random(-num,num),y-177+random(-num,num));
vertex(x+131+random(-num,num),y-115+random(-num,num));
vertex(x+400+random(-num,num),y+152+random(-num,num));
endShape(CLOSE);

beginShape();
vertex(x+400+random(-num,num),y+215+random(-num,num));
vertex(x+100+random(-num,num),y-84+random(-num,num));
vertex(x+22+random(-num,num),y-7+random(-num,num));
vertex(x+400+random(-num,num),y+369+random(-num,num));
endShape(CLOSE);

beginShape();
vertex(x+138+random(-num,num),y+170+random(-num,num));
vertex(x+368+random(-num,num),y+400+random(-num,num));
vertex(x+214+random(-num,num),y+400+random(-num,num));
vertex(x+60+random(-num,num),y+248+random(-num,num));
endShape(CLOSE);

beginShape();
vertex(x+150+random(-num,num),y+400+random(-num,num));
vertex(x-16+random(-num,num),y+232+random(-num,num));
vertex(x-79+random(-num,num),y+293+random(-num,num));
vertex(x-33+random(-num,num),y+340+random(-num,num));
vertex(x-48+random(-num,num),y+354+random(-num,num));
vertex(x-132+random(-num,num),y+271+random(-num,num));
vertex(x-261+random(-num,num),y+400+random(-num,num));
endShape(CLOSE);

  if(mousePressed == true)
  {
    if(mouseButton == LEFT)
  {
    fill(24,59,114);
  }
  else
  {
    fill(255,255,255);
  }
}

beginShape();
vertex(x-400+random(-num,num),y+400+random(-num,num));
vertex(x-400+random(-num,num),y+293+random(-num,num));
vertex(x-240+random(-num,num),y+132+random(-num,num));
vertex(x-278+random(-num,num),y+94+random(-num,num));
vertex(x-216+random(-num,num),y+33+random(-num,num));
vertex(x-32+random(-num,num),y+216+random(-num,num));
vertex(x-94+random(-num,num),y+278+random(-num,num));
vertex(x-132+random(-num,num),y+240+random(-num,num));
vertex(x-293+random(-num,num),y+400+random(-num,num));
endShape(CLOSE);

beginShape();
vertex(x+124+random(-num,num),y+155+random(-num,num));
vertex(x+45+random(-num,num),y+232+random(-num,num));
vertex(x-233+random(-num,num),y-44+random(-num,num));
vertex(x-154+random(-num,num),y-122+random(-num,num));
endShape(CLOSE);

beginShape();
vertex(x+217+random(-num,num),y-400+random(-num,num));
vertex(x+109+random(-num,num),y-292+random(-num,num));
vertex(x+193+random(-num,num),y-208+random(-num,num));
vertex(x+384+random(-num,num),y-400+random(-num,num));
endShape(CLOSE);

beginShape();
vertex(x+400+random(-num,num),y-382+random(-num,num));
vertex(x+208+random(-num,num),y-192+random(-num,num));
vertex(x+293+random(-num,num),y-109+random(-num,num));
vertex(x+400+random(-num,num),y-213+random(-num,num));
endShape(CLOSE);
}


