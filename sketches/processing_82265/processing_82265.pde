
size(400,400);
background(0);

stroke(255);
strokeWeight(1);

for(int posx=1; posx<=150; posx=posx+20)
{
for(int posy=1; posy<=150; posy=posy+20)
{
line(1,posx,399,posy); 
line(posx,1,posy,399);
}
}

strokeWeight(1);

for(int post=250; post<=401; post=post+20)
{
for(int posp=250; posp<=401; posp=posp+20)
{
line(1,post,399,posp);
line(post,1,posp,399);
}

}



