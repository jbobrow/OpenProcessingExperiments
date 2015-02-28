
//Victória Yumi Shimakawa

size(200, 200);
background(37, 214, 55);


strokeWeight(2);
stroke (255);
smooth();
for (int i = 0; i<8; i++)
{ 
  line (width/8, height/8, width-width /(i+2)-100, width -i*23);
  line (width/2+80, height/8, 100-(width-width /(i+2)-width), width -i*23);
}
