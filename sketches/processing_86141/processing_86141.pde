
//gets the words for a song by an artist

void setup()
{
  getwords mine = new getwords("Zebra", "John Butler Trio");

  mine.get();

  println(mine.songname+" by "+mine.artistname+"\n");
  println("From "+mine.request+"\n");
  
  println(join(mine.words, "\n"));

  exit();
}

void draw()
{
}



class getwords
{
  //made by Joshua Pratt in Processing
  //Saturday 19th January 2013
  
  String songname = "";
  String artistname = "";
  String request = "";

  String words[] = new String[0];

  getwords(String song, String artist)
  {
    songname = song;
    artistname = artist;
  }

  void get()
  {
    request = "http://www.metrolyrics.com/"+join(split(lower(songname), " "), "-")+"-lyrics-"+join(split(lower(artistname), " "), "-")+".html";

    try {
      String load[] = loadStrings(request);
      
      if (load != null)
      {
        process(load);
      }
    }
    catch(Exception e)
    {
      println("Could not load");
    }
  }

  void process(String load[])
  {
    words = split(join(load, "\n"), "'>&#");

    words = subset(words, 1);

    for (int c = 0; c < words.length; c++)
    {
      words[c] = split(words[c], ";</span>")[0];
      String sets[] = split(words[c], ";&#");
      words[c] = join(str(char(int(sets))), "");
    }
  }

  String lower(String i)
  {
    String o = "";
    for (int c = 0;c < i.length(); c++)
    {
      int n = split("ABCDEFGHIJKLMNOPQRSTUVWXYZ", i.charAt(c))[0].length();
      String alph = "abcdefghijklmnopqrstuvwxyz";
      if (n < alph.length())
      {
        o += alph.charAt(n);
      }
      else
      {
        o+= i.charAt(c);
      }
    }
    return o;
  }

  //http://www.metrolyrics.com/never-say-never-lyrics-fray.html
}


