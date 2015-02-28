
// Abby Zhang mod ; 4,5 CP1
String people[] = loadStrings("list.txt");
int b = 50;
int t = 5;
println("There are " + people.length+ " lines");
for(int x=0; x<people.length; x++)
{
  b= (int(people[x]))/50;
  t= (int(people[x]))P/5;
    if ((int(people[x]))%5 >0)
   {
    t=t+1;
   }
  println("To transport "+ people[x] + " people you will need "+ b +" buses and "  + t + " taxis.");
}
