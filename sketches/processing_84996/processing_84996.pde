
void setup()
{size(500,500);
background(#F7AA0F); 
fill(255);
noStroke();
smooth();}
  
void draw(){


//ellipse(width/2,height/2,width,height); }

//Pour faire une ligne de cercles j'ajoute 50 pixels à la coordonnée x
/*ellipse(25,25,50,50);
ellipse(75,25,50,50);
ellipse(125,25,50,50);
ellipse(475,25,50,50);*/

//boucle for (pour faire la ligne de cercles plus simplement)

fill(25,70,20,10);
noStroke();
for(int posx=25; posx<=475; posx=posx+50)
{
for(int posy=25; posy<=475; posy=posy+50)
{
ellipse(posx,posy,50,50); }
}
/*fill(255);
for(int posx=20; posx<=475; posx=posx+50)
{
for(int posy=20; posy<=475; posy=posy+50)
{
{rect(posx,posy,10,10);}

}

}*/
//text("prune", 50,50);

for(int posx=25; posx<=475; posx=posx+50)
{
  for(int posy=30; posy<=480; posy=posy+50)
  {
    
    fill(#40A245);
    ellipse(posx,posy,40,40);}
}

for(int posx=25; posx<=475; posx=posx+50)
{
  for(int posy=35; posy<=485; posy=posy+50)
  {
    
    fill(#44F70F);
    ellipse(posx,posy,30,30);}
}
}



