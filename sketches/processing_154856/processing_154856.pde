

void loadJson ()
{
  flickrData = new JSONArray();
  for (int i = 0; i < filePath.length; i++) 
  {
    //
    JSONArray ja = loadJSONArray (filePath [i]);
    flickrData.append (ja);
    //flickrData.setJSONArray (flickrData.size()-1, ja);
  }
  // println (flickrData);
  println (flickrData.size());
  //println (flickrData);
}

void prepareData ()
{
  tags = new String [0];

  for (int i = 0; i < flickrData.size (); i++)
  {
    JSONArray a = flickrData.getJSONArray(i);
    
    for (int j = 0; j < a.size (); j++)
    {
      JSONObject p = a.getJSONObject(j); 

      String name = p.getString ("author");
      String tagList = p.getString ("tags");

      tags = (String [] ) append (tags, tagList);
      tags = (String [] ) append (tags, name);
    }
  }
}


