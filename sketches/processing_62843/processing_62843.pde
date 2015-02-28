
void write(float cl, float cl1, float _xpos, float _ypos) {

  
  apart = split(expandedText, ",");
  apart1 = split(expandedText1, ",");
  apart2 = split(expandedText2, ",");
  apart3 = split(expandedText3, ",");


  words.beginDraw();
  words.background(255);
  words.textFont(font2, 17);
  words.noStroke();
  words.fill(0);
  for(int i=0; i<apart.length; i++) {
    words.text(apart[i],_xpos+random(cl,cl1)*i,_ypos+random(cl,cl1)*i);
  }
  for(int j=0; j<apart1.length; j++) {
    words.text(apart1[j],_xpos+random(cl,cl1)*j,_ypos+random(cl,cl1)*j);
  }
  for(int k=0; k<apart2.length; k++) {
    words.text(apart2[k],_xpos+random(cl,cl1)*k,_ypos+random(cl,cl1)*k);
  }
  for(int i=0; i<apart3.length; i++) {
    words.text(apart3[i],_xpos+random(cl,cl1)*i,_ypos+random(cl,cl1)*i);
  }
  words.endDraw();
}


