
//Hannah Abdel, CP1, Mods 4-5
String [] answers = {" of course " , " probably " , " doubt it " , 
" better not tell you now " , " concentrate and ask again " , " no " , 
" yes " , " maybe " , " outlook good " , " outlook bad " , "Why would you ask that? " ,
" NO WAY " , " DEFINITELY " , " cannot predict now " , " outlook hazy " , " I cannot answer that "};
boolean mode = false;
void setup()
{
  noLoop();
  size(300,300);
  smooth();
  background(15,206,137);
  
}
void draw()
{

  if(mode == true)
  {
    fill(0);  
  ellipse(150,150,200,200);
  
  strokeWeight(4);
  fill(255);
  ellipse(150,100,80,60);
  ellipse(150,85,30,20);
  ellipse(150,110,40,30);
  textSize(15);
  text(answers[(int(random(0,15)))],150,200);
  
  }
  if (mode == false)
  {
  fill(0);
  ellipse(150,150,200,200);
  strokeWeight(4);
  fill(255);
  ellipse(150,100,80,60);
  ellipse(150,85,30,20);
  ellipse(150,110,40,30); 
  textSize(30);
 textAlign(CENTER);
   text("Ask my anything", 150,290);  
  }

}
    

void mousePressed()
{
  mode = true;
 
  redraw();
}


