
class Track{

  String y = "";
  String name;
  String album;
  String genre;
  
  Track(XMLElement t){ // here you need to just create a Track object for one track - not all of them
    
    int numkids = t.getChildCount();
    for (int k=0; k<numkids; k++) {
     
      if (t.getChild(k).getContent() != null && t.getChild(k).getContent().equals("Year")) {
        y = t.getChild(k+1).getContent(); // store the year in the object
        //println(y);
      }
      
      if (t.getChild(k).getContent() != null && t.getChild(k).getContent().equals("Name")) {  
        name =  t.getChild(k+1).getContent(); // store the album name in the object
         //println(name);
      }
    }
 }
}

