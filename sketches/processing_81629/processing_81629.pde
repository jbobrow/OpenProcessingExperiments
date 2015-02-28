
//Maddy C CP1 14/15 palindrome
void setup()
{
  String lines[] = loadStrings("palindrome.txt");
  println("there are " + lines.length + " lines");
  for (int i=0; i < lines.length; i++) 
  {
    if(palindrome(lines[i])==true)
    {
      println(lines[i] + " IS a palidrome.");
    }
    else
    {
      println(lines[i] + " is NOT a palidrome.");
    }
  }
}
boolean palindrome(String word)
{
  word = stripNonAlpha(word);
  word = word.toLowerCase();
  
  int i=0;
  while(i<word.length())
  {
    if(word.charAt(i) == word.charAt(word.length()-(i+1)))
    {
      i++;
    }
    else 
    {
      return false;
    }
  }
  return true;
}
String stripNonAlpha(String word)
{
  String blah= "";
  for(int i=0;i<word.length(); i++)
  {
    if(word.charAt(i)!= ' ' && word.charAt(i)!= ',' && word.charAt(i) != '!' && word.charAt(i) !='\'')
    {
      blah = blah+word.charAt(i);
    }
  }
  return blah;
}
