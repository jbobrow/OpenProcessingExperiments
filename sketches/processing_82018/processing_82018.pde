
//Holds data on a single entry
class Entry
{
  String title;    //Title of the link
  String link;     //Link itself
  String site;     //Site the link is rooted to
};

//Programs main data class
class Data
{
  Entry [] entry;    //Main Data Array
  
  
  //Constructor
  Data()
  {
  }
  
  //Load in data from reddit
  public void loadData(String url)
  {
    //Load data from reddit parser
    String [] input = loadStrings(url);
    
    //Init main array
    entry = new Entry[input.length];
    
    //Add entries 1 by 1 to main data array
    for(int i = 0; i < input.length; i++)
    {
      //Split submission into constituent pieces of data
      String temp[] = split(input[i], '%');
      
      //Add these to the main array
      entry[i] = new Entry();
      entry[i].title = temp[0];
      entry[i].site = temp[2];
    }
  }
  
  //Searches all entries titles for this
  //Returns int array of positions
  int[] search(String input)
  {
    int[] hits = new int[1];
    hits[0] = -1;
    
    //Loop through array
    for(int i = 0; i < entry.length; i++)
    {
      //Check if it contains the input
      if(entry[i].title.toLowerCase().contains(input.toLowerCase()))
      {
        //Check if this is the first entry
        if(hits[0] == -1)
        {
          //Add current iterator number to the ID array
          hits[0] = i;
        } else
        {
          //Add current iterator number to the ID array
          hits = addElement(hits, i);
        }
      }
    }
    
    //Return ID array
    return hits;
  }
};

//Array add element function
int[] addElement(int[] in, int add)
{
  int [] newArray = Arrays.copyOf(in, in.length + 1);
  newArray[in.length] = add;
  return newArray; 
}

