
// Will Slotterback Palindrome Checker CP1 16/17
void setup()
{
  String lines[] = loadStrings("palindrome.txt");
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
String RemoveNonAlpha(String str)
{
  String AlphaOnly = "";
  for (int i = 0; i < str.length(); i++)
  {
    if (str.charAt(i)!= ' ' && str.charAt(i)!= ',' && str.charAt(i) != '!' && str.charAt(i) != '\'')
    {
      AlphaOnly= AlphaOnly + str.charAt(i);
    }
  }
  return AlphaOnly;
}
boolean palindrome(String word)
{
  int first = 0;
  word = RemoveNonAlpha(word.toLowerCase());
  int last = word.length()-1;
  while (first <= last)
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
