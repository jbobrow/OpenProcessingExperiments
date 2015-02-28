
class Person {
  Hashtable trait = new Hashtable();
  int xPos = int(random(50, 350));
  int yPos = int(random(50, 350));
  String namePerson;

  // constructor
  Person(float _strength, float _intelligence, float _wisdom, 
  float _charisma, float _stamina, float _wit, float _humor, 
  float _pWeight, float _pHeight, float _education, float _age, 
  float _creativity, float _responsibility, float _discipline, 
  float _honesty, float _religiosity, float _entrepreneurialism, 
  float _appearance, String _namePerson) {
    trait.put("strength", _strength);
    trait.put("intelligence", _intelligence);
    trait.put("wisdom", _wisdom);
    trait.put("charisma", _charisma);
    trait.put("stamina", _stamina);
    trait.put("wit", _wit);
    trait.put("humor", _humor);
    _pWeight = round(_pWeight / 20);
    trait.put("pWeight", _pWeight);
    _pHeight = round(_pHeight / 10);
    trait.put("pHeight", _pHeight);
    trait.put("education", _education);
    trait.put("age", _age);
    trait.put("creativity", _creativity);
    trait.put("responsibility", _responsibility);
    trait.put("discipline", _discipline);
    trait.put("honesty", _honesty);
    trait.put("religiosity", _religiosity);
    trait.put("entrepreneurialism", _entrepreneurialism);
    trait.put("appearance", _appearance);
    namePerson = _namePerson;
  } // end Person method

  void display() {
    int i = 0;

    // loads circle diameters from hashtable, iterates thru all characteristics
    for (Enumeration e = trait.keys() ; e.hasMoreElements() ;) {
      fill(colorArray[i][0], colorArray[i][1], colorArray[i][2], 100);
      Object diameterCirc = trait.get(e.nextElement());
      float _diameter = Float.parseFloat(diameterCirc.toString());
      int diam = round(_diameter)*2;
      ellipse(xPos+int(random(-40, 40)), yPos+int(random(-40, 40)), diam, diam);
      i++;
    }

    // displays main circle for each Person
    fill(0);
    ellipse(xPos, yPos, 20, 20); // overall rating, in middle
    text(this.namePerson, xPos+15, yPos+15);
  } // display for Person
} // end Person class


