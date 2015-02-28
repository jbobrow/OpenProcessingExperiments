

pntClass adventureTime( int advTim, PImage aT ) {
  
  pntClass pnt;
  
  if(advTim == 0) {
    
    image(aT, 710,300);
    pnt = new pntClass(710,300);
    
  } else if(advTim <= 3) {
    
    image(aT, 646,341);
    pnt = new pntClass(646,341);
    
  } else if(advTim <= 8) {
    
    image(aT, 581,379);
    pnt = new pntClass(581,379);
    
  } else {
    
    image(aT, 516,416);
    pnt = new pntClass(516,416);
    
  }
  
  return pnt;
  
}

