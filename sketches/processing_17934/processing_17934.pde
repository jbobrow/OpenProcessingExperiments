
size(250,250);
background(0);



smooth();
stroke(200,150);
strokeWeight(1);
for(int i=20; i<300; i+=50)
{line(-250,0,i+i/5,250);
line(-40,0,i*0.9,250);}


smooth();
stroke(200,190);
strokeWeight(2);
for(int i=20; i<300; i+=40)
{line(-20,-59,i+i/5,250);
line(-30,400,i*0.9,250);}


smooth();
stroke(200,90);
strokeWeight(3);
for(int i=20; i<300; i+=50)
{line(20,-90,i+i/5,250);
line(-30,290,i*0.9,250);}




smooth();
stroke(200,90);
strokeWeight(3.3);
for(int i=20; i<300; i+=38)
{line(300,0,i+i/5,250);
line(-30,250,i*0.9,250);}



    strokeWeight(1);
stroke(240,70);
for(
int i=0; i<280; i+=5.9)
for(
int j=0; j<280; j+=5.9)
{
  line(i,j,i+random(5),j+5);
  line(i,j,i-random(5),j+5);
}




