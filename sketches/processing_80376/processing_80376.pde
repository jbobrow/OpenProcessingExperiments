
//Sarah Anderson, seanders
//hw7a, dag buttons
color  black, white;
//false is black, true is white
boolean [] topSq ={false,false,false,false,false};
boolean [] botSq ={true,true,true,true,true};


void setup()
{
size (500,200); 
black= color(0);
white=color(255);
}

void draw()
{ 
background(180);  
drawButtons();

}

void mousePressed()
{
//Top 1  
if(dist(50,50,mouseX,mouseY)<=50)
  {
    topSq[0]=true;
  }
//Bot 1
if(dist(50,150,mouseX,mouseY)<=50)
  {
    botSq[0]=false;
  }
//Top 3
if(dist(250,50,mouseX,mouseY)<=50)
  {
    topSq[2]=!topSq[2];
  } 
//Bot 3
if(dist(250,150,mouseX,mouseY)<=50)
  {
    botSq[2]=!botSq[2];
  }  
//Top 5
if(dist(450,50,mouseX,mouseY)<=50)
  {
    topSq[4]=true;
  } 
//Bot 5
if(dist(450,150,mouseX,mouseY)<=50)
  {
    botSq[4]=false;
  }
}

void mouseReleased(){
//Top 1  
if(dist(50,50,mouseX,mouseY)<=50)
  {
    topSq[0]=false;
  } 
//Bot 1
if(dist(50,150,mouseX,mouseY)<=50)
  {
    botSq[0]=true;
  }
//Top 2
if(dist(150,50,mouseX,mouseY)<=50)
  {
    topSq[1]=!topSq[1];
  } 
//Bot 2
if(dist(150,150,mouseX,mouseY)<=50)
  {
    botSq[1]=!botSq[1];
  } 
//Top 4 
if(dist(350,50,mouseX,mouseY)<=50)
  {
    topSq[3]=true;
  }
//Bot 4
if(dist(350,150,mouseX,mouseY)<=50)
  {
    botSq[3]=false;
  }
}



void drawButtons()
{
drawTopSq();  
drawBotSq();
drawTopText(white);  
drawBotText(black);  
}


void drawTopSq()
{
  int x=0;
  for (int i=0; i<topSq.length; i++){  
    if(topSq[i]==false){
      fill(0);
      stroke(255);  
    }
    if(topSq[i]==true){
      fill(255);
      stroke(0);  
    }
  rect(x,0,100,100);
  x+=100;
  }
}

void drawBotSq()
{
int x=0;
  for (int i=0; i<botSq.length; i++){  
    if(botSq[i]==false){
      fill(0);
      stroke(255);  
    }
    if(botSq[i]==true){
      fill(255);
      stroke(0);  
    }
  rect(x,100,100,100);
  x+=100;
  }
}

void drawTopText(color colW)
{
textSize(20); 
fill(colW);
text("↑", 50,50);
text("↓", 50, 50);
text("↑↑", 150, 50);
text("↓↓", 250, 50);
text("↑", 350, 50);
text("↓", 450, 50);
}
void drawBotText(color colB)
{
fill(colB);
text("↑", 50,150);
text("↓", 50, 150);
text("↑↑", 150, 150);
text("↓↓", 250, 150);
text("↑", 350, 150);
text("↓", 450, 150);
}
