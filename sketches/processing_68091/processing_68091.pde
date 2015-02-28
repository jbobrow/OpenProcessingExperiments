
ArrayList<Atom> listA ;
int count = 0 ;

void setup ()
{
  size (400,400) ; smooth() ; frameRate(60 ) ;
  listA =            new ArrayList<Atom>();
  background(0) ;
}

void draw()
{   
  fill(150, 5, 5, 40 ) ;
  rect(0,0, width, height) ;
  
  
  for (Atom atm : listA)
  { 
    // First all the voids who work on the atom

    atm.update(listA) ;
    atm.collision(listA) ;

    atm.drag2D() ;

    atm.display() ;    
  }
}

void mousePressed()
{  
  PVector posA = new PVector ( mouseX, mouseY) ;
  for (Atom atm : listA)
  {
    if(atm.insideAtom()) return ;
  }
  count += 1 ;
  Atom atm = new Atom( posA, count) ; 
  listA.add(atm) ;
}


