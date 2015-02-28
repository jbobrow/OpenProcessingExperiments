
//Michelle Z, CP1 4-5, Buses and Taxis

int i;
int j;
int y = 0;
size(500,500);
background(255);
fill(0);

String people[] = loadStrings("people.txt");
for (int num = 0; num < people.length; num++)
{
  i = int(people[num]);
  j = ((i%50)/5) + (((i%50)%5)/4) + ((((i%50)%5)%4)/3) + (((((i%50)%5)%4)%3)/2) + ((((((i%50)%5)%4)%3)%2)/1);
  textSize(15);
  textAlign(CENTER);
  text("To transport " +i+ " people you will need " +i/50+ " buses and " +j+ " taxis.", 250, 50+y);
  y = y + 35;
} 

