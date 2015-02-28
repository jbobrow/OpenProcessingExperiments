
class gravSystem {
  
  ArrayList units = new ArrayList();
  ArrayList massiveBodies = new ArrayList();
  int iniVelMag = 2;
  int radiusIn = 1;  
  
  gravSystem(int _numunits, ArrayList _massives) {
    this.massiveBodies = _massives;
    float angle = TWO_PI / _numunits;
    for(int i = 0; i < _numunits; i++) {
      PVector tmppos = new PVector((radiusIn*cos(angle*i))+width/2, (radiusIn*sin(angle*i)+height/2));
      units.add(new movingUnit(3, tmppos, new PVector(iniVelMag*cos(angle*i)+noise(i),iniVelMag*sin(angle*i)),2));
    }
  }
  
  public void addMassBody(massiveUnit _pos) {
    this.massiveBodies.add(_pos);
  }
  
  public void addUnit() {
    this.units.add(new movingUnit(10, new PVector(width/2,height/2), new PVector(0,1), 2));
    println(units.size());
  }
  public void remUnit() {
    this.units.remove(units.size()-1);
  }
  
  void draw() {
    //draw massives
    for (int i =0 ;i < massiveBodies.size();i++) {
      massiveUnit mass = (massiveUnit)massiveBodies.get(i);
      mass.draw();
    }  
    //draw petites
    for (int i =0 ;i < units.size();i++) {
      movingUnit unit = (movingUnit)units.get(i);
      unit.draw();
    }  
  }
  
  void update() {
    for (int i =0 ;i < units.size();i++) {
      movingUnit unit = (movingUnit)units.get(i);
      unit.update(this);
    }      
  }
    
}

