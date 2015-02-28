
class SliderHorizontal
{
  // global parameter
  PVector posSlider, sizeSlider ;
  int follow;              // follow the molette
  color colorSlider, colorSliderBorder ;
  int thicknessSlider ;
  
  // parameter slider simple
  float spos, newspos;    // molette position
  float sposMin, sposMax;   // max and min values of slider
  boolean inside ;           // cursor in or out of the button
  boolean locked;
  
  // parameter slider range
  float sposA, sposB, newsposA, newsposB;    // molette position
  float sposMinA, sposMinB, sposMaxA, sposMaxB;   // max and min values of slider
  boolean insideA, insideB ;           // cursor in or out of the button
  boolean lockedA, lockedB ;
  


  SliderHorizontal (PVector posSlider_, PVector sizeSlider_, int follow_, color colorSlider_, color colorSliderBorder_, int thicknessSlider_)
  {
    sizeSlider = sizeSlider_ ;
    posSlider = posSlider_ ;
    follow = follow_;
    colorSlider = colorSlider_   ; colorSliderBorder = colorSliderBorder_ ; thicknessSlider = thicknessSlider ; 
    // starting position of molette simple
    spos = posSlider.x + sizeSlider.x /2 - sizeSlider.y /2;
 
    // starting position of molette range
    sposA = posSlider.x + sizeSlider.x /3 - sizeSlider.y /2;
    sposB = posSlider.x + (sizeSlider.x - (sizeSlider.x /3)) - sizeSlider.y /2; 
       
  }
  //////////UPDATE/////////////////////
  /////////
  // Simple
  void updateSimple() {
    newspos = spos;
    sposMin = posSlider.x  ;
    // sposMin = posSlider.x -(sizeSlider.y /2.0)  ;
    sposMax = posSlider.x + sizeSlider.x - sizeSlider.y;
    
    if(detection()) {
      inside = true;
    } else {
      inside = false;
    }
    if(mousePressed && inside)    locked = true ;
    if(!mousePressed)             locked = false ;
    if(locked)                    newspos = constrain(mouseX -sizeSlider.y /2, sposMin, sposMax) ;
    if(abs(newspos - spos) > 1)   spos = spos + (newspos-spos)/follow ;
  }
  ///////
  // Range
  void updateRange() {
    // update the position of molette A
    newsposA = sposA;
    sposMinA = posSlider.x ;
    sposMaxA = sposB -(sizeSlider.y /2.0);
    // update the position of molette B
    newsposB = sposB;
    sposMinB = sposA +(sizeSlider.y /2.0);
    sposMaxB = posSlider.x + sizeSlider.x - sizeSlider.y ;
    
    // detection et update molette A
    if(detectionMolette(sposA))   { insideA = true; }    else { insideA = false ; }
    if(mousePressed && insideA )    lockedA = true ;
    if(!mousePressed)               lockedA = false ;
    if(lockedA)                     newsposA = constrain(mouseX -sizeSlider.y /2, sposMinA, sposMaxA) ;
    if(abs(newsposA - sposA) > 1)   sposA = sposA + (newsposA-sposA)/follow ;
    
    // detection et update molette B
    if(detectionMolette(sposB))  { insideB = true; }    else { insideB = false ; }
    if(mousePressed && insideB )   lockedB = true ;
    if(!mousePressed)              lockedB = false ;
    if(lockedB)                    newsposB = constrain(mouseX -sizeSlider.y /2, sposMinB, sposMaxB) ;
    if(abs(newsposB - sposB) > 1)  sposB = sposB + (newsposB-sposB)/follow ;
  }
  
  /////////SLIDER///////////////
  //CLASSIC
  void slider() {
    // draw slider
    strokeWeight(thicknessSlider) ; stroke (colorSliderBorder) ;
    fill(colorSlider);
    rect(posSlider.x, posSlider.y, sizeSlider.x, sizeSlider.y);
     
  }
  //SPECIAL
  void sliderColor() {
    // draw slider
    int px = round(posSlider.x) ;
    int py = round(posSlider.y) ;
    int sx = round(sizeSlider.x) ;
    int sy = round(sizeSlider.y) ;
    //make a slider pixel by pixel
    for ( int i = px ; i < px + sx ; i++ ) {
      for ( int j = py ; j < py + sy ; j++ ) {
        color c = color(i, 255, 255 ) ; // color, density and saturation of each pixel, we're in HSB mode
        set (i, j, c ) ; // make the slider, we're in HSB mode
      }
    }
  }
  
