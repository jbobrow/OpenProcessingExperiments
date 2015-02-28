
class Button
{
  int x, y;
  int w, h;
  color basecolor, highlightcolor;
  color currentcolor;

  boolean overRect(int x, int y, int width, int height) { //kijkt of de muis over een button gaat
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } 
    else {
      return false;
    }
  }

  boolean over() 
  {
    if ( overRect(x, y, w, h) ) 
      return true;

    return false;
  }
}

class ImageButtons extends Button 
{
  PImage base;
  PImage roll;
  PImage currentimage;

  ImageButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;
    roll = iroll;
    currentimage = base;
  }

  void update() 
  {
    if (over()) {
      currentimage = roll;
    } 
    else {
      currentimage = base;
    }
  }

  void display() 
  {
    tint(fade, fade, fade); //fade functie 
    image(currentimage, x, y);
  }
}

class GraphButtons extends Button {  
  PImage base;
  PImage gedrukt;
  PImage currentimage;
  GraphButtons (int ix, int iy, int iw, int ih, PImage ibase, PImage igedrukt) {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;
    gedrukt = igedrukt;
    currentimage = base;
  }

  void update() {
    if (mousePressed && over()) {
      if (calorie_groen.over()) {
        B_calorie_groen = true;
        B_calorie_rood = false;
        B_eiwit_groen = false;
        B_eiwit_rood = false;
        B_koolhydraat_groen = false;
        B_koolhydraat_rood = false;
        B_suiker_groen = false;
        B_suiker_rood = false;
        B_vet_groen = false;
        B_vet_rood = false;

        calorie_groen.currentimage = gedrukt;
        calorie_rood.currentimage = calorie_rood.base;
        eiwit_groen.currentimage = eiwit_groen.base;
        eiwit_rood.currentimage = eiwit_rood.base;
        koolhydraat_groen.currentimage = koolhydraat_groen.base;
        koolhydraat_rood.currentimage = koolhydraat_rood.base;
        suiker_groen.currentimage = suiker_groen.base;
        suiker_rood.currentimage = suiker_rood.base;
        vet_groen.currentimage = vet_groen.base;
        vet_rood.currentimage = vet_rood.base;
        counter = 0;
        
        if (counter_getal == 0) {
          counter_getal = 5;
        }
        if (counter > 999) {
          counter_getal = 0;
        }
      }

      else if (calorie_rood.over()) {
        B_calorie_groen = false;
        B_calorie_rood = true;
        B_eiwit_groen = false;
        B_eiwit_rood = false;
        B_koolhydraat_groen = false;
        B_koolhydraat_rood = false;
        B_suiker_groen = false;
        B_suiker_rood = false;
        B_vet_groen = false;
        B_vet_rood = false;
        calorie_groen.currentimage = calorie_groen.base;
        calorie_rood.currentimage = gedrukt;
        eiwit_groen.currentimage = eiwit_groen.base;
        eiwit_rood.currentimage = eiwit_rood.base;
        koolhydraat_groen.currentimage = koolhydraat_groen.base;
        koolhydraat_rood.currentimage = koolhydraat_rood.base;
        suiker_groen.currentimage = suiker_groen.base;
        suiker_rood.currentimage = suiker_rood.base;
        vet_groen.currentimage = vet_groen.base;
        vet_rood.currentimage = vet_rood.base;
        counter = 0;
        if (counter_getal == 0) {
          counter_getal = 5;
        }
        if (counter > 999) {
          counter_getal = 0;
        }
      }

      else if (eiwit_groen.over()) {
        B_calorie_groen = false;
        B_calorie_rood = false;
        B_eiwit_groen = true;
        B_eiwit_rood = false;
        B_koolhydraat_groen = false;
        B_koolhydraat_rood = false;
        B_suiker_groen = false;
        B_suiker_rood = false;
        B_vet_groen = false;
        B_vet_rood = false;       
        calorie_groen.currentimage = calorie_groen.base;
        calorie_rood.currentimage = calorie_rood.base;
        eiwit_groen.currentimage = gedrukt;
        eiwit_rood.currentimage = eiwit_rood.base;
        koolhydraat_groen.currentimage = koolhydraat_groen.base;
        koolhydraat_rood.currentimage = koolhydraat_rood.base;
        suiker_groen.currentimage = suiker_groen.base;
        suiker_rood.currentimage = suiker_rood.base;
        vet_groen.currentimage = vet_groen.base;
        vet_rood.currentimage = vet_rood.base;
        counter = 0;

        if (counter_getal == 0) {
          counter_getal = 5;
        }
        if (counter > 999) {
          counter_getal = 0;
        }
      }
      else if (eiwit_rood.over()) {
        B_calorie_groen = false;
        B_calorie_rood = false;
        B_eiwit_groen = false;
        B_eiwit_rood = true;
        B_koolhydraat_groen = false;
        B_koolhydraat_rood = false;
        B_suiker_groen = false;
        B_suiker_rood = false;
        B_vet_groen = false;
        B_vet_rood = false; 
        calorie_groen.currentimage = calorie_groen.base;
        calorie_rood.currentimage = calorie_rood.base;
        eiwit_groen.currentimage = eiwit_groen.base;
        eiwit_rood.currentimage = gedrukt;
        koolhydraat_groen.currentimage = koolhydraat_groen.base;
        koolhydraat_rood.currentimage = koolhydraat_rood.base;
        suiker_groen.currentimage = suiker_groen.base;
        suiker_rood.currentimage = suiker_rood.base;
        vet_groen.currentimage = vet_groen.base;
        vet_rood.currentimage = vet_rood.base;
        counter = 0;
        if (counter_getal == 0) {
          counter_getal = 5;
        }
        if (counter > 999) {
          counter_getal = 0;
        }
      }
      else if (koolhydraat_groen.over()) {
        B_calorie_groen = false;
        B_calorie_rood = false;
        B_eiwit_groen = false;
        B_eiwit_rood = false;
        B_koolhydraat_groen = true;
        B_koolhydraat_rood = false;
        B_suiker_groen = false;
        B_suiker_rood = false;
        B_vet_groen = false;
        B_vet_rood = false; 
        calorie_groen.currentimage = calorie_groen.base;
        calorie_rood.currentimage = calorie_rood.base;
        eiwit_groen.currentimage = eiwit_groen.base;
        eiwit_rood.currentimage = eiwit_rood.base;
        koolhydraat_groen.currentimage = gedrukt;
        koolhydraat_rood.currentimage = koolhydraat_rood.base;
        suiker_groen.currentimage = suiker_groen.base;
        suiker_rood.currentimage = suiker_rood.base;
        vet_groen.currentimage = vet_groen.base;
        vet_rood.currentimage = vet_rood.base;
        counter = 0;
        if (counter_getal == 0) {
          counter_getal = 5;
        }
        if (counter > 999) {
          counter_getal = 0;
        }
      }
      else if (koolhydraat_rood.over()) {
        B_calorie_groen = false;
        B_calorie_rood = false;
        B_eiwit_groen = false;
        B_eiwit_rood = false;
        B_koolhydraat_groen = false;
        B_koolhydraat_rood = true;
        B_suiker_groen = false;
        B_suiker_rood = false;
        B_vet_groen = false;
        B_vet_rood = false; 
        calorie_groen.currentimage = calorie_groen.base;
        calorie_rood.currentimage = calorie_rood.base;
        eiwit_groen.currentimage = eiwit_groen.base;
        eiwit_rood.currentimage = eiwit_rood.base;
        koolhydraat_groen.currentimage = koolhydraat_groen.base;
        koolhydraat_rood.currentimage = gedrukt;
        suiker_groen.currentimage = suiker_groen.base;
        suiker_rood.currentimage = suiker_rood.base;
        vet_groen.currentimage = vet_groen.base;
        vet_rood.currentimage = vet_rood.base;
        counter = 0;
        if (counter_getal == 0) {
          counter_getal = 5;
        }
        if (counter > 999) {
          counter_getal = 0;
        }
      }

      else if (suiker_groen.over()) {
        B_calorie_groen = false;
        B_calorie_rood = false;
        B_eiwit_groen = false;
        B_eiwit_rood = false;
        B_koolhydraat_groen = false;
        B_koolhydraat_rood = false;
        B_suiker_groen = true;
        B_suiker_rood = false;
        B_vet_groen = false;
        B_vet_rood = false; 
        calorie_groen.currentimage = calorie_groen.base;
        calorie_rood.currentimage = calorie_rood.base;
        eiwit_groen.currentimage = eiwit_groen.base;
        eiwit_rood.currentimage = eiwit_rood.base;
        koolhydraat_groen.currentimage = koolhydraat_groen.base;
        koolhydraat_rood.currentimage = koolhydraat_rood.base;
        suiker_groen.currentimage = gedrukt;
        suiker_rood.currentimage = suiker_rood.base;
        vet_groen.currentimage = vet_groen.base;
        vet_rood.currentimage = vet_rood.base;
        counter = 0;
        if (counter_getal == 0) {
          counter_getal = 5;
        }
        if (counter > 999) {
          counter_getal = 0;
        }
      }

      else if (suiker_rood.over()) {
        B_calorie_groen = false;
        B_calorie_rood = false;
        B_eiwit_groen = false;
        B_eiwit_rood = false;
        B_koolhydraat_groen = false;
        B_koolhydraat_rood = false;
        B_suiker_groen = false;
        B_suiker_rood = true;
        B_vet_groen = false;
        B_vet_rood = false; 
        calorie_groen.currentimage = calorie_groen.base;
        calorie_rood.currentimage = calorie_rood.base;
        eiwit_groen.currentimage = eiwit_groen.base;
        eiwit_rood.currentimage = eiwit_rood.base;
        koolhydraat_groen.currentimage = koolhydraat_groen.base;
        koolhydraat_rood.currentimage = koolhydraat_rood.base;
        suiker_groen.currentimage = suiker_groen.base;
        suiker_rood.currentimage = gedrukt;
        vet_groen.currentimage = vet_groen.base;
        vet_rood.currentimage = vet_rood.base;
        counter = 0;
        if (counter_getal == 0) {
          counter_getal = 5;
        }
        if (counter > 999) {
          counter_getal = 0;
        }
      }

      else if (vet_groen.over()) {
        B_calorie_groen = false;
        B_calorie_rood = false;
        B_eiwit_groen = false;
        B_eiwit_rood = false;
        B_koolhydraat_groen = false;
        B_koolhydraat_rood = false;
        B_suiker_groen = false;
        B_suiker_rood = false;
        B_vet_groen = true;
        B_vet_rood = false; 
        calorie_groen.currentimage = calorie_groen.base;
        calorie_rood.currentimage = calorie_rood.base;
        eiwit_groen.currentimage = eiwit_groen.base;
        eiwit_rood.currentimage = eiwit_rood.base;
        koolhydraat_groen.currentimage = koolhydraat_groen.base;
        koolhydraat_rood.currentimage = koolhydraat_rood.base;
        suiker_groen.currentimage = suiker_groen.base;
        suiker_rood.currentimage = suiker_rood.base;
        vet_groen.currentimage = gedrukt;
        vet_rood.currentimage = vet_rood.base;
        counter = 0;
        if (counter_getal == 0) {
          counter_getal = 5;
        }
        if (counter > 999) {
          counter_getal = 0;
        }
      }

      else if (vet_rood.over()) {
        B_calorie_groen = false;
        B_calorie_rood = false;
        B_eiwit_groen = false;
        B_eiwit_rood = false;
        B_koolhydraat_groen = false;
        B_koolhydraat_rood = false;
        B_suiker_groen = false;
        B_suiker_rood = false;
        B_vet_groen = false;
        B_vet_rood = true; 
        calorie_groen.currentimage = calorie_groen.base;
        calorie_rood.currentimage = calorie_rood.base;
        eiwit_groen.currentimage = eiwit_groen.base;
        eiwit_rood.currentimage = eiwit_rood.base;
        koolhydraat_groen.currentimage = koolhydraat_groen.base;
        koolhydraat_rood.currentimage = koolhydraat_rood.base;
        suiker_groen.currentimage = suiker_groen.base;
        suiker_rood.currentimage = suiker_rood.base;
        vet_groen.currentimage = vet_groen.base;
        vet_rood.currentimage = gedrukt;
        counter = 0;
        if (counter_getal == 0) {
          counter_getal = 5;
        }
        if (counter > 999) {
          counter_getal = 0;
        }
      }
    }
    else {
      
    }
  }

  void display() 
  {
    image(currentimage, x, y);
  }
}


