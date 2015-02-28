
//sets size of doc
size(250,250);
//background color
background (255);
//loop to repeat each of the quadrants(topleft,topright,botleft,botright)
for(int a=10;a<120;a+=20) {
//top right
line(125,a,a+130,125);
//bottom right
line(a+130,125,125,250-a);
//second half

//bottom left
line(125,a+130,a,125);
//bottom right
line(125,-a+120,a,125);
}



                
