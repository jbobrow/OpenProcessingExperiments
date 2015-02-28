
class Nation {
  Hashtable trait = new Hashtable();
  int uniqueID, xPos, yPos;
  String nameNation;
  
  Nation(int _uniqueID, String _nameNation, int _xPos, int _yPos, int _security, int _innovation, int _jobOpportunity, int _immigrationPolicy) {
    trait.put("security", _security);
    trait.put("innovation", _innovation);
    trait.put("jobOpportunity", _jobOpportunity);
    trait.put("immigrationPolicy", _immigrationPolicy);
    uniqueID = _uniqueID;
    nameNation = _nameNation;
    xPos = _xPos;
    yPos = _yPos;
  }
  
  void display() {
    stroke(0);
    int i = 0;

    // loads rect diameters from hashtable, iterates thru all characteristics
    for (Enumeration e = trait.keys() ; e.hasMoreElements() ;) {
      fill(colorArray[i][0], colorArray[i][1], colorArray[i][2], 20);
      Object characteristic = e.nextElement();
      Object diameterRect = trait.get(characteristic);
      float _diameter = Float.parseFloat(diameterRect.toString());
      int diam = ceil(_diameter)*2;
      noStroke();
      rect(xPos+int(random(-40, 40)), yPos+int(random(-40, 40)), diam, diam);
      i++;
    }

    // displays main rect for each Nation
    fill(0,100);
    text(nameNation, xPos+15, yPos+15);
  } // display for Nation
  
}

