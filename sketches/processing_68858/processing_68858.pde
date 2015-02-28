
//Maddy C Loop CP1 mods 14/15
size(400,400); 
smooth();
noFill();
strokeWeight(4);
int blu = 255; 
int siz = 1;
while(siz<600)
{
  stroke(0,0,blu);
  ellipse(200,200,siz,siz);
  blu=blu-1;
  siz=siz+1;
}
