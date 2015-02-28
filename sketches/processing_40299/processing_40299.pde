
class Author
{

  String name;
  String Uid = null;
  int H = 70;
  int S = 0;
  int B = 0;
  
  ArrayList authorsNodes;
  ArrayList authorsComments;
  ArrayList authorsVotes;
  
  boolean active = true;

  Author(String iName)
  {
    name = iName;
    authorsNodes = new ArrayList();
    authorsComments = new ArrayList();
    authorsVotes = new ArrayList();
  }

  void setColor(float iH, float iS, float iB)
  {
    colorMode(HSB, 360, 100, 100);
    H = int(iH);
    S = int(iS);
    B = int(iB);
    //println(H +" "+ S +" "+ B);
    colorMode(RGB,255);
  }

  //GET METHODS//
  color getH()
  {
    return H;
  }

  color getS()
  {
    return S;
  }

  color getB()
  {
    return B;
  }
  
  String getAuthor()
  {
    return name;
  }
  
  String getUid()
  {
    return Uid;
  }
  
  //SET METHODS//
  
  void addAuthorsNode(String title)
  {
   authorsNodes.add(title);
   //println(name+ " made: "+title); 
  }
  
  void addAuthorsComment(Comment C)
  {
   authorsComments.add(C);
   //println(name+" posted a comment"); 
  }
  
  void setUid(String iUid)
  {
   Uid = iUid;
  //println(name+"'s Uid is: "+Uid); 
  }
  
    void setActive()
  {
   active = true; 
  }
  
    void setInActive()
  {
   active = false; 
  }
}


