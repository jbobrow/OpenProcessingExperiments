
//Michelle Z, CP1 4-5, Palindrome Checker

int y = 0;
int k = 0;
int num = 0;
boolean palindrome = false;

void setup()
{
  size(300, 300);
  background(255);
  textAlign(CENTER);
  String lines[] = loadStrings("palindrome.txt");
  for (int j = 0; j < lines.length; j++)
  {
    fill(0);
    if (palindrome(lines[j]) == true)
    {
      text((lines[j]) + " IS a palindrome.", 157, 85+y);
    }
    else
    {
      text((lines[j]) + " is NOT a palindrome.", 157, 85+y);
    }
    y = y + 25;
  }
}

boolean palindrome(String word)
{
  String stripped = "";
  for (int i=0; i < word.length(); i++)
  {
    if (word.charAt(i) != '!' && word.charAt(i) != ',' && word.charAt(i) != ' ' && word.charAt(i) != '.' && word.charAt(i) != '\'')
    {
      stripped = stripped + word.charAt(i);
    }
    stripped = stripped.toLowerCase();
  }
  while (k < stripped.length ())
  {
    if (stripped.charAt(num) == stripped.charAt(stripped.length() - (num + 1)))
    {
      println(num + " : " + (stripped.length() - (num + 1)) + " : " + (stripped.length()) + " : " + (stripped.charAt(num)) + " : " + (stripped.charAt(stripped.length() - (num + 1))));
      num++;
      k++;
    }
    else if (stripped.charAt(num) != stripped.charAt(stripped.length() - (num + 1)))
    {
      println(num + " : " + (stripped.length() - (num + 1)) + " : " + (stripped.length()) + " : " + (stripped.charAt(num)) + " : " + (stripped.charAt(stripped.length() - (num + 1))));
      num++;
      k = stripped.length();
      return false;
    }
  }
  return true;
}


