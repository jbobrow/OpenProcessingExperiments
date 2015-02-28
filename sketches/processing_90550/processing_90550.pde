
size(600,600);
String[] Lines ;
Lines = loadStrings("input.txt");
for ( int i=0 ; i< Lines.length ; i++)
{
  String[] Words = Lines[i].split(" ");
  for ( int j = 0 ; j< Words.length; j++)
  {
  println( Words[j]);
  fill( int(Words[j])*10);
  rect( 100 + j*100, 100+ i*100, 100,100);
  }
}



