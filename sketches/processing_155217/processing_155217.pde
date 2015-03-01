
class DataSaver
{
  HashMap tags;

  color c = color (random (120, 255));
  int startID;
  int endID;
  String name;
  Photos p;
  DataSaver ()
  {
    int dice = (int) random (3);
    if (dice==0 )
    {
      c = #A75265;
    }
    else if (dice == 1) c = color (254, 190, 126);
    else c = #ffedbc;
    
  }

  void setColor (float minVal, float maxValue)
  {
    if (p.p.size() / (maxValue / minVal) < 0.5)
    {
      c = lerpColor (#ffedbc, color (254, 190, 126), map (p.p.size() / (maxValue / minVal), 0, 0.5, 0, 1));
    }
    else  c = lerpColor (color (254, 190, 126), #A75265, map (p.p.size() / (maxValue / minVal), 0.5, 1, 0, 1));
  }

  void setTags ()
  {
    tags = new HashMap();

    for (int i = 0; i < p.p.size(); i++)
    {
      for (int j = 0; j < p.p.get(i).tags.length; j++)
      {
        String tag = p.p.get(i).tags [j];

        if (tags.containsKey (tag))
        {
          Integer value = (Integer) tags.get (tag);
          value += 1;
          tags.put (tag, value);
        }
        else
        {
          Integer value = 1;
          tags.put (tag, value);
        }
      }
    }
  }

  HashMap getTags ()
  {
    if (tags == null || tags.size () == 0) setTags();
    return tags;
  }

  void printHashMap ()
  {
    if (tags == null || tags.size() == 0) setTags ();
    Iterator i = tags.entrySet().iterator();
    while (i.hasNext ())
    {
      Map.Entry pairs = (Map.Entry)i.next();
      println (pairs.getKey() + ", " + pairs.getValue());
      //System.out.println(pairs.getKey() + " = " + pairs.getValue());
      // i.remove(); // avoids a ConcurrentModificationException
    }
  }

  boolean containsTag (String tag)
  {
    if (tags == null || tags.size() == 0) setTags ();
    return tags.containsKey (tag);
  }
  
 

}

class Photos
{
  ArrayList <Photo> p;

  Photos ()
  {
    p = new ArrayList();
  }

  void addPhoto (Photo pp)
  {
    p.add (pp);
  }
}

class Photo 
{
  color c;
  int views;
  String [] tags;

  Photo ()
  {
    int dice = (int) random (3);
    if (dice==0 )
    {
      c = #A75265;
    }
    else if (dice == 1) c = color (254, 190, 126);
    else c = #ffedbc;
  }
}


