
// Show or Grow 
// 
// User controlled inputs 
// 'g' : toggle grid visibility 
// 'm' : toggle multi/single color
// 'h' : toggle hand only/time rings
// 's' : toggle seconds visibility 
// 'z' : toggle random/real time 
// 'd' : toggle digital time display 
// 'r' : decrease(-) internal radius 
// 'R' : increase(+) internal radius 
// 'p' : decrease(-) point size 
// 'P' : increase(+) point size 
// '1' : my fav 
// '2' : my fav -1 
// '3' : my fav -2 
// '4' : randomize everything 
// 
/////////////////////////////////////////////////////////////////// 

// Globals  
int csize = 400; 
float startrad = 40; 
boolean plotgrid = false; 
boolean plotsec = false; 
boolean handonly = true; 
boolean multicolor = false; 
boolean randtime = false; 
boolean showtime = false; 
boolean nokpstart = true; 
int r,g,b;
int trans = 63;
PFont font;  
float tickstroke = 10;   
float raddelta = (csize/2 - startrad)/12; 
int hh,mm, inittime; 
int fsize = 32; 
void setup() { 
  size(csize, csize); 
  smooth(); 
  stroke(0x33, 0xff, 0x00, 127); 
  key = '4';  
  keyPressed = true; 
} 

void draw() { 
  background(0); 
  fill(80); 
  strokeWeight(tickstroke); 
  // Input controls 
  if(keyPressed) { 
    if (key == 'g') { 
      plotgrid = !plotgrid; 
    } 
    if (key == 's') { 
      plotsec = !plotsec; 
    } 
    if (key == 'h') { 
      handonly = !handonly; 
    } 
    if (key == 'm') { 
      multicolor = !multicolor; 
      r = int(random(255)); 
      g = int(random(255)); 
      b = int(random(255));
    } 
    if (key == 'T' && tickstroke < csize/2) { 
      tickstroke++; 
    } 
    if (key == 't' && tickstroke > 1) { 
      tickstroke--; 
    } 
    if (key == 'R' && startrad < csize/2) { 
      startrad++; 
      raddelta = (csize/2 - startrad)/12; 
    } 
    if (key == 'r' && startrad > 1) { 
      startrad--; 
      raddelta = (csize/2 - startrad)/12; 
    } 
    if (key == 'z') { 
      randtime = !randtime; 
      hh = int(random(24)); 
      mm = int(random(60)); 
    } 
    if (key == 'd') {   
      showtime = !showtime;   
    }  

    // Decided I would create presets in order I liked best (1 being best) 
    if (key == '1') { 
      plotgrid = false; 
      plotsec = false; 
      handonly = true; 
      multicolor = false; 
      startrad = 40; 
      tickstroke = 10;   
    } 
    else if (key =='2') { 
      plotgrid = false; 
      plotsec = true; 
      handonly = true; 
      multicolor = false; 
      startrad = 40; 
      tickstroke = 10;   
    } 
    else if (key =='3') { 
      plotgrid = false; 
      plotsec = true; 
      handonly = false; 
      multicolor = false; 
      startrad = 40; 
      tickstroke = 10;   
    } 
    // Randomize almost everything 
    else if ((key =='4' & !nokpstart) | (key =='4' & nokpstart & (second()%5 == 0)))  { 
      plotgrid = boolean(int(random(2))); 
      plotsec = boolean(int(random(2))); 
      handonly = boolean(int(random(2))); 
      multicolor = boolean(int(random(2)));
      showtime = boolean(int(random(2)));
      randtime = boolean(int(random(2)));
      r = int(random(255)); 
      g = int(random(255)); 
      b = int(random(255));
      startrad = random(100); 
      tickstroke = random(20); 
    } 
    stroke(r, g, b, trans); 
    delay(200); 
  } 
  if (!keyPressed && nokpstart) { 
    nokpstart = false;
  } 
  if (!randtime) { 
    hh = hour(); 
    mm = minute(); 
  } 
  if (!handonly) { 
    // Plot full hours past 
    for (int hr = 1; hr <= hh %12; hr++){ 
      for (int a = 0; a < 360; a+=6) { 
        if (multicolor) { 
          r = int(random(255)); 
          g = int(random(255)); 
          b = int(random(255));
          stroke(r, g, b, trans); 
        } 
        if (hr%3 == 0) {
          stroke(r,g,b,trans*2);
        } 
        else {          
          stroke(r,g,b,trans);
        }
        float x = csize/2 + ( cos(radians(a)) * (hr * raddelta + startrad) ); 
        float y = csize/2 + ( sin(radians(a)) * (hr * raddelta + startrad) ); 
        point(x, y); 
      } 
    } 
    // Plot partial hour 
    int hr = hh%12 + 1;  
    for (int i = 0; i <= mm; i++) { 
      float j = map(i, 0, 60, 0, TWO_PI) - HALF_PI; 
      if (multicolor) { 
        r = int(random(255)); 
        g = int(random(255)); 
        b = int(random(255));
        stroke(r, g, b, trans); 
      } 
      if (hr%3 == 0) {
        stroke(r,g,b,trans*2);
      } 
      else {          
        stroke(r,g,b,trans);
      }
      point(csize/2 + (cos(j) * (hr * raddelta + startrad)), csize/2 + (sin(j) * (hr * raddelta + startrad))); 
    } 
  } 
  else { 
    float j = map(mm, 0, 60, 0, TWO_PI) - HALF_PI; 
    strokeWeight(1); 
    line(csize/2,csize/2,csize/2 + cos(j) * startrad, csize/2 + sin(j) * startrad); 
    strokeWeight(tickstroke); 
    for (int hr = 1; hr <= hh%12; hr++){ 
      if (multicolor) { 
        r = int(random(255)); 
        g = int(random(255)); 
        b = int(random(255));
        stroke(r, g, b, trans); 
      } 
      if (hr%3 == 0) {
        stroke(r,g,b,trans*2);
      } 
      else {          
        stroke(r,g,b,trans);
      }
      point(csize/2 + (cos(j) * (hr * raddelta + startrad)), csize/2 + (sin(j) * (hr * raddelta + startrad))); 
    } 
  } 
  if (plotsec) { 
    strokeWeight(tickstroke/2); 
    for (int i = 0; i <= second(); i++) { 
      float j = map(i, 0, 60, 0, TWO_PI) - HALF_PI; 
      point(csize/2 + (cos(j) * ((hh%12+1) * raddelta + startrad)), csize/2 + (sin(j) * ((hh%12+1) * raddelta + startrad))); 
    } 
  } 
  if (showtime) {  
    font = createFont("FFScala", fsize);   
    textFont(font);   
    String txt = String.format("%02d:%02d",hh,mm); 
    text(txt ,0,fsize);  

  }  
  if (plotgrid) { 
    strokeWeight(.5); 
    line (0,csize/2,csize,csize/2); 
    line (csize/2,0,csize/2, csize); 
    noFill(); 
    ellipse(csize/2,csize/2,csize,csize);  
  } 
} 





