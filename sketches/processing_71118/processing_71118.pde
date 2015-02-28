
//Eugene Liang, Functions and Animation, CP1, Mods 16-17
//http://opagungnamstyle.webs.com/Computer Programing/FunctionsNAnimation.html

int num1 = 350;
int num2 = 50;
int change1 = 15;
int change2 = 12;

void setup()
{
  size(500,500);
}

void draw()
{
  gun();
  waves();
}

//GUN
void gun()
{
  smooth();
  fill(255,255,255);
  rect(430,200,15,60);
  rect(360,193,80,10);
  ellipse(425,200,85,45);
  fill(37,255,5);
  ellipse(360,200,25,25);
  fill(28,90,211);
  curve(350,190,400,183,400,217,350,210);
  curve(350,190,420,178,420,222,350,210);
  curve(380,190,443,180,443,220,380,210);
}


//gun signals
void waves()
{
  noFill();
  frameRate(8);
  if(num1 > 0)
  {
    ellipse(num1,200,25,num2);
    num1 = num1 - change1;
    num2 = num2 + change2;
  }
  if(num1 < 0)
  {
   background(179);
    gun();
    num1 = 350;
    num2 = 50;
  }
}