  //////////////////MOLETTE/////////////////
  //molette simple
  void molette (PVector ratio, color moletteIN, color moletteOUT, color moletteBorderIN, color moletteBorderOUT, int moletteThickness, int typeOfMolette) { // button, stick... no word for that in english !!!!
    
    strokeWeight (moletteThickness ) ;
    if(inside || locked) {
      stroke(moletteBorderIN ) ;
      fill(moletteIN);
    } else {
      stroke(moletteBorderOUT ) ;
      fill(moletteOUT);
    }
    //draw molette and choice of type of Molette
    // calcul the position of molette
    float posMolY = posSlider.y -( sizeSlider.y * ( (ratio.y /2.0) -0.5 ) ) ;
    // update the size of molette by the ratio
    float sizeMolX = sizeSlider.y *ratio.x ;
    float sizeMolY = sizeSlider.y *ratio.y ;
    // calcul the lag who result of the ratio size
    float lagX = sizeMolX - sizeSlider.y ;
    // calcul the curve of the lag
    float posMolX = map(spos, sposMin, sposMax, sposMin, sposMax -lagX ) ;
    // choice of draw of molette
    if ( typeOfMolette < 1 || typeOfMolette > 2 ) rect(posMolX, posMolY, sizeMolX, sizeMolY);
    if ( typeOfMolette == 1  ) rect(posMolX, posMolY, sizeMolX, sizeMolY);
    if ( typeOfMolette == 2  ) { 
      ellipseMode(CORNER) ;
      ellipse(posMolX, posMolY, sizeMolX, sizeMolY);
    }
  }
  
  //molette range
  void moletteRange (PVector ratio, color moletteIN, color moletteOUT, color moletteBorderIN, color moletteBorderOUT, int moletteThickness, int typeOfMolette) { // button, stick... no word for that in english !!!!
    
    strokeWeight (moletteThickness ) ;

    
    //draw molette and choice of type of Molette
    //molette A
    if(insideA || lockedA ) {
      stroke(moletteBorderIN );
      fill(moletteIN);
    } else {
      stroke(moletteBorderOUT ) ;
      fill(moletteOUT);
    }
    //draw molette and choice of type of Molette
    // calcul the position of molette
    float posMolAY = posSlider.y -( sizeSlider.y * ( (ratio.y /2.0) -0.5 ) ) ;
    // update the size of molette by the ratio
    float sizeMolAX = sizeSlider.y *ratio.x ;
    float sizeMolAY = sizeSlider.y *ratio.y ;
    // calcul the lag who result of the ratio size
    float lagAX = sizeMolAX - sizeSlider.y ;
    // calcul the curve of the lag
    float posMolAX = map(sposA, sposMinA, sposMaxA, sposMinA, sposMaxA -lagAX ) ;
    // choice of draw of molette
    if ( typeOfMolette < 1 || typeOfMolette > 2 ) rect(posMolAX, posMolAY, sizeMolAX, sizeMolAY);
    if ( typeOfMolette == 1  ) rect(posMolAX, posMolAY, sizeMolAX, sizeMolAY);
    if ( typeOfMolette == 2  ) { 
      ellipseMode(CORNER) ;
      ellipse(posMolAX, posMolAY, sizeMolAX, sizeMolAY);
    }
    
    //molette B
    if(insideB || lockedB ) {
      stroke(moletteBorderIN );
      fill(moletteIN);
    } else {
      stroke(moletteBorderOUT ) ;
      fill(moletteOUT);
    }
    // calcul the position of molette
    float posMolBY = posSlider.y -( sizeSlider.y * ( (ratio.y /2.0) -0.5 ) ) ;
    // update the size of molette by the ratio
    float sizeMolBX = sizeSlider.y *ratio.x ;
    float sizeMolBY = sizeSlider.y *ratio.y ;
    // calcul the lag who result of the ratio size
    float lagBX = sizeMolBX - sizeSlider.y ;
    // calcul the curve of the lag
    float posMolBX = map(sposB, sposMinB, sposMaxB, sposMinB, sposMaxB -lagBX ) ;
    // choice of draw of molette
    if ( typeOfMolette < 1 || typeOfMolette > 2 ) rect(posMolBX, posMolBY, sizeMolBX, sizeMolBY);
    if ( typeOfMolette == 1  ) rect(posMolBX, posMolBY, sizeMolBX, sizeMolBY);
    if ( typeOfMolette == 2  ) { 
      ellipseMode(CORNER) ;
      ellipse(posMolBX, posMolBY, sizeMolBX, sizeMolBY);
    }
  }
  
  ////////////RETURN
  boolean detection() { 
    if(mouseX > posSlider.x && mouseX < posSlider.x + sizeSlider.x && mouseY >  posSlider.y && mouseY < posSlider.y + sizeSlider.y) {
      return true;
    } else {
      return false;
    }
  }
  //detection on the molette
  boolean detectionMolette(float sposN) {
    if(mouseX > sposN && mouseX < sposN + sizeSlider.y && mouseY > posSlider.y && mouseY < posSlider.y + sizeSlider.y) {
      return true;
    } else {
      return false;
    }
  }
  float pos() { 
    // to get the value
    return ( ( spos-posSlider.x) / (sizeSlider.x -sizeSlider.y) ) ;
  }
  // return molette position on the slider
  float posA() { 
    // to get the value
    return ( ( sposA-posSlider.x) / (sizeSlider.x -sizeSlider.y) ) ;
  }
    // return molette position on the slider
  float posB() { 
    // to get the value
    return ( ( sposB-posSlider.x) / (sizeSlider.x -sizeSlider.y) ) ;
  }
  
}

