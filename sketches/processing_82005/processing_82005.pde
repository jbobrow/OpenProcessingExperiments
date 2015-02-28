
void setup()
{
  String lines[] = loadStrings("palindrome.txt");
  println("there are " + lines.length + " lines");
  for (int i=0; i < lines.length; i++) 
  {
    if (palindrome(lines[i])==true)
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
  int first =0;
  int last = word.length() - 1;
  for (int i=0; i < word.length(); i++)
  {
    if (word.charAt(first) != word.charAt(last)) 
    {
      return false;
    }
    else
    {
      first++;
      last--;
    }
  }
  return true;
}
String stripNonAlpha(String word)
{
  String noSpace = "";
  for (int i=0; i<word.length(); i=i+1)
  {
    if (word.charAt(i) != ' ' && word.charAt(i) != '!' && word.charAt(i) != ',' && word.charAt(i) != '\'')
    {
      noSpace = noSpace + word.charAt(i);
    }
  }
  return noSpace.toLowerCase();
}



